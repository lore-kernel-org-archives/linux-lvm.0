Message-Id: <199909220841.AA06727@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] ERROR -157 reading data
Date: Wed, 22 Sep 1999 10:41:27 METDST
In-Reply-To: <001201bf0495$017ef940$030116ac@fd1>; from "Fernando Dammous" at Sep 21, 99 9:54 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ferdam@internetcom.com.br
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Fernando,

looks like something has overwritten parts of the VGDA
(metadata aka Volume Group Descriptor Area) on /dev/hdb2.

> 
> Hi all,
> 
> I have created my vg00 (/dev/hdb2) with 1 LV (lv00).=20
> After mounting it, I can work fine with lv00.=20
> But, on next boot, vgscan removes /etc/lvmtab and /etc/lvmtab.d and it =
> isn't able to create a new set of these files.
> <SNIP>
> vgscan -- reading data of volume group "vg00" from physical volume(s)
> vgscan -- ERROR -157: can't get data of volume group "vg00" from =
> physical volume(s)
> vgscan -- ERROR -157: creating "/etc/lvmtab" and "/etc/lvmtab.d"

This error indicates, that the number of logical volumes differs between
the VG part and the LV part(s) of the VGDA.

> 
> With others LVM tools also give almost same msgs :
> 
> vgcfgbackup -- reading volume group data for "vg00" from disk(s)I=20
> vgcfgbackup -- ERROR -157: reading VGDA of "vg00"
> vgcfgbackup -- ERROR -313: backing up volume group "vg00"
> 
> vgck -- reading volume group data for "vg00" from physical volume(s)
> vgck -- ERROR -157: reading data of volume group "vg00" from physical =
> volume(s)
> vgck -- please DON'T run vgscan prior to vgcfgrestore


Please have a look at FAQ question 8.

Do you have an actual backup in /etc/lvmconf ?.
Please look with "ls -lt /etc/lvmconf/vg00*" for a recent backup.

If yes you are a lucky man 8*)

Say you have /etc/lvmconf/vg00.conf then restore it with
"vgfgrestore -f /etc/lvmconf/vg00.conf -n vg00 /dev/hdb2" and retry
"vgscan;vgchange -ay"

> 
> My disk is a IDE 3.2GB with 2 partitions :
> # fdisk -l /dev/hdb
> 
> Disk /dev/hdb: 128 heads, 63 sectors, 785 cylinders
> Units =3D cylinders of 8064 * 512 bytes
> 
>     Device   Boot    Start        End        Blocks         Id    System
> /dev/hdb1                   1            5         20128+      83    =
> Linux native
> /dev/hdb2                   6         785     3144960        83    =
> Unknown

You mean partition Id fe, do you?

> 
> The LVM program is built into my kernel (2.0.36) not as a module.
> Am I missing something in my configuration?
> 

O.k.

> Please help me!
> 
> Thanks in advance,
> 
> Fernando Dammous
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
