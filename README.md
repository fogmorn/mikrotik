# mikrotik
Mikrotik (RouterOS) scripts.

- `mk-static-lease.sh`

   Makes static lease for clients who has hostname stared with `pc-`.

- `filterpc.sh`

   Runs on DHCP server lease.  
   Script perform check that client hostname starts with `pc-` and adds it  
   to `pc` firewall address list.
