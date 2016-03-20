Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2KHfqRK011589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 20 Mar 2016 13:41:52 -0400
Received: from fortimail.online.lv (fortimail.online.lv [81.198.164.220])
	by mx1.redhat.com (Postfix) with ESMTPS id 5972BD7D55
	for <linux-lvm@redhat.com>; Sun, 20 Mar 2016 17:41:50 +0000 (UTC)
Received: from mailo-proxy3.online.lv (smtp.online.lv [81.198.164.193])
	by fortimail.online.lv  with ESMTP id u2KHflwR016277-u2KHflwT016277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 20 Mar 2016 19:41:47 +0200
References: <56E9D1D2.8000403@apollo.lv> <56EA5D9D.30007@apollo.lv>
From: Raimonds Cicans <ray@apollo.lv>
Message-ID: <56EEE0DA.6020802@apollo.lv>
Date: Sun, 20 Mar 2016 19:41:46 +0200
MIME-Version: 1.0
In-Reply-To: <56EA5D9D.30007@apollo.lv>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvconvert -m 0 /dev/varlin/distfiles /dev/md0 =>
 zero filled logical volume
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
To: linux-lvm@redhat.com

On 17.03.2016 09:32, Raimonds Cicans wrote:
> On 16.03.2016 23:36, Raimonds Cicans wrote:
>> I am trying to move LVM setup from old RAID md0 to new RAID md1
>>
>> I did "lvconvert -m 1 /dev/path/to/logical_volume /dev/md1" on bunch of
>> logical volumes.
>> Everything went without problems.
>>
>> Then I tried to remove md0 from one of logical volumes by running
>> command:
>> lvconvert -m 0 /dev/varlin/distfiles /dev/md0
>>
>> I tried to mount this logical volume, but failed.
>>
>> Then I checked first  megabyte of logical volume it was zero filled.
>>
>> Partial output of "lvs -o+devices":
>>    LV              VG     Attr       LSize   Pool Origin Data%  Meta%
>> Move Log Cpy%Sync Convert Devices
>>    backup          varlin -wi-ao---- 100,00g
>> /dev/md0(6304)
>>    backup          varlin -wi-ao---- 100,00g
>> /dev/md0(8544)
>>    data            varlin -wi-ao----  20,00g
>> /dev/md0(28384)
>>    distfiles       varlin -wi-a-----  20,00g
>> /dev/md1(2738)
>>    ftp             varlin rwi-aor---  10,00g         100,00
>> ftp_rimage_0(0),ftp_rimage_1(0)
>>    ftpdown         varlin rwi-aor---  10,00g         100,00
>> ftpdown_rimage_0(0),ftpdown_rimage_1(0)
>>
>>
>> lvm2: 2.02.116
>> kernel: 4.4.2
>>
>>
>
> I made following test:
> I unmounted /opt and dumped to files following volumes:
> /dev/mapper/varlin-opt
> /dev/mapper/varlin-opt_rimage_0
> /dev/mapper/varlin-opt_rimage_1
>
> and then diff-ed them.
>
> /dev/mapper/varlin-opt_rimage_0 was not equal with /dev/mapper/varlin-opt.
> Why??? I thought 100 in Cpy%Sync column of lvs output mean volume is
> fully synchronized.
>
> With "lvconvert -m0" I removed /dev/mapper/varlin-opt_rimage_0 from
> /dev/mapper/varlin-opt.
>
> I did some test of volume - everything was normal.
>
> My plan for now:
> for each mirrored volume:
> 1) do volume content backup
> 2) umount volume
> 3) run md5sum for volume itself and all mirror sub-volumes
> 4) with "lvconvert -m0" remove sub-volume which is not equal to volume
> 5) do some volume tests
> 6) if something went wrong - restore volume content from backup
> 7) if on step 4 was removed new RAID md1, then make pvmove to md1
>
>

Plan failed, because one of sata controllers failed.
I moved all disks to other computer and booted from SystemRescueCD.
All volumes was synced. I checked by md5sum-ing volumes itself an both 
their legs.
Then I without problems moved all remaining volumes to new RAID.

So, case is closed.

Best regards,
Raimonds Cicans
