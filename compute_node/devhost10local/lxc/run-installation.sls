include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-inst-lxc-images-templates:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.lxc.installation
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-virt-type-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-virt-type-deploy
