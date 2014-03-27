include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-lxc-install-base-imgs:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.lxc.images-templates
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-images-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-images-deploy
