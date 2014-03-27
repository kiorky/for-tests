{%set sdata = "{http_backends: {bck_foo: {name: bck_foo, raw_opts: [option http-server-close, option           forwardfor, source 0.0.0.0 usesrc clientip, balance roundrobin], servers: [         {bind: '10.5.0.2:80', name: srv_foo1, opts: check}]}, bck_nmdcarto22.test.com: {       name: bck_nmdcarto22.test.com, raw_opts: [option http-server-close, option forwardfor,         source 0.0.0.0 usesrc clientip, balance roundrobin], servers: [{bind: '10.5.0.2:80',           name: srv_nmdcarto22.test.com1, opts: check}]}}, http_proxy: {bind: '*:80',     mode: http, name: devhost10.local, raw_opts: [acl host_foo hdr(host) -i foo, acl         host_nmdcarto22.test.com hdr(host) -i nmdcarto22.test.com, use_backend bck_nmdcarto22.test.com         if host_nmdcarto22.test.com, use_backend bck_foo if host_foo]}, https_backends: {     securebck_foo: {name: securebck_foo, raw_opts: [option http-server-close, option           forwardfor, source 0.0.0.0 usesrc clientip, balance roundrobin], servers: [         {bind: '10.5.0.2:80', name: srv_foo1, opts: check}]}, securebck_nmdcarto22.test.com: {       name: securebck_nmdcarto22.test.com, raw_opts: [option http-server-close, option           forwardfor, source 0.0.0.0 usesrc clientip, balance roundrobin], servers: [         {bind: '10.5.0.2:80', name: srv_nmdcarto22.test.com1, opts: check}]}}, https_proxy: {     bind: '*:443', mode: http, name: secure-devhost10.local, raw_opts: [acl host_foo         hdr(host) -i foo, acl host_nmdcarto22.test.com hdr(host) -i nmdcarto22.test.com,       use_backend securebck_nmdcarto22.test.com if host_nmdcarto22.test.com, use_backend         securebck_foo if host_foo]}, ssh_proxies: [{bind: ':10.5.0.2', mode: tcp,       name: lst_nmdcarto22.test.com, raw_opts: [], servers: [{bind: '10.5.0.2:22',           name: sshserver, opts: check}]}], target: devhost10.local}" %}
include:
  - makina-states.services.proxy.haproxy
cpt-cloud-targetdevhost10.local-haproxy-cfg:
  file.managed:
    - name: {{salt['mc_haproxy.settings']().config_dir}}/extra/cloudcontroller.cfg
    - source: salt://makina-states/files/etc/haproxy/cloudcontroller.cfg
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - template: jinja
    - defaults:
      cdata: "{{sdata}}"
    - watch_in:
      - mc_proxy: haproxy-post-conf-hook
