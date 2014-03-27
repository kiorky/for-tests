devhost10.local-run-grains:
  grains.present:
    - names:
      - makina-states.services.virt.docker
      - makina-states.services.virt.lxc
    - value: true
devhost10.local-reload-grains:
  cmd.script:
    - source: salt://makina-states/_scripts/reload_grains.sh
    - template: jinja
    - watch:
      - grains: devhost10.local-run-grains
