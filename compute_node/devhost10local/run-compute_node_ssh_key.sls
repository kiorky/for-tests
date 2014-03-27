include:
  - makina-states.cloud.generic.hooks.compute_node
devhost10.local-gen-lxc-host-install-ssh-key:
  salt.state:
    - tgt: [devhost10.local]
    - expr_form: list
    - sls: cloud-controller.compute_node.devhost10local.compute_node_ssh_key
    - concurrent: True
    - watch:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-pre-host-ssh-key-deploy
    - watch_in:
      - mc_proxy: cloud-devhost10.local-generic-compute_node-post-host-ssh-key-deploy
