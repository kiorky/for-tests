include:
  - makina-states.cloud.generic.hooks.vm

{% set msr = salt['mc_localsettings.settings']()['locations']['msr'] %}

devhost10.local-nmdcarto22.test.com-lxc-initial-highstate:
  cmd.run:
    - name: ssh nmdcarto22.test.com /srv/mastersalt/makina-states/_scripts/boot-salt.sh --initial-highstate
    - user: root
    - watch:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-initial-highstate-deploy
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-initial-highstate-deploy
