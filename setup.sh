# Download & Set Up Helm
# https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-helm.html

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
kubectl --namespace kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
kubectl patch deployment tiller-deploy --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/containers/0/command", "value": ["/tiller", "--listen=localhost:44134"]}]'


# Set Up JupyterHub
# https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-jupyterhub.html

sed -i 's/<RANDOM_HEX>/'"$( openssl rand -hex 32 )"'/g' config.yaml  # add Security Token to config.yaml
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm upgrade --install jhub jupyterhub/jupyterhub --namespace jhub --version 0.8.2 --values config.yaml
