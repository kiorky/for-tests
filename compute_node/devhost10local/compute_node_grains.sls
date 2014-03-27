devhost10.local-run-grains:
  grains.present:
    - names:
      - makina-states.cloud.is.compute_node
      - makina-states.services.proxy.haproxy
      - makina-states.services.firewall.shorewall
      - makina-states.cloud.compute_node.has.firewall
    - value: true
devhost10.local-reload-grains:
  cmd.script:
    - source: salt://makina-states/_scripts/reload_grains.sh
    - template: jinja
    - watch:
      - grains: devhost10.local-run-grains
