Message-Id: <199910121816.AA26719@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM & Raid
Date: Tue, 12 Oct 1999 20:15:29 METDST
In-Reply-To: <199910031148.NAA24977@seger.axis.se>; from "Lars Segerlund" at Oct 03, 99 1:48 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Segerlund <lars.segerlund@axis.com>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Lars.

> 
>  I'm having trouble setting up lvm on a raid5 array ( /dev/md0 ),
>  my trouble is that pvscan doesn't find it, ( how in the heck
>  do I label a raid partitium so that pvscan vill recognize and vgcreate
>  will think of it a partitiun ?? )


You don't have to 'label' it.
Just say "pvcreate /dev/md0" and "vgcreate Idontknow /dev/md0".

pv_read_all_pv() should find your /dev/md0 after you did that pvcreate on it.


But...

Because pv_read_all_pv() relies on the /dev setup, you might suffer
from some unusual /dev/md* entries.

Please check them and run "pvscan -d" looking for /dev/md* hits.
Look what pvscan thinks of them please.

> 
>  I have been running lvm with raw disks, but now I seem a bit stuck.
> 
>  By the way it's an alpha and v0.7. 2.2.12
> 

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
