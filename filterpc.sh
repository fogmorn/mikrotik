/system script add \
  name=filterpc policy=write,read \
  source="# define variables\r\
  \n:local address\r\
  \n:local hostname\r\
  \n\r\
  \n# Loop through aech entry in the dhcp leases list.\r\
  \n:foreach i in=[/ip dhcp-server lease find] do={\r\
  \n\r\
  \n# Get the first three characters of the name\r\
  \n  :set hostname [:pick [/ip dhcp-server lease get \$i host-name] 0 3]\r\
  \n\r\
  \n# If they're 'pc-', then we've got a match - process it\r\
  \n  :if (\$hostname = \"pc-\") do={\r\
  \n\r\
  \n# Get IP address for this item\r\
  \n    :set address [/ip dhcp-server lease get \$i address]\r\
  \n\r\
  \n# Check that this address is not added yet\r\
  \n    :if ( [/ip dhcp-server lease get [find address=\$address]] !=\"\" ) do={\r\
  \n      /ip firewall address-list add list=\"pc\" address=\$address comment=\$hostname\r\
  \n    }\r\
  \n  }\r\
  \n}"
