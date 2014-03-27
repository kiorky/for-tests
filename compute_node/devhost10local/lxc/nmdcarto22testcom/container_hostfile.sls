alxc-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- start lxc dns devhost10.local-nmdcarto22.test.com:: DO NOT EDIT --'
    - marker_end: '#-- end lxc dns devhost10.local-nmdcarto22.test.com:: DO NOT EDIT --'
    - content: '# Vagrant vm: devhost10.local-nmdcarto22.test.com added this entry via local mount:'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: True
amakina-parent-append-etc.computenode.accumulated-lxc-devhost10.local-nmdcarto22.test.com:
  file.accumulated:
    - watch_in:
       - file: alxc-devhost10.local-nmdcarto22.test.com-makina-append-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-append-accumulator-lxc-devhost10.local-nmdcarto22.test.com-entries
    - text: |
            10.5.0.1 devhost10.local devhost10.local
lxc-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: '#-- bstart lxc dns devhost10.local-nmdcarto22.test.com:: DO NOT EDIT --'
    - marker_end: '#-- bend lxc dns devhost10.local-nmdcarto22.test.com:: DO NOT EDIT --'
    - content: '# bVagrant vm: devhost10.local-nmdcarto22.test.com added this entry via local mount:'
    - prepend_if_not_found: True
    - backup: '.bak'
    - show_changes: True
makina-parent-prepend-etc.computenode.accumulated-lxc-devhost10.local-nmdcarto22.test.com:
  file.accumulated:
    - watch_in:
       - file: lxc-devhost10.local-nmdcarto22.test.com-makina-prepend-parent-etc.computenode.management
    - filename: /etc/hosts
    - name: parent-hosts-prepend-accumulator-lxc-devhost10.local-nmdcarto22.test.com-entries
    - text: |
            10.5.0.1 devhost10.local devhost10.local
