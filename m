Message-Id: <199910141952.AA07775@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Existing Linux System
Date: Thu, 14 Oct 1999 21:52:29 METDST
In-Reply-To: <H00004e903071d53@MHS>; from "Al Smith" at Oct 14, 99 9:18 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al.Smith@mail.tju.edu
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Al.
> 
> I have an exisiting linux system. Running Mandrake 6.0. I have installed
> sucessfully the kernel patch and the LVM software. Can I convert the
> existing layout to use LVM?

No conversion in means of nondestructive change of your existing partition
based filesystems into logical volume based ones.

> And if so how would that be accomplished.
> 

You have to have free disk space available (at least about 10-20% more than
the already used space for your partition based filesystems) to set up
a volume group containing logical volumes for /, /usr, /tmp, /var and so on.

Create filesystems in these logical volumes and mount them.

Copy coresponding files from your partition based filesystems to the 
logical volume based ones.

Keep a small BIOS reachable boot partition, because LILO can't deal
with logical volumes directly.

The boot partition (20M is sufficient) has to hold all necessary LILO
files including lilo.conf, your boot kernel and an initrd.gz created
by lvmcreate_initrd(8).

It should hold binaries (like /bin/sh or the LVM executables), shared
libraries and necessary modules too to be able to use it as a standalone
bootable root in case something goes wrong 8*( or for administration purposes.

BTW:
If you don't have plenty of space to configure large enough logical volumes in
the first place, you can add the partitions containing the original
filesystems to your volume group after your LVM system is o.k. and running.

Then you can grow the logical volumes and resize the unmounted ext2 filesystems
with resize2fs. To accomplish this you can standalone boot your system from
the above mentioned partition.


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
