
{% set lxcSettings = salt['mc_cloud_lxc.settings']() %}
include:
  - makina-states.services.firewall.shorewall
  - makina-states.services.virt.lxc
{% if grains['os'] not in ['Ubuntu'] %}
etc-init.d-lxc-net-makina:
  file.managed:
    - name: /etc/init.d/lxc-net-makina
    - template: jinja
    - defaults: {{lxcSettings.defaults|yaml}}
    - source: salt://makina-states/files/etc/init.d/lxc-net-makina.sh
    - mode: 750
    - user: root
    - group: root
    - require_in:
      - service: lxc-services-enabling
{% else %}
etc-init-lxc-net-makina:
  file.managed:
    - name: /etc/init/lxc-net-makina.conf
    - template: jinja
    - source: salt://makina-states/files/etc/init/lxc-net-makina.conf
    - mode: 750
    - user: root
    - defaults: {{lxcSettings.defaults|yaml}}
    - group: root
    - require_in:
      - service: lxc-services-enabling
{% endif %}
lxc-makina-services-enabling:
  service.running:
    - enable: True
    - names:
      - lxc
      - lxc-net
      - lxc-net-makina
    - require_in:
      - mc_proxy: lxc-post-inst
