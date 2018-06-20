Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1766E30001E4
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 11:10:18 +0000 (UTC)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73B6D3082134
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 11:10:07 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id h10-v6so2841374wrq.8
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 04:10:07 -0700 (PDT)
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
From: Ryan Launchbury <ryan@magenta.tv>
Message-ID: <c454f732-5832-fe5e-60ed-96695da6927d@magenta.tv>
Date: Wed, 20 Jun 2018 12:10:02 +0100
MIME-Version: 1.0
In-Reply-To: <6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

Kernel is: Linux 3.10.0-693.21.1.el7.x86_64
Distro is: Centos 7 - Linux release 7.4.1708


Zdenek Kabelac wrote on 20/06/2018 11:15:
> Dne 20.6.2018 v 11:18 Ryan Launchbury napsal(a):
>> Hello,
>>
>> I'm having a problem uncaching logical volumes when the cache data 
>> chunck size is over 1MiB.
>> The process I'm using to uncache is: lvconvert --uncache vg/lv
>>
>>
>> The issue occurs across multiple systems with different hardware and 
>> different versions of LVM.
>>
>> Steps to reproduce:
>>
>>  1. Create origin VG & LV
>>  2. Add cache device over 1TB to the origin VG
>>  3. Create the cache data lv:
>>     lvcreate -n cachedata -L 1770GB cached_vg /dev/nvme0n1
>>  4. Create the cache metadata lv:
>>     lvcreate -n cachemeta -L 1770MB cached_vg /dev/nvme0n1
>>  5. Convert to a cache pool:
>>     lvconvert --type cache-pool --cachemode writethrough --poolmetadata
>>     cached_vg/cachemeta cached_vg/cachedata
>>  6. Enable caching on the origin LVM:
>>     lvconvert --type cache --cachepool cached_vg/cachedata 
>> cached_vg/filestore01
>>  7. Write some data to the main LV so as the cache device is used:
>>     dd if=/dev/zero of=/mnt/filestore01/test.dat bs=1M count=10000
>>  8. Check the cache stats:
>>     lvs -a -o +cache_total_blocks,cache_used_blocks,cache_dirty_blocks
>>  9. Repeating step 8 over time will show that the dirty blocks are 
>> not being
>>     written back at all
>> 10. Try to uncache the device:
>>     lvconvert --uncache cached_vg/filestore01
>> 11. You will get a repeating message. This will loop indefinitely and 
>> not
>>     decrease or complete:
>>     Flushing x blocks for cache cached_vg/filestore01.
>>
>> After testing multiple times, the issue seems to be tied to the chunk 
>> size selected in step 5. The LVM man page mentions that the chunk 
>> must be a multiple of 32KiB, however the next chunk size 
>> automatically assigned over 1MiB is usually 1.03MiB. With a chunk 
>> size of 1.03MiB or higher, the cache is not able to flush. Creating a 
>> cache device with a chunk size of 1MiB or less, the cache is flushable.
>>
>> Now knowing how to avoid the issue, I just need to be able to safely 
>> un-cache systems with do have a cache that will not flush.
>>
>> Details:
>>
>> Version info from lvm version:
>>
>> LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
>>    Library version: 1.02.140-RHEL7 (2017-05-03)
>>    Driver version:  4.35.0
>
> What is the kernel version and Linux distro in use ?
>
>>
>> System info:
>> System 1,2,3:
>> - Dell R730XD server
>> - 12x disk in RAID 6 to onboard PERC/Megaraid controller
>>
>> System 4:
>> -Dell R630 server
>> -60x Disk (6 luns) in RAID 6 to PCI megaraid controller
>>
>> The systems are currently in production, so it's quite hard for me to 
>> change the configuration to enable logging.
>>
>> Any assistance would be much appreciated! If any more info is needed 
>> please let me know.
>
> Hi
>
> Aren't there any kernel write errors in your 'dmegs'.
> LV becomes fragile if the associated devices with cache are having HW 
> issues (disk read/write errors)
>
> Zdenek

Nope, no write errors in /var/log/dmesg. The last log entry was at 
10.871493 and the system has been on for 61 days.

Best regards,
Ryan
