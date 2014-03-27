include:
  - makina-states.cloud.generic.hooks.vm
devhost10.local-nmdcarto22.test.com-lxc-client-autostart-at-boot:
  salt.function:
    - tgt: [devhost10.local]
    - expr_form: list
    - name: cmd.run
    - arg: ['if [ ! -e /etc/lxc/auto ];then mkdir -p /etc/lxc/auto;fi;ln -sf /var/lib/lxc/nmdcarto22.test.com/config /etc/lxc/auto/nmdcarto22.test.com.conf']
    - watch:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-initial-setup-deploy
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-initial-setup-deploy
devhost10.local-nmdcarto22.test.com-lxc-sysadmin-user-initial-password:
  salt.function:
    - tgt: [nmdcarto22.test.com]
    - expr_form: list
    - name: cmd.run
    - watch:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-initial-setup-deploy
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-initial-setup-deploy
    - arg: ['if [ ! -e /.initialspasses ];then
               for i in ubuntu root sysadmin;do
                 echo "${i}:MJFcPUXtqr7pvk899QBx1EPr_jN6dXRz" | chpasswd && touch /.initialspasses;
               done;
            fi']
