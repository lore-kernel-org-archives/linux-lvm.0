Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3SHjbsK020542
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 13:45:37 -0400
Received: from smtp1-g19.free.fr (smtp1-g19.free.fr [212.27.42.27])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3SHjZdt016147
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 13:45:35 -0400
Received: from free.fr (gar13-1-82-227-28-39.fbx.proxad.net [82.227.28.39])
	by smtp1-g19.free.fr (Postfix) with SMTP id 2989DB932E
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 19:45:35 +0200 (CEST)
Date: Sat, 28 Apr 2007 19:45:35 +0200
From: Yann Boutin <yann.boutin@free.fr>
Subject: Re: [linux-lvm] can't mount vfat fs on lvm created by winxp guest on
	xen
Message-ID: <20070428174535.GB6807@gentoo>
References: <20070428103303.GA11539@gentoo> <463354A0.5040604@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <463354A0.5040604@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 15:05 Sat 28 Apr     , Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Yann Boutin wrote:
> > Greetings, 
> > I've had no success with mounting a vfat file system created by a 
> > Windows XP guest on a lvm volume. Windows XP guest is running under xen 3.0.5 rc3.
> > 
> > # mount -t vfat /dev/vg1/win1 /mnt/
> > mount: wrong fs type, bad option, bad superblock on /dev/vg1/win1,
> >        missing codepage or other error
> >        In some cases useful info is found in syslog - try
> >        dmesg | tail  or so
> > 
> 
> Presumably, the windows install partitioned the raw storage?
> 
> Try running "file -s /dev/vg1/win1". If it says something like this:
> 
> /dev/sda: x86 boot sector; partition 1: ID=0x83, active, starthead 1,
> startsector 63, 208782 sectors; partition 2: ID=0x8e, starthead 0,
> startsector 208845, 195157620 sectors, code offset 0x48
> 
> Then there's a partition table on the device and the VFAT file system is
> in a partition on it.
> 
> You can map those partitions using kpartx. Run:
> 
> kpartx -a /dev/vg1/win1
> 
> And you should see some new entries in /dev/mapper like win1p1 win1p2
> etc. You can remove them with:
> 
> kpartx -d /dev/vg1/win1

Actually I solved my problem the same way but by hand. I map the first inner partition with dmsetup with adding an offset of 63 blocks. But really thanks for your answer and Kpartx is much simplier.

I've started a similar thread here too :
http://lists.xensource.com/archives/html/xen-users/2007-04/msg00846.html

Best regards

   Yann.
