Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB6FCeTJ026641
	for <linux-lvm@redhat.com>; Wed, 6 Dec 2006 10:12:40 -0500
Received: from web51109.mail.yahoo.com (web51109.mail.yahoo.com
	[206.190.39.130])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kB6FCdOM029827
	for <linux-lvm@redhat.com>; Wed, 6 Dec 2006 10:12:39 -0500
Date: Wed, 6 Dec 2006 07:12:32 -0800 (PST)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] vgimport/vgexport commands when logically moving
	disks between systems
In-Reply-To: <457549DB.2080700@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <478326.25880.qm@web51109.mail.yahoo.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Patrick, et al.

Thanks for your comments!
I've been doing some testing on this topic, and encountering a bit of strange
behavior which seems to confirm the murkiness with switching VGs between hosts. 
Please bear with my lengthy description, as I'm trying to be as clear as possible. 
I really need to work this out.

THE TEST:

Hosts are P10 (primary node) and P11 (backup node)
VG is activated on P10 and fs is mounted.  To test a switch to P11, I deactivate the
VG on P10, but DO NOT run vgexport (following your suggestion).  I then, run
vgimport on P11 (but P11 reports it already knows about the VG - that's fine), and
then run an activate.  However, when I try to run an e2fsck on the fs, I get the
following error:

/sbin/e2fsck: No such device or address while trying to open /dev/tux-ao/app
Possibly non-existent or swap device?

However, the device does exist, and looks identical to the one on P10:
[P11]$ ls -l /dev/tux-ao/app
brw-rw----    1 root     disk      58,  14 Dec  6 14:46 /dev/tux-ao/app

I was able to fix the problem by putting vgexport back into the mix.  In this case,
I export the VG from P10 and then after an import on P11 I was able to run e2fsck
and mount successfully.  

Also, this (unknown VG) message is somewhat common in pvscan, if a vgexport is not
performed:

> pvscan -- inactive PV "/dev/sdk"  is associated to unknown VG "tux-ao" (run
vgscan)


Here is another clear example of some unexpected behavior (at least to me)...
1. status when $vg on P11 successful - notice the status of ACTIVE on P11 and
EXPORTED on P10

[P11]$ sudo pvscan
pvscan -- reading all physical volumes (this may take a while...)
 ...
pvscan -- ACTIVE   PV "/dev/sdk" of VG "tux-ao"   [27.09 GB / 9.09 GB free]

[P10]$ sudo pvscan
pvscan -- reading all physical volumes (this may take a while...)
 ...
pvscan -- inactive PV "/dev/sdk"  is in EXPORTED VG "tux-ao" [27.09 GB / 9.09 GB
free]

Then...
2. status after $vg is deactivated on P11 and activated on P10 (no vgexport run on
P11 before activation on P10) - Notice the "unknown VG" message on P10!!!  

[P11]$ sudo pvscan
pvscan -- reading all physical volumes (this may take a while...)
 ...
pvscan -- inactive PV "/dev/sdk" of VG "tux-ao"   [27.09 GB / 9.09 GB free]

[P10]$ sudo pvscan
pvscan -- reading all physical volumes (this may take a while...)
 ...
pvscan -- inactive PV "/dev/sdk"  is associated to unknown VG "tux-ao" (run vgscan)

Then...
3.  Then, when I tried an activation on P10 I get no joy at all (ie. cannot perform
operations on the logical volume), despite the fact that it exists:
[P10]$ ls -l /dev/tux-ao/app
brw-rw----    1 root     disk      58,  14 Dec  6 15:04 /dev/tux-ao/app

/sbin/e2fsck: No such device or address while trying to open /dev/tux-ao/app
Possibly non-existent or swap device?

Is this simply flakey behavior with LVM 1.0.8 ?

We have several VGs on the machine, and sometimes we need to move one or two at a
time.  LVM (v1) seems to have trouble here, at least without vgexport.  Anyone know
what might be happening behind the scenes to cause this behavior?  It's looking to
me like I really do need vgexport to make things work the way we want.

Thanks again for helping me to clarify this situation.
Dave





--- Patrick Caulfield <pcaulfie@redhat.com> wrote:

> Dave wrote:
> > Hello,
> > 
> > I believe I might be misunderstanding whether vgimport and vgexport are needed
> in my
> > particular situation.  It would be great to get some feedback for clarification.
> > 
> > THE SETUP:
> > 
> > LVM1 (1.0.8-14) on two RedHat AS3 systems (kernel: 2.4.21-47.ELsmp).
> > I think the same concept applies for LVM2 as well though.
> > Machine A is primary and Machine B is backup in a two-node Linux heartbeat
> cluster.
> > Both machines are connected to the same SAN via fiber, and see the same disks,
> where
> > the volume groups reside.
> > 
> > THE STRATEGY:
> > 
> > The idea is for A to have the LVM file systems mounted, and when a failure is
> > detected, have the LVM file systems "moved" to (or seen by) system B.  The way
> this
> > is currently accomplished is for A to do the following upon detection of a
> failure:
> > 
> > + unmount file systems
> > + deactivate (vgchange -an $vg)
> > + export (vgexport $vg)
> > 
> > then, on system B:
> > 
> > + import & activate (vgimport $vg $disks)
> > + mount file systems
> > 
> > THE ISSUE:
> > 
> > The export works as expected on A, but upon import on B, a return code of 4 is
> > returned meaning "volume group already exists".  The mounting works properly,
> but
> > all the disks are shown like this:
> > 
> > "inactive PV /dev/sdx  is in EXPORTED VG $vg"  
> > 
> > when inspected with pvscan.
> > 
> > 
> > Does a vgimport and/or vgexport mark the disks themselves, or simply update the
> > system on which the commands are run???  I suppose that is essentially the heart
> of
> > this issue.
> 
> 
> Yes, vgimport/export marks the disks in the volume group. It's really for moving
> disks between systems where the target system might
> have a volume group with the same name as the one to be imported.
> 
> > I'm starting to believe that for our strategy the vgexport and vgimport commands
> are
> > not necessary, and are actually causing the problem.  (The HOWTO mentions these
> > commands are used to move disks between systems, but perhaps that is meant to
> refer
> > to disks that are only physically moved?)
> > 
> > Instead, the following strategy might be correct in case system A fails (Note:
> no
> > vgimport or vgexport commands):
> > 
> > + unmount fs
> > + vgchange -an $vg
> > 
> > then, on system B:
> > 
> > + vgchange -ay $vg
> > + mount fs
> > 
> > 
> > IS THIS CORRECT???
> > 
> 
> Yes. IF YOU'RE VERY CAREFUL!
> vgimport/vgexport are not the tools you want for this job.
> 
> 
> -- 
> 
> patrick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 



 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
