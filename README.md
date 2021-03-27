## Starting Kubernetes Cluster on GCP

1. Cluster basics:
  - `Name:` anf-py
  - `Zone:` us-central1-c
2. Node pool details:
  - `Number of Nodes:` 3
  - `Enable Autoscaling:` True
  - `Minimum Number of Nodes:` 3
  - `Maximum Number of Nodes:` 30
3. Nodes:
  - `Boot Disk Type:` SSD
4. Node Metadata:
  - `Kubernetes Labels:`
    - **Key:** hub.jupyter.org/node-purpose
    - **Value:** core

## Connecting to Cluster using Cloud Shell

1. Connect to the cluster:

```sh
$ gcloud container clusters get-credentials anf-py --zone us-central1-c --project my-project-1569441454154
```

2. Clone the *setup-anfpy* repo for setup:

```sh
$ git clone https://github.com/dkharazi/setup-anfpy.git
```

3. Upload notebooks to the cluster:

```sh
$ bash ./setup-anfpy/setup.sh
```

```js
// App.js
class ClassClick extends Component {
  clickHandler() {
    console.log('Button clicked');
  }
  
  render() {
    return (
      <div>
        <button onClick={this.clickHandler}>
          Click
        </button>
      </div>
    )
  }
}
```

```python
@app.rout('/')
def hello():
  print('hello' + 'world')
  print(True)
  print(50)
```
