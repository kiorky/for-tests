cdevhost10.local-nmdcarto22.test.com-lxc.computenode.sls-generator-for-hostnode-inst:
  salt.state:
    - tgt: [nmdcarto22.test.com]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.lxc.nmdcarto22testcom.container_hostfile
    - concurrent: True
    - watch:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-hostsfiles-deploy
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-hostsfiles-deploy
