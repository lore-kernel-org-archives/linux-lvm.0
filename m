Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95G5egK000975
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 12:05:40 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95G5Rs5029160
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 12:05:28 -0400
Received: by gwj17 with SMTP id 17so2567650gwj.33
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2010 09:05:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1010051017001.29065@bmsred.bmsi.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
	<AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<Pine.LNX.4.64.1010050215180.26224@bmsred.bmsi.com>
	<AANLkTi=5CZ+Z1vJv3qfdy0RMNiE0js-amQ9V7+d3iAff@mail.gmail.com>
	<Pine.LNX.4.64.1010051017001.29065@bmsred.bmsi.com>
Date: Tue, 5 Oct 2010 21:23:30 +0530
Message-ID: <AANLkTi=_U7XNK3M+f7bSu3g0CgJsZdm+pYE9=Pto6EOu@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 5, 2010 at 7:55 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Tue, 5 Oct 2010, Tapas Mishra wrote:
>
>> On Tue, Oct 5, 2010 at 11:54 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:
>> > 3) an "LV" is a Logical Volume. �An advanced user might want to use an
>> > � LV to simulate a disk, putting a partitional table on it. �Usually
>> > � this is done by using the LV as a virtual disk for a Virtual Machine,
>> > � which then partitions and uses the virtual disk as it pleases.
>> > � You could also use fdisk/parted to partition an LV, and kparted to
>> > � make the partitions available as separate block devices.
>>
>> This is exactly what I am looking at.
>> A tool virt-manager (from Red Hat does that)
>> how does it do ?
>> While installing a guest OS in an LVM I do not have to create a swap I
>> just point to the ISO on my server
>> and rest is done.
>> How is that part taken care of does virt-manager do it or the OS which
>> is being installed some thing from that makes sure that when you are
>> installing a guest OS in a virtualization environment then in an LVM
>> it will do.
>> Because I never needed to create partitions within LVM until I am
>> doing this setup to clone the LVM on the server to a
>> USB backup drive.
>
> 1) man kpartx
>
> 2) "partitions within LVM" doesn't make sense. �LVM is a software package,
> � not a storage device, and it doesn't do partitions.
> � You probably mean "partitions within an LV".
>
> Here is an example of using kpartx:
>
> # lvcreate -L1G -n test vg_sdg
> # fdisk /dev/vg_sdg/test
> ...
> # sfdisk -l /dev/vg_sdg/test
>
> Disk /dev/vg_sdg/test: 130 cylinders, 255 heads, 63 sectors/track
> Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
>
> � Device Boot Start � � End � #cyls � �#blocks � Id �System
> � /dev/vg_sdg/test1 � � � � �0+ � � 99 � � 100- � �803218+ �83 �Linux
> � /dev/vg_sdg/test2 � � � �100 � � 129 � � �30 � � 240975 � 82 �Linux swap / Solaris
> � /dev/vg_sdg/test3 � � � � �0 � � � - � � � 0 � � � � �0 � �0 �Empty
> � /dev/vg_sdg/test4 � � � � �0 � � � - � � � 0 � � � � �0 � �0 �Empty
> # kpartx -l /dev/vg_sdg/test
> vg_sdg-test1 : 0 1606437 /dev/vg_sdg/test 63
> vg_sdg-test2 : 0 481950 /dev/vg_sdg/test 1606500
> # kpartx -av /dev/vg_sdg/test
> add map vg_sdg-test1 (253:6): 0 1606437 linear /dev/vg_sdg/test 63
> add map vg_sdg-test2 (253:7): 0 481950 linear /dev/vg_sdg/test 1606500
> # mke2fs /dev/mapper/vg_sdg-test1
> mke2fs 1.41.9 (22-Aug-2009)
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 50288 inodes, 200804 blocks
> 10040 blocks (5.00%) reserved for the super user
> First data block=0
> Maximum filesystem blocks=209715200
> 7 block groups
> 32768 blocks per group, 32768 fragments per group
> 7184 inodes per group
> Superblock backups stored on blocks:
> � � � �32768, 98304, 163840
>
> � � � �Writing inode tables: done
> � � � �Writing superblocks and filesystem accounting information: done
>
> � � � �This filesystem will be automatically checked every 29 mounts or
> � � � �180 days, whichever comes first. �Use tune2fs -c or -i to override.
> # mount /dev/mapper/vg_sdg-test1 /mnt/tmp
> # df
> Filesystem � � � � � 1K-blocks � � �Used Available Use% Mounted on
> /dev/dm-1 � � � � � � 15481840 �12143008 � 2552400 �83% /
> tmpfs � � � � � � � � � 512672 � � � 404 � �512268 � 1% /dev/shm
> /dev/sda1 � � � � � � � 295561 � � 95222 � �185079 �34% /boot
> /dev/dm-0 � � � � � � 36124288 �31419784 � 2869688 �92% /home
> /dev/dm-3 � � � � � � 10321208 � 5969640 � 3827324 �61% /video
> /dev/sr1 � � � � � � � � �6828 � � �6828 � � � � 0 100% /media/U3 System
> /dev/sdb1 � � � � � � �7837760 � 2046560 � 5791200 �27% /media/Cruzer
> /dev/mapper/vg_sdg-test1
> � � � � � � � � � � � �790556 � � � 808 � �749588 � 1% /mnt/tmp
I was about to reply but you posted it first.
By  the time  your message came I had been able to do it by steps
similar to what you mentioned above.
