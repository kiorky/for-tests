include:
  
  - makina-states.cloud.generic.controller.install
  - cloud-controller.compute_node.devhost10local.run-compute_node_ssh_key
  - cloud-controller.compute_node.devhost10local.run-compute_node_grains
  - cloud-controller.compute_node.devhost10local.run-compute_node_firewall
  - cloud-controller.compute_node.devhost10local.run-compute_node_reverseproxy
  - cloud-controller.compute_node.devhost10local.run-compute_node_hostfile
  
  {% if salt['mc_cloud.registry']().is['lxc'] %}
  - makina-states.cloud.lxc.controller.install
  - cloud-controller.compute_node.devhost10local.lxc-compute_node
  - cloud-controller.compute_node.devhost10local.lxc
  {%endif %}
