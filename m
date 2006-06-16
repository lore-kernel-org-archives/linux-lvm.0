Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GDPhi4019976
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 09:25:43 -0400
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GDPgBL029695
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 09:25:42 -0400
Message-ID: <4492B150.8070604@fastenal.com>
Date: Fri, 16 Jun 2006 08:25:36 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Device Mapper
References: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>
In-Reply-To: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Add "a|/dev/mapper/mpath.*|" to the filter= line of your lvm.conf as such.

filter = [ "a|/dev/sda2|", "a|/dev/mapper/mpath.*|", "r/.*/" ]

Then make sure your types= variable has device-mapper in it.

 types = [ "device-mapper", 1 ]

That should be all you need.


C'est Pierre wrote:
> Hello,
> 
> I've setup multipath with multipath-tools and I guess everything is OK
> there. However, I can't get lvm to recognize the multipath'ed devices:
> 
> # dmsetup ls
> 3600508b40010130d00006000011c0000p1     (253, 4)
> system-lv03     (253, 2)
> system-lv01     (253, 1)
> system-lv00     (253, 0)
> dm-3p2  (253, 7)
> dm-3p1  (253, 6)
> 
> cabtagdb01:~ # fdisk -l /dev/dm-3
> 
> Disk /dev/dm-3: 53.6 GB, 53687091200 bytes
> 64 heads, 32 sectors/track, 51200 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
> 
>     Device Boot      Start         End      Blocks   Id  System
> /dev/dm-3p1               1           1        1008   83  Linux
> /dev/dm-3p2               2       51200    52427776   8e  Linux LVM
> cabtagdb01:~ # fdisk -l /dev/mapper/3600508b40010130d00006000011c0000
> 
> Disk /dev/mapper/3600508b40010130d00006000011c0000: 53.6 GB, 53687091200
> bytes
> 64 heads, 32 sectors/track, 51200 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
> 
>                                         Device Boot      Start
> End      Blocks   Id  System
> /dev/mapper/3600508b40010130d00006000011c0000p1               1
>   1        1008   83  Linux
> /dev/mapper/3600508b40010130d00006000011c0000p2               2
> 51200    52427776   8e  Linux LVM
> 
> 
> # pvcreate /dev/dm-3p2
>  Device /dev/dm-3p2 not found.
> 
> # pvcreate /dev/mapper/3600508b40010130d00006000011c0000p2
>  Device /dev/mapper/3600508b40010130d00006000011c0000p2 not found.
> 
> Does anyone have any guess on what the problem might be? I seem to be
> one-step from getting this solved and I am going through these
> hassles.
> 
> Thank you,
> Pierre
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
