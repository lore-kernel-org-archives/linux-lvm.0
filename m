Message-ID: <393D26D7.67C53600@icp.siemens.com>
Date: Tue, 06 Jun 2000 12:29:11 -0400
From: Brian Kress <kressb@icp.siemens.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
References: <H0000aed07d348ed@MHS>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: holger_zecha@hp.com
Cc: linux-lvm@msede.com

holger_zecha@hp.com wrote:
> 
> Are you going to implement mirroring in Linux LVM ? 

	You can get mirroring using the MD driver.  You can then
either use the MD device, or you can put LVM on top of that, in 
which case all your LVs are mirrored.

> Why is it such a big problem to have the root filesystem on a LVM volume ?

	This is a limit of the somewhat braindead PC architure.
Since it doesn't have a proper firmware, the boot loader
has to know where to find the kernel.  Hence it can only find
the kernel in data structures it knows about.
	If all you are looking for is a mirrored boot partition,
the latest versions of LILO (the Linux boot loader most commonly
used) can boot off of mirrored disks.

> So we see these two points as big disadvantages:
> a) root Filesystem not on LVM

	Well, techinically you can put root in LVM (it requires
fiddling with initrd and it probably not worth it).  It's /boot
(or wherever you put the kernel) that needs to be outside LVM.

> b) no mirroring.

	Use MD.


Brian Kress
kressb@icp.siemens.com
