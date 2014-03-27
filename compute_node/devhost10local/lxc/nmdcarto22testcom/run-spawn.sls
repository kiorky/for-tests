include:
  - makina-states.cloud.generic.hooks.vm
  - makina-states.cloud.lxc.controller.install
devhost10.local-nmdcarto22.test.com-lxc-deploy:
  cloud.profile:
    - name: nmdcarto22.test.com
    
    
    
    
    
    
    
    {%set dnsservers="[8.8.8.8, 4.4.4.4]"|load_yaml%}
    {%set data="{autostart: true, backing: overlayfs, bootsalt_branch: master, bridge: lxcbr1, dnsservers: [     8.8.8.8, 4.4.4.4], domains: [nmdcarto22.test.com, foo], from_container: makina-states-precise,   gateway: 10.5.0.1, image: ubuntu, ip: 10.5.0.2, load_balancer_domains: [nmdcarto22.test.com,     foo], lxc_conf: [], lxc_conf_unset: [], mac: '00:16:3e:6c:8e:b0', master: 10.5.0.1,   master_port: 4606, mode: mastersalt, name: nmdcarto22.test.com, netmask: '16', password: MJFcPUXtqr7pvk899QBx1EPr_jN6dXRz,   profile: ms-devhost10-local-overlayfs, script_args: -C --from-salt-cloud --mastersalt-minion     -b master, snapshot: true, ssh_gateway: devhost10.local, ssh_gateway_key: /root/.ssh/id_dsa,   ssh_gateway_password: null, ssh_gateway_port: 22, ssh_gateway_user: root, ssh_username: ubuntu,   state_name: devhost10.local-nmdcarto22.test.com, sudo: true, target: devhost10.local,   users: [root, sysadmin]}"|load_yaml%}
    {%set minion="{master: 10.5.0.1, master_port: 4606}"|load_yaml%}
    - profile: ms-devhost10-local-overlayfs
    - unless: test -e /etc/mastersalt/pki/master/minions/nmdcarto22.test.com
    - watch:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-pre-deploy
    - watch_in:
      - mc_proxy: cloud-nmdcarto22.test.com-generic-vm-post-deploy
    - minion:  {{ minion | yaml }} 
    - dnsservers: {{dnsservers|yaml}}
    
    
    - from_container: {{"makina-states-precise"|load_yaml}}
    
    
    - snapshot: {{"true"|load_yaml}}
    
    
    - image: {{"ubuntu"|load_yaml}}
    
    
    - gateway: {{"10.5.0.1"|load_yaml}}
    
    
    - bridge: {{"lxcbr1"|load_yaml}}
    
    
    - mac: {{"00:16:3e:6c:8e:b0"|load_yaml}}
    
    
    - ssh_gateway: {{"devhost10.local"|load_yaml}}
    
    
    - ssh_gateway_user: {{"root"|load_yaml}}
    
    
    - ssh_gateway_port: {{"22"|load_yaml}}
    
    
    - ssh_gateway_key: {{"/root/.ssh/id_dsa"|load_yaml}}
    
    
    - ip: {{"10.5.0.2"|load_yaml}}
    
    
    - netmask: {{"'16'"|load_yaml}}
    
    
    - backing: {{"overlayfs"|load_yaml}}
    
    
    - script_args: {{"-C --from-salt-cloud --mastersalt-minion -b master"|load_yaml}}
    
    
    - ssh_username: {{"ubuntu"|load_yaml}}
    
    
    - password: {{"MJFcPUXtqr7pvk899QBx1EPr_jN6dXRz"|load_yaml}}
    
