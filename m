Return-Path: <unseen@sover.net>
Date: Tue, 6 Mar 2001 03:02:51 -0500 (EST)
From: Jason Walker <unseen@sover.net>
Subject: Re: [linux-lvm] How to install/update on an existing system with
 reiserfs/lvm
In-Reply-To: <3AA41583.36E1CDE2@attglobal.net>
Message-ID: <Pine.LNX.4.10.10103060253570.6268-100000@surreal.localdomain>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Greetings,

	Yes, I certainly see your dillema. One word: Bootdisk-HOWTO.  I have
been meaning to make a resque diskette, with LVM, reiserfs, and XFS (I
run them all) because with so much beta code on my box, it would just be
dumb not too :)  However, you will be facing an issue I have struggled with
before: you need an install disk.  I really don't know how to do that.
The best thing for you to do is to *somehow* get the .config for the kernel
they put on the diskette, then it's just a batter of enabling LVM, and
placing the LVM userspace tools on it.  I have a feeling that if it is not
a 2 disk boot set, it will be by the time you are finished. One disk for
the kernel, another for a compressed disk image.  the 2.4.x is a bit larger
than 2.2.x (just as 2.2.x was larger than 2.0.x) so getting anything but a
*minimum* root image on the same disk as a kernel is out of the question.
My 2.4.2 hovers around 1000k, and I am a fan of modules (XFS is about 150k
of that I *think*)
	Anyways, I hope this helps you. Feel free to contact me any time about
this, I would be happy to help.

RegEx

On Mon, 5 Mar 2001, Les Hazelton wrote:

> I am currently running Mandrake 7.2 with a 2.4.2 kernel and the
> lvm-0.9.1-beta5 patch. 
> 
> The system has one vg and several lv each containing a reiserfs
> filesystem.  The only part of the system not reiserfs/lvm is /boot which
> is on a small primary partition using ext2fs.
> 
> The system is running quite well and I am very pleased with the current
> configuration. The problem I have, or will have, is related to a desire
> to migrate to Mandrake 8.0 when the final version is released.
> 
> I don't expect to be able to boot directly from the CD and have my
> filesystems recognized.  I think I will need to build an install/boot
> disk with a replaced kernel that has support for reiserfs/lvm.
> 
> The problem is, I don't know how to build a boot disk with a replaced
> kernel.  Can anyone help me with this?  I would appreciate any pointers
> to how-to, web page or ... that explains the required steps.
> -- 
> 
> Good Journey, longevity and prosperity to all
> 
> Les Hazelton
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 

-- 
Jason Walker -- unseen@sover.net, perlgod@hotmail.com
UIN: 110493687
AIM: Nightface

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
			 
