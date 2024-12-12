# InstructLab CUDA Container

![image](/img/action.png)

**!!!DISCLAIMER!!!**

This is a Proof Of Concept. There is some VERY hacky code in here and is only meant to be used for fun and testing, see below on how to use this:

**Requirements:**

* Linux
* NVIDIA GPU(s)
* Podman

**How to deploy:**

1. [Make sure you have NVIDIA Container Toolkit installed](https://docs.nvidia.com/ai-enterprise/deployment/rhel-with-kvm/latest/podman.html)
2. `sudo podman run -d --device nvidia.com/gpu=all -p 8080:8080 quay.io/k8sland/instructlab-nvidia-web`
3. Visit https://localhost:8080
4. Confirm you can see your GPU(s)

**How to use:**
1. Supply your Hugging Face API Key:

Recommended **READ ONLY** key. We go through your `config.yaml` and auto-download your models. If not supplied, your API key may not find it.

2. Click and drag your `config.yaml`:

IMPORTANT. Make sure your `config.yaml` has been properly setup for ACCELERATION (ex. `device: cuda`) and the correct number of GPU(s) are supplied (ex. `nproc_per_node: 2`)

3. Click and drag your knowledge or skills files:

`jsonl` files MUST have either `knowledge` or `skills` in the file name to be auto-detected. Recommended to supply ONLY ONE since if you supply knowledge AND skills it'll do multi-phase training (and requires A LOT of VRAM).

4. Start training:

When training starts, look at the log as well as the **FILES** section below. There your files will be clickable for download, specifically your `safetensors` and configuration files for training.
