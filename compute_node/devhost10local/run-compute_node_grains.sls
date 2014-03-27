include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-run-grains-installation:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.compute_node_grains
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-grains-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-grains-deploy
