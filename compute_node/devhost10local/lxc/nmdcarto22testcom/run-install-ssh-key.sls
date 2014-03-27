include:
  - makina-states.cloud.generic.hooks.vm
  - makina-states.cloud.generic.genssh
devhost10.local-nmdcarto22.test.com-lxc.vm-install-ssh-key-inst:
  salt.state:
    - tgt: [nmdcarto22.test.com]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.lxc.nmdcarto22testcom.container_ssh_key
    - concurrent: True
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-install-ssh-key
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-install-ssh-key
