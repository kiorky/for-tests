insdsakey:
  ssh_auth.present:
    - source: salt://cloud-controller/rootkey-dsa.pub
    - user: root
inskey:
  ssh_auth.present:
    - source: salt://cloud-controller/rootkey-rsa.pub
    - user: root
