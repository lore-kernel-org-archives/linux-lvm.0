Return-Path: <Evan.Day@SUMMITSITE.COM>
Message-ID: <DC5B1A21E9E7D211B0020090273AD628242BC3@summit15.corvallis.summit>
From: "Day, Evan" <Evan.Day@SUMMITSITE.COM>
Subject: RE: [linux-lvm] odd problem
Date: Tue, 1 May 2001 15:48:28 -0700 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

It sounds like the kernel patch revision doesn't match the revision of 
the user-level tools - I saw these types of messages when running beta-7 
tools with a stock 2.4.3 kernel.  Have you made sure the tools/libraries 
on your initrd image are up to date?

-Evan

-----Original Message-----
From: Todd Underwood [mailto:todd@osogrande.com]
Sent: Tuesday, May 01, 2001 3:36 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] odd problem


folx,

i have 2.4.3 with beta-7 patches installed and beta-7 userland tools.  i'm
using lvm-initrd with a boot partition on /dev/hda2 and LVM root and other
filesystems on a few scsi disks.  all was working well but recently i
needed to reboot (i was unable to increase the size of my / with the
online ext2 tools and it was full--not sure what the error was there, or
whether that is relevant).

in any case, now i reboot and i get
lvm -- lvm_chr_ioctl:  unknown command 4004fe0a
vgchange -- volume group "rootvg" successfully activated

VGS: Mounted root (ext2 filesystem) readonly.
change_root: old root has d_count=3
Trying to unmount old root ... <7>uhci.c: suspect_hd
okay

a bunch of other stuff

then:

Activating swap partitions swapon: /dev/rootvg/swap: Invalid argument
Setting hostname zapata.staff.osogrande.net execvp: No such file or
directory

/etc/rc.d/rc.sysinit:  domainname: command not found

and so on.  looks like nothing's mounted.  the same kernel boots fine with
an older root fs on a 'real' partition.

any suggestions?

todd underwood
chief technology officer
oso grande technologies, inc.
todd@osogrande.com


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
