Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8905F7C5
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2018 17:39:12 +0000 (UTC)
Received: from postol.eschenberg.eu (postol.eschenberg.eu [89.144.28.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7193D1B6A
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2018 17:39:10 +0000 (UTC)
Received: from p5b05535b.dip0.t-ipconnect.de ([91.5.83.91]
	helo=[192.168.0.110]) (Authed sender Sven 'DarKRaveR' Eschenberg)
	by postol.eschenberg.eu via ESMTPSA
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim)
	(envelope-from <sven@eschenberg.eu>) id 1gCpML-0003yv-O5
	for linux-lvm@redhat.com; Wed, 17 Oct 2018 19:11:49 +0200
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
From: Sven Eschenberg <sven@eschenberg.eu>
Message-ID: <df3100f8-4cbb-4e34-7fe3-c5cbdbcc0ea3@eschenberg.eu>
Date: Wed, 17 Oct 2018 19:11:06 +0200
MIME-Version: 1.0
In-Reply-To: <20181008150016.GB21471@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
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

Hi List,

Unfortunately I answered directly to Gang He earlier.

I'm seeing the exact same faulty behavior with 2.02.181:

   WARNING: Not using device /dev/md126 for PV 
4ZZuWE-VeJT-O3O8-rO3A-IQ6Y-M6hB-C3jJXo.
   WARNING: PV 4ZZuWE-VeJT-O3O8-rO3A-IQ6Y-M6hB-C3jJXo prefers device 
/dev/sda because of previous preference.
   WARNING: Device /dev/sda has size of 62533296 sectors which is 
smaller than corresponding PV size of 125065216 sectors. Was device resized?

So lvm decices to pull up the PV based on the component device metadata, 
even though the raid is already up and running. Things worked as usual 
with a .16* version.

Additionally I see:
   /dev/sdj: open failed: No medium found
   /dev/sdk: open failed: No medium found
   /dev/sdl: open failed: No medium found
   /dev/sdm: open failed: No medium found

In what crazy scenario would a removeable medium be part of an VG and 
why in god's name would one even cosinder including removeable drives in 
the scan as a default?

For the time being I added a filter, as this is the only workaround. 
Funny enough, even though filtered, I am still getting the no medium 
messages - this makes absolutely no sense at all.

Regards

-Sven


Am 08.10.2018 um 17:00 schrieb David Teigland:
> On Mon, Oct 08, 2018 at 04:23:27AM -0600, Gang He wrote:
>> Hello List
>>
>> The system uses lvm based on raid1.
>> It seems that the PV of the raid1 is found also on the single disks that build the raid1 device:
>> [  147.121725] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sda2 was already found on /dev/md1.
>> [  147.123427] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sdb2 was already found on /dev/md1.
>> [  147.369863] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
>> [  147.370597] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
>> [  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG vghome while PVs appear on duplicate devices.
> 
> Do these warnings only appear from "dracut-initqueue"?  Can you run and
> send 'vgs -vvvv' from the command line?  If they don't appear from the
> command line, then is "dracut-initqueue" using a different lvm.conf?
> lvm.conf settings can effect this (filter, md_component_detection,
> external_device_info_source).
> 
>> This is a regression bug? since the user did not encounter this problem with lvm2 v2.02.177.
> 
> It could be, since the new scanning changed how md detection works.  The
> md superblock version effects how lvm detects this.  md superblock 1.0 (at
> the end of the device) is not detected as easily as newer md versions
> (1.1, 1.2) where the superblock is at the beginning.  Do you know which
> this is?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
