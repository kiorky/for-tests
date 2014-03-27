cdevhost10.local-lxcgrains.computenode.sls-generator-for-hostnode-inst:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.lxc.run-computenodelxc_grains
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-computenode-pre-grains-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-computenode-post-grains-deploy
