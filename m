Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q18JB8M7022144
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2012 14:11:08 -0500
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q18JB6oA009064
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2012 14:11:07 -0500
Received: by bkcjm19 with SMTP id jm19so1150404bkc.33
	for <linux-lvm@redhat.com>; Wed, 08 Feb 2012 11:11:06 -0800 (PST)
MIME-Version: 1.0
From: Dusty Mabe <dustymabe@gmail.com>
Date: Wed, 8 Feb 2012 14:10:46 -0500
Message-ID: <CAFfJ-R7foimYyQ-NKKUmNuTfpH0hCMjZ_qkTf7Wbs43gk33UWw@mail.gmail.com>
Subject: [linux-lvm] lvmconvert --merge fails to remove devices on rebbot
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
To: linux-lvm@redhat.com
Cc: Dusty Mabe <dustymabe@gmail.com>

Hi,

I am on CentOS 6.2  (kernel-2.6.32-220.el6.x86_64.rpm,
lvm2-2.02.87-6.el6.x86_64.rpm). I am seeing an issue similar to
https://bugzilla.redhat.com/show_bug.cgi?id=651007 where I still have
snapshot lvs present after I merge them back into the origin devices.

The steps are :

- create snapshot
- lvconvert --merge (on open lv so that the merge will happen on next reboot)
- reboot
- after reboot the lvs have been restored to original, but 'lvs -a'
still shows snapshot lvs

I was seeing many I/O errors during bootup like are shown in comment
13 of https://bugzilla.redhat.com/show_bug.cgi?id=651402 . I disabled
dmraid on bootup and I no longer get these errors but the snapshot lvs
are still present after the merge has taken place.

lvchange --refresh will clear up the snapshot lvs.


I do notice that dracut is touching the lvs (the ones to be merged)
early in the boot process:

dracut: Scanning devices vda2  for LVM logical volumes vgroot/plat_root
dracut: inactive Original '/dev/vgroot/plat_root' [1.00 GiB] inherit
dracut: inactive Original '/dev/vgroot/plat_var' [1.00 GiB] inherit
dracut: inactive Original '/dev/vgroot/plat_usr' [4.00 GiB] inherit
dracut: inactive '/dev/vgroot/plat_tmp' [1.00 GiB] inherit
EXT4-fs (dm-2): orphan cleanup on readonly fs
EXT4-fs (dm-2): 1 orphan inode deleted
EXT4-fs (dm-2): recovery complete
EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts:
dracut: Mounted root filesystem /dev/mapper/vgroot-plat_root
SELinux:  Disabled at runtime.
type=1404 audit(1328721625.889:2): selinux=0 auid=4294967295 ses=4294967295
dracut:
dracut: Switching root
                Welcome to CentOS


Is there an issue with dracut accessing and mounting the root lv
(which was set to be merged on next activation) ?

Note: dracut version is dracut-004-256.el6.noarch.rpm


Thanks for any help!
