Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFF8@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] My VG is gone...
Date: Tue, 4 Sep 2001 14:51:16 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I'm having a very similar problem.  When I run vgscan, I get:

[root@filmore jdiehl]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Database2"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of
 volume group "Database2" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lv
mtab" and "/etc/lvmtab.d" 

Any ideas about how to recover without losing my data.  I need to get going
soon, so if I haven't fixed it by late this week, I'm going to reformat....
And lose several Gb of data.

Thanx,
Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov

> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: September 04, 2001 6:43 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] My VG is gone...
> 
> 
> On Sun, Sep 02, 2001 at 08:07:15PM +0200, Rasmus Wiman wrote:
> > Joe Thornber <thornber@btconnect.com> skrev:
> > > You're right sdb1 appears to have been added twice with seperate
> > > UUID's.  I'm at a loss to explain this at the moment.  Did you run
> > > pvcreate more than once on sdb1 ? (I want to know where that extra
> > > uuid came from).
> > 
> > Well here's the full story:
> > I added the new disk, made a new LVM partition, ran 
> pvcreate on it. Did a
> > vgextend vg1 /dev/sdb1. Rebooted. No vg:s found, Panic: 
> root not found.
> > Spent a bunch of hours hackaing a Slackware 8 boot floppy 
> with LVM 1.0
> > support. It found the vg. Next idea: Maybe it's because of 
> devfs. I hacked
> > the disk a bit further yo use devfs, and now it didn't find 
> the VG:s. I
> > started looking for any LVM list archive, found something 
> about small
> > initrd:s so I put an 8 MB initrd image on the root floppy, 
> and wow, the VG
> > was there. Tried to put a larger initrd on the boot 
> partition and re-ran
> > lilo. Rebooted, no success. Later I realised that a 
> initrd_size=8912k
> > might have done the trick. Booted from the floppy again and 
> did a vgreduce
> > vg1 /dev/sdb1. Now it would boot. Here I should really have 
> backed up
> > everything to a non LVM partition, but instead I did a 
> vgextend vg1 sdb1.
> > Re-ran lvmcreate_initrd, re-ran lilo and rebooted. That's 
> where I am now.
> > Two SDB1:s with separate UUID's. Can this be fixed or 
> should I format and
> > reinstall? It would really feel bad because I've never had 
> to format and
> > reinstall a Linux system except for the occasional hardware failure.
> 
> Did you try the uuid_fixer program at 
> ftp://ftp.sistina.com/pub/LVM/contrib
> 
> That may fix your problem, but it would be nice to get as 
> much info out of
> your system as possible before you use it to figure out what 
> went wrong...
> 
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3CD1 25EE DBE3 1B69 F3C7  A1FB 2A81 
> D686 34A2 2E9E
> 
> -----Begin Obligatory Humorous 
> Quote----------------------------------------
> Life's short and hard, kind of like a bodybuilding elf
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 
