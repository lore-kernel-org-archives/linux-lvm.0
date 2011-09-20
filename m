Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8KKNnog019585
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 16:23:50 -0400
Received: from mail.planungsteam-eb.de (mail.planungsteam-eb.de [217.9.60.248])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8KKNlIk011111
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 16:23:48 -0400
Date: Tue, 20 Sep 2011 22:23:34 +0200
From: Holger Parplies <wopp@planungsteam-eb.de>
Message-ID: <20110920202334.GA3174@planungsteam-eb.de>
References: <4E784A95.8060709@gmail.com>
	<20110920133023.GA10330@planungsteam-eb.de>
	<4E789BBB.2040903@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E789BBB.2040903@gmail.com>
Subject: Re: [linux-lvm] Debian 64bit get a "Volume vg0 not found" message
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brent Clark <brentgclarklist@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

if we keep this on-list, there's a greater chance of someone with more
knowledge of LVM being able to help you (though it really doesn't strike
me as an LVM problem - more of an initrd problem involving LVM, though that
might be splitting hairs).

Brent Clark wrote on 20.09.2011 at 15:57:15 [Re: [linux-lvm] Debian 64bit get a "Volume vg0 not found" message]:
> [...]
> To answer your questions, I felt it would be best to take a few 
> screenshots. I really hope you dont mind, and you are still able and 
> willing to help.

* The first screenshot shows the tail of a boot attempt, in particular:

    Volume group "vg0" not found
    Skipping volume group vg0
  Unable to find LVM volume vg0/root
    Volume group "vg0" not found
    Skipping volume group vg0
  Unable to find LVM volume vg0/swap
  Gave up waiting for root device.  Common problems:
[...]
  ALERT!  /dev/mapper/vg0-root does not exist.  Dropping to a shell!

  (which then, in fact, happens).

* The second screenshot shows a 'vgdisplay' of vg0 from *a different system*
  (apparently a live rescue CD or something similar). This is basically
  meaningless. We know the VG exists. The question is why *the initrd used
  to boot* doesn't find it. You could try investigating from the initrd
  shell you end up in.

* The third screenshot shows the grub stanza used for booting, apparently
  at boot time and displayed by grub.

All of this seems to be happening inside a virtual machine, if I interpret
the window decoration in your screen shots correctly. I don't expect that to
matter, but I'll mention it for the sake of completeness.

Concerning the third screenshot, I don't think this matter has anything to do
with grub. grub's job is to load the kernel and the initrd - apparently it can
do so from RAID and LVM devices nowadays. In your case, /boot seems to reside
on /dev/md0 (which works for me even without RAID support in grub - it simply
reads one of the member devices of my RAID1 array; for other RAID levels,
this obviously wouldn't work without special support ;-).

Now it's up to the initrd to set up access to the root device, which could
potentially be accessed over NFS, be part of a RAID, or - in your case - LVM
VG, or need some special drivers (e.g. SCSI) that are not compiled into the
kernel. For some reason, this does not work for you. Actually, I've seen
exactly that same problem myself on a Debian etch system with root on LVM,
where I tried to install the squeeze kernel (both the etch and lenny kernels
find the root LV and mount it). I tried manually updating the initrd. For some
reason, this didn't work (or rather, it didn't solve the problem). It wasn't
that urgent for me, so I haven't looked into it any further until now, but I'm
still interested in a solution, so if somebody has one (or a pointer in the
right direction), I'd be grateful, too. Otherwise, I'll investigate once I find
some time. I'd also be grateful for corrections of any misconceptions I
might have.

One additional data point: a clean squeeze installation with root on LVM
works as expected, so [in my case] it's probably the combination of etch
userland and squeeze kernel that causes problems, not the squeeze kernel per
se.

So, the question remains: which Debian distribution and which kernel are you
using? Also, of what PVs does your VG consist? Assuming you are probably using
RAID devices there, too, the initrd could potentially activate RAID and LVM
in the wrong order or fail to activate RAID at all (it apparently *did* try to
activate LVM).

Hope some of that helps.

Regards,
Holger
