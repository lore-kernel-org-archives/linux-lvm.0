Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9F46024E
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 22:01:30 +0000 (UTC)
Received: from sonic315-9.consmr.mail.gq1.yahoo.com
	(sonic315-9.consmr.mail.gq1.yahoo.com [98.137.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A20FA820FF
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 22:01:29 +0000 (UTC)
Date: Tue, 24 Oct 2017 22:01:25 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <640472762.2746512.1508882485777@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <640472762.2746512.1508882485777.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Cherkasov <o1e9@member.fsf.org>
Cc: linux-lvm@redhat.com

Oleg wrote:

>> 0) what is the full DD command you are issuing? (I think we have this)
> dd if=file_250G of=/dev/null status=progress

You do realize this is copying data to virtual memory (ie it's buffering data) when that's pointless in both benchmark and backup/restore purposes. And also generating VM pressure and swapping until it's forced to discard pages or resort to OOM.
 
>> 1) does your DD command work when LVM is not using caching of any kind.
> Just dd had been running.

I mean you degraded your LVM device holding the 250GB to not have any caching at all (lvconvert --splitcache VG/CacheLV) and otherwise removed any and all associations with the SSD virtual device?
 
 >> 2) does your DD command work if using 'direct' mode
 > nope

what command modifiers did you use precisely? And this failure was also observed with striaght-up NON-cached LVM too?
 
>> 3) are you able to write smaller chunks from NON-cached LVM volume to SSD vdev?
>> Is there an inflection point in size where it goes haywire?
 
> Tried for a smaller file, system became unresponsive for few minutes, 
> LVM cache 51% however system survived with no reboot.

What was the size of this file that succeeded, if poorly?

How in the hell is the LVM cache being used at all? It has no business caching ANYTHING on streaming reads. Hmm, it turns out dm-cache/lvmcache really is retarded. It copies data to cache on first read and furthermore doesn't appear to detect streaming reads which have no value for caching purposes.

Somebody thought they were doing the world a favor when they clearly had insufficient real-world experience. Worse, you can't even tune away the not necessarily helpful assumptions.
https://www.mjmwired.net/kernel/Documentation/device-mapper/cache-policies.txt

If you guys over at RedHat would oblige with a Nerf clue-bat to the persons involved, being able to forcibly override the cache/promotion settings would be a very nice thing to have back. For most situations it may not have any real value, but for this pathological workload, a sysadmin should be able to intervene.

Much of what is below is besides the point now that dm-cache is stuck in permanent 'dummy mode'. I maintain that using SSD caching on your application (backup server, all streaming read/write) to be a total waste of time anyway. If you still persist in wanting a modicum of caching intelligence use BCache, (BTier?) or LSI Cachecade.

--------------------
what is output of
    lvs -o+cache_policy,cache_settings VG/CacheLV

Please remove LVM caching capability from everywhere including the origin volume and test writing to raw SSD virtual disk. ie. /dev/sdxx whatever the Dell VD is as recognized by the SCSI layer. I suspect your SSD is crap and/or the Perc+SSD combo is crap. Please test them independently of any confounding influences of your LVM origin. Test the raw block device, not anything (filesystem or lvm) layered on top.

What brand/type SSDs are we talking about?

Unless the rules have changed for a 250GB cache dataLV you need a metadata of at least 250MB. Somewhere I think someone said you had a whole lot less? Or did you alloc 1GB to the metadata and I'm mis-remembering?

What size did you set your cache_blocks to? 256k?

What is the output of dmsetup on your LVM origin in cached mode?

What did you set read_promote_adjustment and write_promote_adjustment to?
