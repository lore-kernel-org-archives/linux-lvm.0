Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4233tv09449
	for <linux-lvm@redhat.com>; Sat, 1 May 2004 23:03:55 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i4233s99010482
	for <linux-lvm@redhat.com>; Sat, 1 May 2004 23:03:54 -0400
Message-ID: <11074-13672@sneakemail.com>
Date: Sun, 02 May 2004 02:17:05 +0200
From: "Peter Valdemar Morch" <swp5jhu02@sneakemail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
References: <408C2883.5080606@sneakemail.com>
	<20040426135853.GA17309@null.msp.redhat.com>
In-Reply-To: <20040426135853.GA17309@null.msp.redhat.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

AJ Lewis alewis-at-redhat.com |Lists| wrote:
> Someone made a new initrd creation script and posted it here:
> http://www.poochiereds.net/svn/lvm2/
> I can't guarentee it'll work, but i've heard good things about it.  Use it
> against the 2.6.5 kernel you compiled.

OK, so now I've tried to use that. After dealing with a missing=20
/lib/lvm-200/lvm (mkdir /lib/lvm-200; ln -s /sbin/lvm /lib/lvm-200/lvm)=20
  and a missing /bin/busybox (cp /sbin/busybox /bin) I now have a=20
/boot/initrd-lvm2-2.6.5.gz!!!! This is progress!!!!

During boot of my freshly compiled 2.6.5 kernel+initrd, I get this=20
message on the console:

RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 236k freed
Warning unable to open an initial console.
Kernel panic: Attempted to kill init!

At this point all I can do is hit the reset button and reboot in good=20
ol' 2.4.20. What do I need to do now?

It prints out a lot more than this, but I don't know how to capture it.=20
(do you?) Also, it prints more than one screen, but I don't know how to=20
scroll up, and the previous screens scroll by very fast... (E.g. it=20
detects my RAID1 volumes apparently - that fills most of the screen I=20
can see)

[root@valde linux-2.6.5]# grep -i console .config
# CONFIG_NETCONSOLE is not set
CONFIG_VT_CONSOLE=3Dy
CONFIG_HW_CONSOLE=3Dy
CONFIG_LP_CONSOLE=3Dy
# Console display driver support
CONFIG_VGA_CONSOLE=3Dy
CONFIG_MDA_CONSOLE=3Dm
CONFIG_DUMMY_CONSOLE=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE is not set

Uhm, what is the console that it can't open, and how do I fix that? Is=20
this still LVM related? Or is it more of a standard 2.6.5 thing?

***********************************************************************
grub.conf entry
***********************************************************************
lvm2create_initrd.sh suggests that images should be relative to /boot/=20
but I could only get this far with images relative to / as in:

title 2.6.5
         kernel /vmlinuz-lvm2-2.6.5 root=3D/dev/ram0=20
lvm2root=3D/dev/Volume00/LogVol00
         initrd /initrd-lvm2-2.6.5.gz

Does the missing '/boot/' prefix surprise anybody?

***********************************************************************
Maybe the following is relevant (I think not), but it seems to have to=20
do with consoles...
***********************************************************************

During running lvm2create_initrd.sh, it prints out this:

lvm2create_initrd.sh -- adding required /dev files
don't know how to make device "consoleonly"

Well, neither do I! A little snippet from my console:

[root@valde root]# grep BASICDEV /sbin/lvm2create_initrd.sh
BASICDEVICES=3D"std consoleonly fd"
verbose "BASICDEVICES: `echo $BASICDEVICES`"
(cd $TMPMNT/dev; /dev/MAKEDEV $OPT_Q $BASICDEVICES $BLOCKDEVICES)

So basically /sbin/lvm2create_initrd.sh has hardcoded the fact that it=20
should:
/dev/MAKEDEV std consoleonly
among other params. But *my* MAKEDEV doesn't know how to make a consoleonly:

[root@valde root]# /dev/MAKEDEV std
[root@valde root]# /dev/MAKEDEV consoleonly
don't know how to make device "consoleonly"
[root@valde root]# rpm -qf /dev/MAKEDEV
MAKEDEV-3.3.2-5

--=20
Peter Valdemar M=EF=BF=BDrch
http://www.XXXXXXXXX
