include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-run-firewall-installation:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.compute_node_firewall
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-firewall-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-firewall-deploy
