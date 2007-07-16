Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6G1eAlx025052
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 21:40:10 -0400
Received: from bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6G1e85j008014
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 21:40:08 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id AD4AE17FA8C
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 21:40:07 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 31156-01-3 for <linux-lvm@redhat.com>;
	Sun, 15 Jul 2007 21:40:07 -0400 (EDT)
Date: Sun, 15 Jul 2007 21:40:07 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
Message-ID: <20070716014007.GA31102@bdmcc-us.com>
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
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

On Sun, Jul 15, 2007 at 08:30:40PM -0500, Allan Wolfe wrote:
> 
> $ sudo mount -t ext3 /dev/sdb2 /media/other
> mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
>       missing codepage or other error
>       In some cases useful info is found in syslog - try
>       dmesg | tail  or so
> 
> Disk /dev/sdb: 40.0 GB, 40007761920 bytes
> 255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors
> Units = sectors of 1 * 512 = 512 bytes
> 
>   Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1   *          63      208844      104391   83  Linux
> /dev/sdb2          208845    78140159    38965657+  8e  Linux LVM
> 
> 
> I could use some help in understanding how to get the drive mounted since
> it was originally an lvm2 volume with ext3 filesystem laid on top of it.


Allan,

You said it right there.  Also, the fdisk output shows you something
too.

As you can see, the disk partition type is "LVM" and, in fact, when
mount looks at that partition to try and determine what file system type
to mount, all it sees is LVM, which mount doesn't understand.

Just before I give you the answer, what were the names of your VG and LV
in the old system?  If they conflict with the present system, does it
run LVM disks as well, you will have problems mounting even with what I
tell you.

In any case, if you issue "vgchange -a y" at your command line, the LVM2
system in your current machine will rescan all attached disk-like
devices and find your USB disk's LVM partition.  If the name doesn't
conflict with something in your system already, you can then go ahead
and mount the Logical Volumes that are found, just as you tried with the
Physical Volume, /dev/sdb2.

That is a rather short version of the explanation, so if it is "clear as
mud," feel free to ask again, and several people here will be able to
help you with your FC6 system.


Hope that helps,
Brian
