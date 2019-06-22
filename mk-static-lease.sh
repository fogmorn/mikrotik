add name=mk-static-lease owner=admin policy=read,write source="\
    \n\
    \n:local hostname\
    \n\
    \n:local id\
    \n\
    \n/ip dhcp-server lease\
    \n\
    \n:set id [find address=\$leaseActIP]\
    \n\
    \n:set hostname [get \$id host-name]\
    \n\
    \n\
    \n\
    \n:if ( [:pick \$hostname 0 3] = \"pc-\" ) do={\
    \n\
    \n  make-static \$id\
    \n\
    \n  /ip firewall address-list\
    \n\
    \n  :if ( [find address=\$leaseActIP] = \"\" ) do={\
    \n\
    \n    add list=pc address=\$leaseActIP comment=\$hostname\
    \n\
    \n  }\
    \n\
    \n}"
