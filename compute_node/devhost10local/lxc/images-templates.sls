



devhost10.local-download-makina-states-precise-6:
  file.directory:
    - name: /var/lib/lxc/makina-states-precise
    - user: root
    - makedirs: true
    - group: root
    - mode: 755
  archive.extracted:
    - name: /var/lib/lxc/makina-states-precise
    - source: https://downloads.sourceforge.net/makinacorpus/makina-states/makina-states-precise-lxc-6.tar.xz
    - source_hash: md5=7cb3688e8c02293a9a8105da6013bc43
    - archive_format: tar
    - if_missing: /var/lib/lxc/makina-states-precise/rootfs/etc/salt
    - tar_options: -xJf
    - watch:
      - file: devhost10.local-download-makina-states-precise-6
devhost10.local-restore-specialfiles-makina-states-precise:
  cmd.run:
    - name: cp -a /dev/log /var/lib/lxc/makina-states-precise/rootfs/dev/log
    - unless: test -e /var/lib/lxc/makina-states-precise/rootfs/dev/log
    - cwd: /var/lib/lxc/makina-states-precise
    - user: root
    - watch:
      - archive: devhost10.local-download-makina-states-precise-6
devhost10.local-restore-acls-makina-states-precise:
  cmd.run:
    - name: setfacl --restore=acls.txt && touch acls_done
    - cwd: /var/lib/lxc/makina-states-precise
    - unless: test -e /var/lib/lxc/makina-states-precise/acls_done
    - user: root
    - watch:
      - cmd: devhost10.local-restore-specialfiles-makina-states-precise
devhost10.local-makina-states-precise-stop-default-lxc-container:
  lxc.stopped:
    - name: makina-states-precise
    - watch:
      - cmd: devhost10.local-restore-specialfiles-makina-states-precise
devhost10.local-makina-states-precise-lxc-snap:
  cmd.run:
    - name: chroot /var/lib/lxc/makina-states-precise/rootfs/sbin/lxc-snap.sh
    - onlyif: test -e /var/lib/lxc/makina-states-precise/rootfs/etc/salt/pki/minion/minion.pub
    - watch:
      - lxc: devhost10.local-makina-states-precise-stop-default-lxc-container
devhost10.local-makina-states-precise-lxc-removeminion:
  file.absent:
    - name: /etc/mastersalt/pki/master/minions/makina-states-precise
    - watch:
      - cmd: devhost10.local-makina-states-precise-lxc-snap
