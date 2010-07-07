Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o67DlOLT029617
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 09:47:24 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o67DlFOr005637
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 09:47:15 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OWUy1-00031b-Gs
	for linux-lvm@redhat.com; Wed, 07 Jul 2010 06:47:13 -0700
Date: Wed, 07 Jul 2010 08:47:12 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <AANLkTilPQsBnVh_bSQE9CsTcswDX89_H8_Ea-5SWcBaW@mail.gmail.com>
	(from bh@udev.org on Wed Jul  7 08:32:49 2010)
Message-Id: <1278510432.9312.14@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Only 4MB of space on a 1GB file mounted in loopback
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> but I end up with a file of 4MB, do you have any idea what went wrong?

You end up with a logical volume of 4 MB.  Let's look at where you
created that logical volume:

> lvcreate -i1 -l 1 -n testvol testgroup

"-l 1" sets the size as 1 logical extent, which is 4MB by default.

   Note that if you are using version 1 of LVM, or using
version 1 style metadata with LVM2, a 4MB extent size limits
the size of logical volumes you can create to 255GB (256GB?).
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 07/07/2010 08:32:49 AM, Benjamin Henrion wrote:
> Hi,
> 
> I have setup some LVM volume to test on a loopback file of 1GB, but I
> end up with a file of 4MB, do you have any idea what went wrong?:
> 
> ===========================================================
> root@buzek /home/zoobab [22]# dd if=/dev/zero of=1G.img bs=1G count=1
> 1+0 records in
> 1+0 records out
> 1073741824 bytes (1.1 GB) copied, 13.6855 s, 78.5 MB/s
> root@buzek /home/zoobab [23]# losetup -f
> /dev/loop5
> root@buzek /home/zoobab [24]# losetup /dev/loop5 1G.img
> root@buzek /home/zoobab [25]#  pvcreate /dev/loop5
>   Physical volume "/dev/loop5" successfully created
> root@buzek /home/zoobab [26]# vgcreate testgroup /dev/loop5
>   Volume group "testgroup" successfully created
> root@buzek /home/zoobab [27]# lvcreate -i1 -l 1 -n testvol testgroup
>   Redundant stripes argument: default is 1
>   Logical volume "testvol" created
> root@buzek /home/zoobab [28]# mkfs.ext3 /dev/testgroup/testvol
> mke2fs 1.41.9 (22-Aug-2009)
> Filesystem label=
> OS type: Linux
> Block size=1024 (log=0)
> Fragment size=1024 (log=0)
> 1024 inodes, 4096 blocks
> 204 blocks (4.98%) reserved for the super user
> First data block=1
> Maximum filesystem blocks=4194304
> 1 block group
> 8192 blocks per group, 8192 fragments per group
> 1024 inodes per group
> Writing inode tables: done
> Creating journal (1024 blocks): done
> Writing superblocks and filesystem accounting information: done
> This filesystem will be automatically checked every 31 mounts or
> 180 days, whichever comes first.  Use tune2fs -c or -i to override.
> root@buzek /home/zoobab [29]# mount /dev/testgroup/testvol  /mnt
> root@buzek /home/zoobab [30]# cd /mnt
> root@buzek /mnt [31]# df -lha
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/sda1              57G   46G  7.7G  86% /
> proc                     0     0     0   -  /proc
> none                     0     0     0   -  /sys
> none                     0     0     0   -  /sys/fs/fuse/connections
> none                     0     0     0   -  /sys/kernel/debug
> none                     0     0     0   -  /sys/kernel/security
> udev                  1.4G  260K  1.4G   1% /dev
> none                     0     0     0   -  /dev/pts
> none                  1.4G  900K  1.4G   1% /dev/shm
> none                  1.4G  124K  1.4G   1% /var/run
> none                  1.4G     0  1.4G   0% /var/lock
> none                  1.4G     0  1.4G   0% /lib/init/rw
> binfmt_misc              0     0     0   -  /proc/sys/fs/binfmt_misc
> gvfs-fuse-daemon      0.0K  0.0K  0.0K   -  /home/zoobab/.gvfs
> /dev/mapper/testgroup-testvol
>                       3.9M  1.1M  2.7M  29% /mnt
> root@buzek /mnt [32]#
> ===========================================================
> 
> --
> Benjamin Henrion <bhenrion@ffii.org>
> FFII Brussels - +32-484-566109 - +32-2-4148403
> "In July 2005, after several failed attempts to legalise software
> patents in Europe, the patent establishment changed its strategy.
> Instead of explicitly seeking to sanction the patentability of
> software, they are now seeking to create a central European patent
> court, which would establish and enforce patentability rules in their
> favor, without any possibility of correction by competing courts or
> democratically elected legislators."
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
