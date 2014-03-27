include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-cloud-generic-inst-host-postsetup-inst:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.compute_node_hostfile
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-hostsfiles-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-hostsfiles-deploy
