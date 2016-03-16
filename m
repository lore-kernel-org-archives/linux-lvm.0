Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GMuwoV013872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 18:56:58 -0400
Received: from fortimail.online.lv (fortimail.online.lv [81.198.164.220])
	by mx1.redhat.com (Postfix) with ESMTPS id 4A8676317E
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 22:56:56 +0000 (UTC)
Received: from mailo-proxy2.online.lv (smtp.online.lv [81.198.164.193])
	by fortimail.online.lv  with ESMTP id u2GMusxl015800-u2GMusxn015800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2016 00:56:54 +0200
References: <56E9D1D2.8000403@apollo.lv> <56E9D770.7070406@gathman.org>
From: Raimonds Cicans <ray@apollo.lv>
Message-ID: <56E9E4B5.8040300@apollo.lv>
Date: Thu, 17 Mar 2016 00:56:53 +0200
MIME-Version: 1.0
In-Reply-To: <56E9D770.7070406@gathman.org>
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

On 17.03.2016 00:00, Stuart Gathman wrote:
> On 03/16/2016 05:36 PM, Raimonds Cicans wrote:
>> I am trying to move LVM setup from old RAID md0 to new RAID md1
>>
>> I did "lvconvert -m 1 /dev/path/to/logical_volume /dev/md1" on bunch
>> of logical volumes.
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
>>   LV              VG     Attr       LSize   Pool Origin Data% Meta%
>> Move Log Cpy%Sync Convert Devices
>>   backup          varlin -wi-ao---- 100,00g /dev/md0(6304)
>>   backup          varlin -wi-ao---- 100,00g /dev/md0(8544)
>>   data            varlin -wi-ao----  20,00g /dev/md0(28384)
>>   distfiles       varlin -wi-a-----  20,00g /dev/md1(2738)
>>   ftp             varlin rwi-aor---  10,00g 100,00
>> ftp_rimage_0(0),ftp_rimage_1(0)
>>   ftpdown         varlin rwi-aor---  10,00g 100,00
>> ftpdown_rimage_0(0),ftpdown_rimage_1(0)
>>
>>
>> lvm2: 2.02.116
>> kernel: 4.4.2
>>
>>
>> Questions:
>>
>> 1) What I did wrong?
> I would have used pvmove.  Using lvconvert, I think you needed to sync
> the mirrors before removing a leg.

How do I sync mirror before removing leg? I thought 100 in Cpy%Sync 
column mean - everything is in sync.


Best regards,
Raimonds Cicans
