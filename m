Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBU1kqKq029860
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 20:46:52 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBU1kkWk027631
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 20:46:47 -0500
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de via ESMTP (Exim)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1VxRwL-00015Q-OV
	for linux-lvm@redhat.com; Mon, 30 Dec 2013 02:46:45 +0100
Message-ID: <0930dbad0e746334315c5203d1b67457.squirrel@ssl.verfeiert.org>
In-Reply-To: <52C0C51C.7060806@gmail.com>
References: <52C0C51C.7060806@gmail.com>
Date: Mon, 30 Dec 2013 02:46:45 +0100
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove is not deleting the file system
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi Guy,

This is not really a LVM problem I think. Basically lvremove only removes
a logical volume, which means, the metadata is discarded and the PEs are
released back into the allocation pool. It does not wipe the area (which
you somehow assumed as far as I understand your post).

Think of this, once you delete a partition table and recreate it with the
same layout, all filesystems will be available, if the drive was not
touched in any way.

The question seems to be: What is your actual intention?

Regards

-Sven

On Mon, December 30, 2013 01:58, Guy Rouillier wrote:
> I'm using xen-create-image in an attempt to set up a new VM; host OS is
> Ubuntu Server 13.10, and I'm using LVM.  I failed in my first attempt
> due to my inexperience, so I changed some input parameters and I'm
> trying again.  The first attempt had successfully created the target LVM
> volumes for boot, root and swap, so I used lvremove to delete them.  All
> that went without error.
>
> However, now when I try to run xen-create-image, I get the following
> error at the beginning when xen-create-image tries to create the target
> volumes:
>
> Creating btrfs filesystem on /dev/dell-vg/oraclelinux-root
> /dev/dell-vg/oraclelinux-root appears to contain an existing filesystem
> (btrfs).
> Error: Use the -f option to force overwrite.
> Running command 'mkfs.btrfs /dev/dell-vg/oraclelinux-root 2>&1' failed
> with exit code 256.
> Aborting
>
> I've tried searching for this error but can't find anything helpful.
> I've rerun this a dozen times and get the same result each time
> (deleting the created volumes and rebooting between each attempt.)  I
> looked in the /dev tree, and I see the dm node (dm-4) disappears after I
> run lvremove.  But apparently, lvremove doesn't delete the filesystem.
> So when I recreate the same volume in the same order, the filesystem is
> still there from the previous attempt.
>
> How do I fix this?  Thanks.
>
> --
> Guy Rouillier
>
> ---
> This email is free from viruses and malware because avast! Antivirus
> protection is active.
> http://www.avast.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
