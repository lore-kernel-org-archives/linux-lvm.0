Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s14Gl9fW005454
	for <linux-lvm@redhat.com>; Tue, 4 Feb 2014 11:47:10 -0500
Message-ID: <52F1198B.8000706@redhat.com>
Date: Tue, 04 Feb 2014 17:47:07 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20140123142700.315e2d3f@leda.localdomain>
	<20140204095544.65cad0f2@leda.localdomain>
In-Reply-To: <20140204095544.65cad0f2@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2 2.02.105 breaks snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 4.2.2014 09:55, Christian Hesse napsal(a):
> Christian Hesse <list@eworm.de> on Thu, 2014/01/23 14:27:
>> Hello everybody,
>>
>> looks like lvm2 2.02.105 breaks snapshots. This is my block device tree:
>>
>> NAME                MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
>> sda                   8:0    0   477G  0 disk
>> |-sda1                8:1    0   767M  0 part
>> | `-vg0-boot        254:0    0    64M  0 lvm   /boot
>> |-sda2                8:2    0 444,2G  0 part
>> | `-cvg             254:3    0 444,2G  0 crypt
>> |   |-cvg-root      254:4    0    40G  0 lvm   /
>> |   |-cvg-swap      254:5    0     4G  0 lvm   [SWAP]
>> |   |-cvg-log       254:6    0     1G  0 lvm   /var/log
>> |   `-cvg-home      254:8    0   320G  0 lvm   /home
>> |-sda3                8:3    0    32G  0 part
>> `-sda128            259:0    0     1M  0 part
>>
>> Creating a snapshot succeeds, but it is broken and can not be mounted:
>>
>> # lvcreate -s -pr -l50%free -n snap-home cvg/home
>>    Logical volume "snap-home" created
>> # mount /dev/cvg/snap-home /mnt/tmp
>> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only
>> mount: wrong fs type, bad option, bad superblock on
>> /dev/mapper/cvg-snap--home, missing codepage or helper program, or other
>> error
>>
>> Syslog has a lot of these messages:
>>
>> [ 4823.002220] EXT4-fs (dm-7): ext4_check_descriptors: Checksum for group
>> 256 failed (43470!=57954)
>>
>> Downgrading to lvm2 2.02.104 fixes the problem:
>>
>> # lvcreate -s -pr -l50%free -n snap-home
>> cvg/home Logical volume "snap-home" created
>> # mount /dev/cvg/snap-home /mnt/tmp
>> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only
>>
>> This is an Arch Linux system with Linux 3.12.8.
>
> Hello everybody,
>
> did anybody notice my mail? This is a real regression for me and I would like
> to get this sorted. I will help with whatever is needed to find the problem.
>


Ok -  could you test this:

Create an lv  -  ('lvcreate -Lsmallsize  vg'
mount this lv somewhere
modify this filesystem (via dd)

'fsfreeze --freeze  mountpoint'

now  - copy whole frozen device somewhere (via dd)

'fsfreeze --unfreeze mountpoint'

umount mountpoint

losetup -r  /dev/loop_free_number    frozen_copy_of_device

and now - try to mount your  read-only loop device copy.

Does it work for you ?

I've been testing this - and it seem fsfreeze API in kernel is not working 
properly and you need to reply journal.

Then try to repeat the same with 3.10 kernel and 3.4 kernel.

So far I'm not convinced lvm2 version has anything to do with this problem

For 3.10  ext4 seems to work, but xfs is broken.

Regards

Zdenek
