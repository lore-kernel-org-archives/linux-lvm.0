From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002221006.LAA18822@u9etz.164.27.16.48>
Subject: Re: [linux-lvm] LVM tool problems?
Date: Tue, 22 Feb 2000 11:06:06 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: mge@ez-darmstadt.telekom.de


Hi Fredrik.

> Hi!
> 
> I just installed LVM on a newsfeed box jus to see
> if it could take it. Filesystem is ReiserFS.
> 
> The machine crashed, I don't know which software
> was at "fault" but the problem I have is that I
> cannot get the LVM to start again.
> 
> This is what I get:
> 
> [root@newsfeed /root]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vg01"
> vgscan -- ERROR -154: can't get data of volume group "vg01" from physical
> volume(s)
> vgscan -- ERROR -154 creating "/etc/lvmtab" and "/etc/lvmtab.d"

This exactly looks like somebody wrote over some of the 
LVM Physical Volumes.

> 
> Also, this seems weird:
> 
> [root@newsfeed /root]# lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/sda1         [      39.19 MB] Primary  LINUX native
> partition [0x83]
> lvmdiskscan -- /dev/sda2         [       3.81 GB] Primary  LINUX native
> partition [0x83]
> lvmdiskscan -- /dev/sda3         [     196.11 MB] Primary  LINUX swap
> partition [0x82]
> lvmdiskscan -- /dev/sdb          [      31.97 GB] USED LVM whole disk
> lvmdiskscan -- /dev/sdc          [      31.97 GB] USED LVM whole disk
> lvmdiskscan -- /dev/sdd          [      31.97 GB] USED LVM whole disk
> lvmdiskscan -- 4 disks
> lvmdiskscan -- 3 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 3 partitions
> lvmdiskscan -- 0 LVM physical volume partitions
> 
> /dev/sd[b-d] is not 31Gb, they a 4Gb disks. I tried the 
> vgcfgrestore command, but it says to use the vgscan tool, 
> which fails.
> 
> Linux is 2.2.14 with LVM 0.8-pre02.10.1999 and ReiserFS 3.5.16.
> Mandrake 7.0 system. Monolithic (no modules whatsoever) kernel.
> 
> Any ideas?

Yep.

Your idea to use vgcfgrestore(8) to restore (hoping that the misbehaving
software didn't overwrite more than the VGDA part of the PVs) was correct.

Nevertheless there is a catch 22 flaw in vgcfgrestore in this LVM version,
which forces /etc/lvmtab* to exist. But if it doesn't and some VGDA is
damaged, vgscan complains to create it 8-{(((

To work around this, you can delete the "LVMTAB_CHECK" in line 85
of tools/vgcfgrestore.c, recompile, reinstall and retry with vgcfgrestore.

Before that, please do a 

for d in /dev/sd[b-d]
do
   dd if=$d of=/tmp/`basename $d`.pv bs=1k count=200
done

and save the copies (/tmp/sd[b-d].pv) to be able to fall back ;-{)


Before using vgcfgrestore on the PVs, could you please send the output of
"pvdata -a /dev/sd[b-d]" to me?

> 
> BTW, the LVM stuff is great! :)
> 

Thanks a lot.

Regards,
Heinz
-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
