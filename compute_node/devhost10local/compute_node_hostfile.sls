




avirt-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- start virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - marker_end: '#-- end virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - content: '# Vagrant vm: nmdcarto22.test.com added this entry via local mount:'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: True
amakina-parent-append-etc.computenode.accumulated-virt-devhost10.local-nmdcarto22.test.com:
  file.accumulated:
    - watch_in:
       - file: avirt-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-append-accumulator-virt-devhost10.local-nmdcarto22.test.com-entries
    - text: |
            10.5.0.2 nmdcarto22.test.com
virt-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- bstart virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - marker_end: '#-- bend virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - content: '# bVagrant vm: nmdcarto22.test.com added this entry via local mount:'
    - prepend_if_not_found: True
    - backup: '.bak'
    - show_changes: True
makina-parent-prepend-etc.computenode.accumulated-virt-devhost10.local-nmdcarto22.test.com:
  file.accumulated:
    - watch_in:
       - file: virt-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-prepend-accumulator-virt-devhost10.local-nmdcarto22.test.com-entries
    - text: |
            10.5.0.2 nmdcarto22.test.com
{% if salt['mc_nodetypes.registry']()['is']['devhost'] %}
avirt-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management-devhost-touch:
  file.touch:
    - name: /etc/devhosts.nmdcarto22.test.com
virt-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management-devhost:
  file.blockreplace:
    - name: /etc/devhosts.nmdcarto22.test.com
    - marker_start: '#-- start devhost -- bstart virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - marker_end: '#-- end devhost -- bend virt dns nmdcarto22.test.com:: DO NOT EDIT --'
    - content: '# bVagrant vm: nmdcarto22.test.com added this entry via local mount:'
    - prepend_if_not_found: True
    - backup: '.bak'
    - show_changes: True
    - watch:
      - file: avirt-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management-devhost-touch
makina-parent-prepend-etc.computenode.accumulated-virt-devhost10.local-nmdcarto22.test.com-devhost:
  file.accumulated:
    - watch_in:
       - file: virt-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management-devhost
    - filename: /etc/devhosts.nmdcarto22.test.com
    - name: parent-hosts-prepend-accumulator-virt-devhost10.local-nmdcarto22.test.com-entries
    - text: |
            10.1.10.43 nmdcarto22.test.com
{% endif %}





avirt-devhost10.local-foo-makina-append-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- start virt dns foo:: DO NOT EDIT --'
    - marker_end: '#-- end virt dns foo:: DO NOT EDIT --'
    - content: '# Vagrant vm: foo added this entry via local mount:'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: True
amakina-parent-append-etc.computenode.accumulated-virt-devhost10.local-foo:
  file.accumulated:
    - watch_in:
       - file: avirt-devhost10.local-foo-makina-append-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-append-accumulator-virt-devhost10.local-foo-entries
    - text: |
            10.5.0.2 foo
virt-devhost10.local-foo-makina-prepend-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- bstart virt dns foo:: DO NOT EDIT --'
    - marker_end: '#-- bend virt dns foo:: DO NOT EDIT --'
    - content: '# bVagrant vm: foo added this entry via local mount:'
    - prepend_if_not_found: True
    - backup: '.bak'
    - show_changes: True
makina-parent-prepend-etc.computenode.accumulated-virt-devhost10.local-foo:
  file.accumulated:
    - watch_in:
       - file: virt-devhost10.local-foo-makina-prepend-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-prepend-accumulator-virt-devhost10.local-foo-entries
    - text: |
            10.5.0.2 foo
{% if salt['mc_nodetypes.registry']()['is']['devhost'] %}
avirt-devhost10.local-foo-makina-append-parent-etc.computenode.management-devhost-touch:
  file.touch:
    - name: /etc/devhosts.foo
virt-devhost10.local-foo-makina-prepend-parent-etc.computenode.management-devhost:
  file.blockreplace:
    - name: /etc/devhosts.foo
    - marker_start: '#-- start devhost -- bstart virt dns foo:: DO NOT EDIT --'
    - marker_end: '#-- end devhost -- bend virt dns foo:: DO NOT EDIT --'
    - content: '# bVagrant vm: foo added this entry via local mount:'
    - prepend_if_not_found: True
    - backup: '.bak'
    - show_changes: True
    - watch:
      - file: avirt-devhost10.local-foo-makina-append-parent-etc.computenode.management-devhost-touch
makina-parent-prepend-etc.computenode.accumulated-virt-devhost10.local-foo-devhost:
  file.accumulated:
    - watch_in:
       - file: virt-devhost10.local-foo-makina-prepend-parent-etc.computenode.management-devhost
    - filename: /etc/devhosts.foo
    - name: parent-hosts-prepend-accumulator-virt-devhost10.local-foo-entries
    - text: |
            10.1.10.43 foo
{% endif %}
