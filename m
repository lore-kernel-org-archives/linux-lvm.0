Message-Id: <199911120003.AA22883@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Actual status of LVM in stock kernel
Date: Fri, 12 Nov 1999 1:00:30 MET
In-Reply-To: <m11m2Zt-0000gCC@duffy1.franken.de>; from "Rolf Jakob" at Nov 11, 99 11:20 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjakob@duffy1.franken.de
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Hi,
> 
> [story]
> > 
> > Somebody out there to help me stay optimistic?
> > 
> Not hearing something positive does not necessarily mean something negative.
> Maybe Linus is a bit busy or he's trying LVM right now or ...
> 
> Give him some time, Linux is not his full-time job.
> And if LVM won't make it into the stock kernel soon - well, you did what
> you could.
> Let distributors include the patch in their distribution is not the
> worst thing either. BTW: SuSE 6.3 will have it, AFAIK. Correct ?

Yes, it will.

> 
> We now and honor what you did, may it be in the stock kernel or not ... :-)
> 
> Bye,
> Rolf
> 
> PS: Maybe somebody can tell me how to mount a root lv ?

Create a small /boot filesystem on a partition (20 Meg is sufficient
to make a bootable standalone in case something goes wrong).

Put a kernel, lilo.conf, and a selection of /sbin/*, /bin/*, /lib*.

Create a volume group with root, usr, tmp, var, opt and whatever volume
you like containing filesystems and put the corresponding files into these
(you need temporary space; at least some megabytes more than the amount
to install a basic system)

Use lvmcreate_initrd to create a /boot/initrd.gz file containing everything
to mount a LV based root and configure /boot/lilo.conf to boot with 
this initial ramdisk and run lilo.

Create corresponding entries in your LV base roots /etc/fstab and reboot.

> -- 
> Rolf Jakob at home (rjakob@duffy1.franken.de)
> WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
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
