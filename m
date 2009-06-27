Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5RLWoAM006033
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2009 17:32:50 -0400
Received: from kcout01.prserv.net (kcout01.prserv.net [12.154.55.31])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5RLWVDU020234
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2009 17:32:31 -0400
Message-ID: <4A468FEA.8080702@attglobal.net>
Date: Sat, 27 Jun 2009 14:32:26 -0700
From: Eddie Atherton <stunnel@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] highmem64G Breaks My LVM
References: <4A2377B0.4000707@attglobal.net> <4A271F59.7090607@attglobal.net>
In-Reply-To: <4A271F59.7090607@attglobal.net>
Content-Transfer-Encoding: 7bit
Reply-To: stunnel@attglobal.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Eddie Atherton wrote:
> Eddie Atherton wrote:
>> I originally posted this on the LinuxQuestions forum:  
>> http://www.linuxquestions.org/questions/slackware-14/highmem64g-kills-lvm-728418/ 
>>
>>
>> I have a fairly vanilla Slack 12.2 system.  I recently upped my 
>> memory to 8GB, and so recompiled the kernel, making a single change.  
>> HIGNMEM4G was changed to HIGHMEM64G.  On re-booting, I could see the 
>> extra memory, but, unfortunately, I lost all my LVM volumes.
>>
>> After a few checks, I found that vgscan was failing:
>>
>> root@The-Tardis:~# vgscan --mknodes --verbose
>>    Wiping cache of LVM-capable devices
>>    Wiping internal VG cache
>>  Reading all physical volumes.  This may take a while...
>>    Finding all volume groups
>>  /dev/sda1: Checksum error
>>    Finding all logical volumes
>>
>> If I reboot back to the HIGHMEM4G kernel, then all works fine again:
>>
>> root@The-Tardis:~# vgscan --mknodes --verbose
>>    Wiping cache of LVM-capable devices
>>    Wiping internal VG cache
>>  Reading all physical volumes.  This may take a while...
>>    Finding all volume groups
>>    Finding volume group "raid_vg"
>>  Found volume group "raid_vg" using metadata type lvm2
>>    Finding all logical volumes
>>
>> All the LVM volumes reside on an LSI megaRAID card, detected as 
>> /dev/sda, which is dedicated to a single PVM.
>>
>> Any ideas why changing the HIGHMEM kernel option would break LVM.
>>
>> Cheers,
>> Eddie
>
> Upgrading to the latest version of the combined device-mapper and lvm: 
> 2.02.47 appears to fix this issue.
>
OK, I have to re-open this one.  What I didn't check, after running 
2.02.47, was that I could read the files on my logical volumes 
correctly.  In fact I can't.  I get a different md5sum from before I 
made any changes, to the 2.02.47 version running on the HIGHMEM64G kernel.

So, the bottom line now, after running a number of tests, all with the 
2.02.47 version is this:

Using the HIGHMEM4G kernel, everything works perfectly.

Using the HIGHMEM64G kernel I am unable to use any files on my logical 
volumes, because of one of the following 2 issues.  I have tried 
rebooting a number of times, and sometimes the volumes mount, sometimes 
they don't:

Either the logical volumes are mounted correctly, but (nearly) every 
file I try and read is corrupted, as checked using md5sum.

Or, I cannot mount the volumes because of a checksum error.  Here's the 
relevant lines from the vgscan:
...
#device/dev-cache.c:259         /dev/sda: Aliased to /dev/block/8:0 in 
device cache (preferred name)
#device/dev-cache.c:247         /dev/sda1: Already in device cache
...
#device/dev-io.c:486         Opened /dev/sda RO
#device/dev-io.c:260       /dev/sda: size is 2930307072 sectors
#device/dev-io.c:387         WARNING: /dev/sda already opened read-only
#device/dev-io.c:562         /dev/sda: Immediate close attempt while 
still referenced
#device/dev-io.c:532         Closed /dev/sda
#device/dev-io.c:486         Opened /dev/sda RW O_DIRECT
#device/dev-io.c:134         /dev/sda: block size is 4096 bytes
#filters/filter.c:125         /dev/sda: Skipping: Partition table 
signature found
#device/dev-io.c:532         Closed /dev/sda
...
#device/dev-io.c:486         Opened /dev/sda1 RO
#device/dev-io.c:260       /dev/sda1: size is 2930304132 sectors
#device/dev-io.c:532         Closed /dev/sda1
#device/dev-io.c:260       /dev/sda1: size is 2930304132 sectors
#device/dev-io.c:486         Opened /dev/sda1 RW O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 2048 bytes
#device/dev-io.c:532         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:486         Opened /dev/sda1 RW O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 2048 bytes
#label/label.c:160       /dev/sda1: lvm2 label detected
#cache/lvmcache.c:985         lvmcache: /dev/sda1: now in VG 
#orphans_lvm2 (#orphans_lvm2)
#format_text/format-text.c:314   Incorrect metadata area header checksum
#format_text/format-text.c:1059         <backtrace>
#device/dev-io.c:532         Closed /dev/sda1
...

So, to me, it appears that LVM2 is incompatible with a kernel built with 
HIGHMEM64G.

Cheers,
Eddie
