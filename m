Received: from [192.168.1.2] (vpn-68-10.surrey.redhat.com [10.32.68.10])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB6FsDVi012215
	for <linux-lvm@redhat.com>; Wed, 6 Dec 2006 15:54:13 GMT
Message-ID: <4576E79E.40006@redhat.com>
Date: Wed, 06 Dec 2006 15:54:06 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport/vgexport commands when logically moving
	disks between systems
References: <478326.25880.qm@web51109.mail.yahoo.com>
In-Reply-To: <478326.25880.qm@web51109.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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

Dave wrote:
> Hi Patrick, et al.
> 
> Thanks for your comments!
> I've been doing some testing on this topic, and encountering a bit of strange
> behavior which seems to confirm the murkiness with switching VGs between hosts. 
> Please bear with my lengthy description, as I'm trying to be as clear as possible. 
> I really need to work this out.
> 
> THE TEST:
> 
> Hosts are P10 (primary node) and P11 (backup node)
> VG is activated on P10 and fs is mounted.  To test a switch to P11, I deactivate the
> VG on P10, but DO NOT run vgexport (following your suggestion).  I then, run
> vgimport on P11 (but P11 reports it already knows about the VG - that's fine), and
> then run an activate.  However, when I try to run an e2fsck on the fs, I get the
> following error:
> 
> /sbin/e2fsck: No such device or address while trying to open /dev/tux-ao/app
> Possibly non-existent or swap device?
> 
> However, the device does exist, and looks identical to the one on P10:
> [P11]$ ls -l /dev/tux-ao/app
> brw-rw----    1 root     disk      58,  14 Dec  6 14:46 /dev/tux-ao/app
> 
> I was able to fix the problem by putting vgexport back into the mix.  In this case,
> I export the VG from P10 and then after an import on P11 I was able to run e2fsck
> and mount successfully.  
> 
> Also, this (unknown VG) message is somewhat common in pvscan, if a vgexport is not
> performed:
> 
>> pvscan -- inactive PV "/dev/sdk"  is associated to unknown VG "tux-ao" (run
> vgscan)
> 
> 
> Here is another clear example of some unexpected behavior (at least to me)...
> 1. status when $vg on P11 successful - notice the status of ACTIVE on P11 and
> EXPORTED on P10
> 
> [P11]$ sudo pvscan
> pvscan -- reading all physical volumes (this may take a while...)
>  ...
> pvscan -- ACTIVE   PV "/dev/sdk" of VG "tux-ao"   [27.09 GB / 9.09 GB free]
> 
> [P10]$ sudo pvscan
> pvscan -- reading all physical volumes (this may take a while...)
>  ...
> pvscan -- inactive PV "/dev/sdk"  is in EXPORTED VG "tux-ao" [27.09 GB / 9.09 GB
> free]
> 
> Then...
> 2. status after $vg is deactivated on P11 and activated on P10 (no vgexport run on
> P11 before activation on P10) - Notice the "unknown VG" message on P10!!!  
> 
> [P11]$ sudo pvscan
> pvscan -- reading all physical volumes (this may take a while...)
>  ...
> pvscan -- inactive PV "/dev/sdk" of VG "tux-ao"   [27.09 GB / 9.09 GB free]
> 
> [P10]$ sudo pvscan
> pvscan -- reading all physical volumes (this may take a while...)
>  ...
> pvscan -- inactive PV "/dev/sdk"  is associated to unknown VG "tux-ao" (run vgscan)
> 
> Then...
> 3.  Then, when I tried an activation on P10 I get no joy at all (ie. cannot perform
> operations on the logical volume), despite the fact that it exists:
> [P10]$ ls -l /dev/tux-ao/app
> brw-rw----    1 root     disk      58,  14 Dec  6 15:04 /dev/tux-ao/app
> 
> /sbin/e2fsck: No such device or address while trying to open /dev/tux-ao/app
> Possibly non-existent or swap device?
> 
> Is this simply flakey behavior with LVM 1.0.8 ?
> 
> We have several VGs on the machine, and sometimes we need to move one or two at a
> time.  LVM (v1) seems to have trouble here, at least without vgexport.  Anyone know
> what might be happening behind the scenes to cause this behavior?  It's looking to
> me like I really do need vgexport to make things work the way we want.
> 
> Thanks again for helping me to clarify this situation.

It's rather worrying that the two nodes seem to be reading different data from the same disks.
I can't remember off-hand whether lvm1 does direct-io when it updates metadata, possibly not.
In which case you might have to upgrade to lvm2 (which does).

lvm1 is /not/ a clustering tool ;-)

-- 

patrick
