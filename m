Message-ID: <01FA7817D8EDD211BD9C00004B309A504D3ACF@defiant.sonera.se>
From: Fredrik Lindgren <fredrik@tfi.net>
Subject: RE: [linux-lvm] LVM tool problems?
Date: Tue, 22 Feb 2000 11:24:00 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Heinz Mauelshagen' <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ez-darmstadt.telekom.de, "'linux-lvm@msede.com'" <linux-lvm@msede.com>

> > [root@newsfeed /root]# vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "vg01"
> > vgscan -- ERROR -154: can't get data of volume group "vg01" 
> > from physical volume(s)
> > vgscan -- ERROR -154 creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> This exactly looks like somebody wrote over some of the 
> LVM Physical Volumes.

Oh, well the machine was completely locked up. So something
very weird had happened. There was some messages from
ReiserFS (presumably) on the console about it waiting for
a "buffer to be released", whatever that means... :)
 
> > /dev/sd[b-d] is not 31Gb, they a 4Gb disks. I tried the 
> > vgcfgrestore command, but it says to use the vgscan tool, 
> > which fails.
> > 
> > Linux is 2.2.14 with LVM 0.8-pre02.10.1999 and ReiserFS 3.5.16.
> > Mandrake 7.0 system. Monolithic (no modules whatsoever) kernel.
> > 
> > Any ideas?
> 
> Yep.
> 
> Your idea to use vgcfgrestore(8) to restore (hoping that the 
> misbehaving software didn't overwrite more than the VGDA part 
> of the PVs) was correct.
> 
> Nevertheless there is a catch 22 flaw in vgcfgrestore in this 
> LVM version, which forces /etc/lvmtab* to exist. But if it 
> doesn't and some VGDA is damaged, vgscan complains to create 
> it 8-{(((
> 
> To work around this, you can delete the "LVMTAB_CHECK" in line 85
> of tools/vgcfgrestore.c, recompile, reinstall and retry with 
> vgcfgrestore.

Yeah, I found the other message in the list archive and tried 
that. This gives me a new error though. It complains that the 
PV size is diffrent in real life and in the backup, I think.
It is still the same disk though, that I'm quite sure of... :)

[root@newsfeed tools]# ./vgcfgrestore -v -n vg01 /dev/sdb
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vg01" from "/etc/lvmconf/vg01.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading volume group data for "vg01" from
"/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading physical volume data for "vg01" from
"/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading logical volume data for "vg01" from
"/etc/lvmconf/vg01.conf"
vgcfgrestore -- checking volume group consistency of "vg01"
vgcfgrestore -- checking volume group consistency of "vg01"
vgcfgrestore -- reading physical volume "/dev/sdb"
vgcfgrestore -- checking for new physical volume "/dev/sdb"
vgcfgrestore -- size of physical volume "/dev/sdb" differs from backup

> Before using vgcfgrestore on the PVs, could you please send 
> the output of "pvdata -a /dev/sd[b-d]" to me?

I sent that in a mail to you only, since it was so large.

Regards,
  Fredrik Lindgren

 
