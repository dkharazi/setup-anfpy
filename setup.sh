# https://zero-to-jupyterhub.readthedocs.io/en/latest/kubernetes/google/step-zero-gcp.html
# https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-helm.html
# https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-jupyterhub.html

# Download & Set Up Helm
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=dkharazif@gmail.com
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
# kubectl --namespace kube-system create serviceaccount tiller
# kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
# helm init --service-account tiller
# kubectl patch deployment tiller-deploy --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/containers/0/command", "value": ["/tiller", "--listen=localhost:44134"]}]'

# Add security token to config.yaml
sed -i 's/<RANDOM_HEX>/'"$( openssl rand -hex 32 )"'/g' config.yaml

# Set Up JupyterHub
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm upgrade --cleanup-on-fail --install jhub jupyterhub/jupyterhub --namespace jhub --create-namespace --version=0.10.6 --values config.yaml
# helm upgrade --install jhub jupyterhub/jupyterhub --namespace jhub --version 0.8.2 --values config.yaml
