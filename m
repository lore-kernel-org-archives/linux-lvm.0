From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003251403.PAA01701@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] problems with vgscan
In-Reply-To: <38DBBB6B.9DBC19DB@freeler.nl> from jorg de jong at "Mar 24, 2000  8: 0:59 pm"
Date: Sat, 25 Mar 2000 15:03:04 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jorg de jong <j.e.s.de.jong@freeler.nl>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Jorg,

thanks for profiding the "vgscan -d" output.

In line 10588 of the trace i was able to see that lv_check_consistency()
finds an inconsistency of the access parameter of logical volume /dev/vg01/usr.

This parameter is almost checked first in lv_check_consistency() so it
could be possible, that your VGDA on disk was accidently destroyed.

To check this assumption could you please provide a "pvdata -a" of all
PVs of vg01?

Please keep the intact backups of the VGDA in /etc/lvmconf/!

Thanks,
Heinz

> Hello,
> 
> I am experiencing problems while doing a vgscan, attached I have
> included a debug trace for
> details.
> 
> In short this is what I get :
> 
> vgscan -- ERROR "parameter error" with special file /dev/vg01/usr
> vgscan -- ERROR "parameter error" creating volume group directory and
> special files
> vgscan -- ERROR "parameter error" creating "/etc/lvmtab" and
> "/etc/lvmtab.d"
> 
> and I am not able to activate my vg's :-((((.
> 
> 
> My config is:
> 2 disk, complete pv's 
> 1 disk, with 9 linux and dos partitions and 2 pv partitions.
> 
> 3 volume groups 
> 	vg00 complete disk 1
> 	vg02 complete disk 2
> 	vg01 with the two partitions from the remaining disk
> 
> vg00 has one logical volume(home)
> vg01 has two logical volume's(usr and tmp)
> vg02 has one logical volume(lv00)
> 
> 
> When I change the partition ID;s from the pv partitions in vg01, from 8e
> to 83,
> (making then invisible to LVM) vgscan completes normal.
> 
> During the creation of vg01 I renamed one of the lv's but other than
> that I did nothing
> special to it.
> 
> 
> During the creation of vg01 I was able to access the lv but as soon as I
> rebooted 
> the problems began.
> 
> The kernel I am using it 2.3.99.pre2 but found the same problem when
> using 2.3.49.
> 
> If I need to provide more info i'll be more than happy to.
> 
> regards,
> 
> Jorg de Jong.

[application/x-gzip is not supported, skipping...]


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
