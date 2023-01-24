# Deploy Kubernetes and JupyterHub with GPU support

The Jetstream 2 cloud includes [90 GPU nodes with 4 NVIDIA A100 each](https://docs.jetstream-cloud.org/overview/config/).
If we want to leverage the GPUs inside Kubernetes pods, for example JupyterHub users, we both need to have a GPU-enabled ContainerD runtime and a compatible Docker image based off NVIDIA images.

## Deploy Kubernetes with NVIDIA runtime

Kubespray has built-in support for NVIDIA runtime, therefore it is just a matter of following the [standard Kubespray deployment tutorial](https://www.zonca.dev/posts/2022-03-31-jetstream2_jupyterhub), but using the `branch_v2.18.0_gpu` branch of the `zonca/jetstream_kubespray` Github repository instead of the `branch_v2.18.0` branch.
You can also check in detail what are the changes required by looking at [this Pull Request](https://github.com/zonca/jetstream_kubespray/pull/20)

Next we need to install the `k8s-device-plugin`, at the moment it is just necessary to execute:

    kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v0.13.0/nvidia-device-plugin.yml

However, make sure you check the latest [`k8s-device-plugin` documentation](https://github.com/NVIDIA/k8s-device-plugin).

For testing, you can run a simple GPU job:

```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: gpu-pod
spec:
  restartPolicy: Never
  containers:
    - name: cuda-container
      image: nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda10.2
      resources:
        limits:
          nvidia.com/gpu: 1 # requesting 1 GPU
  tolerations:
  - key: nvidia.com/gpu
    operator: Exists
    effect: NoSchedule
EOF
```

and check the logs:

    kubectl logs gpu-pod

The output should be:

```
[Vector addition of 50000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 196 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
```

## Access GPUs from JupyterHub

A Docker image derived from the NVIDIA Tensorflow image is available [on DockerHub as `zonca/nvidia-tensorflow-jupyterhub`](https://hub.docker.com/r/zonca/nvidia-tensorflow-jupyterhub), the relevant [Dockerfile is available on Github](https://github.com/zonca/jupyterhub-deploy-kubernetes-jetstream/blob/master/gpu/nvidia-tensorflow-jupyterhub/Dockerfile).

Also notice that this is configured to run JupyterHub `3.0.0` which should be used in conjunction with the Zero to JupyterHub Helm chart version `2.0.0`.

Then it is just a matter of modifying the `install_jhub.sh` script to pickup the additional configuration file by adding:

    --values gpu/jupyterhub_gpu.yaml

For testing, I have modified the Tensorflow tutorial for beginners to run on GPU, it is available [in this Gist](https://gist.github.com/zonca/3da7896544da9881fe9081a441964a26).

You can download it to your local machine and upload it to the GPU-enabled single user instance on Jetstream.

During execution, the 3rd cell should show the available GPU device:

    [PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]

then the Notebook should execute to completion with no errors, printing for each operation the device which executed it, i.e. the GPU.
