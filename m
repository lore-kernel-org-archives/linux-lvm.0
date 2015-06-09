Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t59J0r5J005680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 9 Jun 2015 15:00:53 -0400
Received: from mail-vn0-f53.google.com (mail-vn0-f53.google.com
	[209.85.216.53])
	by mx1.redhat.com (Postfix) with ESMTPS id E752A345B30
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2015 19:00:51 +0000 (UTC)
Received: by vnbf62 with SMTP id f62so4242179vnb.12
	for <linux-lvm@redhat.com>; Tue, 09 Jun 2015 12:00:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55761DE0.6070204@free.fr>
References: <CACaajQvSK0tgLjCCy5Fu-pWFMCWtGUBSnNZFA=NjECRPwBQCgg@mail.gmail.com>
	<55761DE0.6070204@free.fr>
Date: Tue, 9 Jun 2015 21:00:07 +0200
Message-ID: <CAE8gLhkFBO4bS=3gzS6aL-QwCjrn3yGKb7p4ut9TuvBFJv325w@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm raid1
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

Hi,

You can also create a VG from all the disks and then create raid1 LVs
on it. It depends on which is more convenient for you.

Here are some pros and cons I can think of (note that others may have
different views):

LVM over software RAID (mdadm):
– First you create your array with mdadm, and then run pvcreate on it,
form a VG, and then you can create your LVs.
– This way, you have more control over the RAID1 layer, as you can set
spare devices. The array is automatically rebuilt on the spare disk
when one of your active disks fails.
– Creating LVs is more convenient, as you don't need to bother with
mirroring them over the LVM layer.
– You can't choose which LVs to mirror and which LVs to not mirror.
Your entire VG is mirrored, so you can't differentiate between
important data and less important data.
– All of your disks need to be of the same size.

RAID over LVM:
– First you run pvcreate on all your disks and then add them to a VG.
(Note: it is highly recommended to partition the disks to have a valid
MBR/GPT, and then run pvcreate on the partitions. Thus, your pvcreate
command should look like: "pvcreate /dev/sda1 /dev/sdb1 /dev/sdc1
/dev/sdd1 /dev/sde1 /dev/sdf1".)
– You have less control over the RAID layer, as you can't set spare
devices (as far as I know), and if a disk fails, manual intervention
is necessary to remove the faulty disk from the VG and begin the
resynchronization to a new disk. (See the manual pages for "vgreduce
--removemissing", "lvconvert --replace", "lvconvert --repair".)
– You need to create your LVs like: "lvcreate --type raid1 --mirrors 3
..." to have mirrored LVs. LVM will take care of the RAID1 mirroring.
You can completely forget about mdadm, you won't even need to touch
it, ever.
– You can have LVs with different RAID levels in one VG. You can
choose to have more mirrors for more critical data and less mirrors
(or no mirror) for less important data. This way, you can manage your
storage more effectively, especially if your disks are not all the
same sizes.
– Your disks don't have to be of the same sizes. E.g. you can have
1TB, 500GB, 500GB disks and then seamlessly mirror everything from the
1TB disk to the other two. LVM will not complain. This scenario is not
possible with mdadm.

Personally, I consider RAID over LVM superior, as it is more dynamic
and allows more effective optimization of storage space. On the other
hand, when all your disks are the same size, and you need more control
over the RAID layer, need to set spare devices, and want your array to
rebuild without intervention, or you need higher RAID levels, mdadm
can be more effective. (LVM can also handle RAID4,5,6,10, but probably
with higher overhead and with less performance with mdadm – however,
it is just my intuition, please search for actual benchmark results if
this is your aim.)


MegaBrutal



2015-06-09 0:57 GMT+02:00 Georges Giralt <georges.giralt@free.fr>:
> Hello Vassiliy
> Do the other way around :
> Make an array using mdadm (md0)
> Run pvcreate on it and build your VG with this (these) PVs. (pvcreate
> /dev/md0)
> Then build all the LV you want on this VG
> Le 08/06/2015 07:33, Vasiliy Tolstov a écrit :
>>
>> Hi. I have such hardware:
>> /dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf (500Gb ssd)
>>
>> 1) i want to create raid1 using lvm raid1 personalities with 100Mb
>> size on top of this disk
>> 2) i want to create lv and format it to ext4/xfs of free space on each
>> disk
>>
>> If this is not possible with only lvm, how i can do this ? ( simple
>> create two lv on each disk and create via mdadm raid1? )
>>
>
> --
> If the only tool you have is a hammer, you tend to see every problem as a
> nail.
>                 Abraham Maslow
> A British variant :
> Any tool can serve as a hammer but a screwdriver makes the best chisel.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
