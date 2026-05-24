
/u01/app/19c/grid/bin/crsctl status res -t

/u01/app/19c/grid/bin/srvctl status listener

/u01/app/19c/grid/bin/srvctl status instance -db lab -node ora-01,ora-02

/u01/app/19c/grid/bin/srvctl stop instance -db lab -node ora-01 -stopoption immediate

/u01/app/19c/grid/bin/srvctl stop instance -db lab -node ora-02 -stopoption immediate

/u01/app/19c/grid/bin/crsctl stop crs

/u01/app/19c/grid/bin/crsctl start crs

/u01/app/19c/grid/bin/crsctl check crs
   srvctl status asm

/u01/app/19c/grid/bin/srvctl start instance -db lab -node ora-01