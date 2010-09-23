Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8NLCr6o031222
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 17:12:54 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8NLCf4e028156
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2010 17:12:42 -0400
Date: Thu, 23 Sep 2010 23:12:34 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100923211234.GA17638@maude.comedia.it>
References: <vmime.4c9a232f.1c6f.4fef62426d1bdb0e@pebblebeach.thenewhams.com>
	<20100923064306.GA3078@maude.comedia.it>
	<4C9B91A5.5020908@thenewhams.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C9B91A5.5020908@thenewhams.com>
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Adam Newham <adam@thenewhams.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>
> I also don't remember ever seeing /dev/md0p1 before, just a /dev/md0

i guessed as much

> root@adam-desktop:~# mdadm --examine --scan --verbose
> ARRAY /dev/md0 level=raid5 num-devices=4 
> UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
>    devices=/dev/sde,/dev/sdd,/dev/sdc,/dev/sdb
the above is the wrong md0 using whole disks

this one is the correct one
> ARRAY /dev/md0 level=raid5 num-devices=4 
> UUID=08558923:881d9efd:464c249d:988d2ec6
>    devices=/dev/sde1,/dev/sdd1,/dev/sdc1,/dev/sdb1
>
> root@adam-desktop:~# mdadm --examine --verbose /dev/sdb
> root@adam-desktop:~# mdadm --examine --verbose /dev/sdc
> root@adam-desktop:~# mdadm --examine --verbose /dev/sdd
> root@adam-desktop:~# mdadm --examine --verbose /dev/sde

you did not dump the partitions, but i guess you couldn't since the
device files disappeared

> root@adam-desktop:~# cat /proc/mdstat
> Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] 
> [raid4] [raid10]
> md0 : active raid5 sde[3] sdb[0] sdc[1] sdd[2]
>       2930287488 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]
>
> unused devices: <none>
>

put 
DEVICE /dev/sd?1
ARRAY /dev/md0 level=raid5 num-devices=4 UUID=08558923:881d9efd:464c249d:988d2ec6

into /etc/mdadm.conf (or /etc/mdadm/mdadm.conf, whatever ubuntu places
it) and reboot, you should be able to see your data.

after this ask on linux-raid ml for advice on how to zero the duplicate
superblock.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
