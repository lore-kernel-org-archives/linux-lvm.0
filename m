Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E6D8F020
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2018 17:10:28 +0000 (UTC)
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A19CA3004417
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2018 17:10:17 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id w2-v6so7258252otj.12
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2018 10:10:17 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <5425366f-f339-d6f3-26d1-d02c3ba80671@gmail.com>
References: <CAJCQCtQ3r16BYYtrx9rVYauh7JeAp9omWidS4zzwxqvhU1bh+g@mail.gmail.com>
	<5425366f-f339-d6f3-26d1-d02c3ba80671@gmail.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Mon, 16 Apr 2018 11:10:16 -0600
Message-ID: <CAJCQCtRzmBys+eYsd=zsAK1deYQt47nysHQBdn3CreOmObz59g@mail.gmail.com>
Subject: Re: [linux-lvm] Add udev-md-raid-safe-timeouts.rules
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, Linux-RAID <linux-raid@vger.kernel.org>, linux-lvm@redhat.com, Chris Murphy <lists@colorremedies.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>

Adding linux-usb@ and linux-scsi@
(This email does contain the thread initiating email, but some replies
are on the other lists.)

On Mon, Apr 16, 2018 at 5:43 AM, Austin S. Hemmelgarn
<ahferroin7@gmail.com> wrote:
> On 2018-04-15 21:04, Chris Murphy wrote:
>>
>> I just ran into this:
>>
>> https://github.com/neilbrown/mdadm/pull/32/commits/af1ddca7d5311dfc9ed60a5eb6497db1296f1bec
>>
>> This solution is inadequate, can it be made more generic? This isn't
>> an md specific problem, it affects Btrfs and LVM as well. And in fact
>> raid0, and even none raid setups.
>>
>> There is no good reason to prevent deep recovery, which is what
>> happens with the default command timer of 30 seconds, with this class
>> of drive. Basically that value is going to cause data loss for the
>> single device and also raid0 case, where the reset happens before deep
>> recovery has a chance. And even if deep recovery fails to return user
>> data, what we need to see is the proper error message: read error UNC,
>> rather than a link reset message which just obfuscates the problem.
>
>
> This has been discussed at least once here before (probably more times, hard
> to be sure since it usually comes up as a side discussion in an only
> marginally related thread).  Last I knew, the consensus here was that it
> needs to be changed upstream in the kernel, not by adding a udev rule
> because while the value is technically system policy, the default policy is
> brain-dead for anything but the original disks it was i9ntended for (30
> seconds works perfectly fine for actual SCSI devices because they behave
> sanely in the face of media errors, but it's horribly inadequate for ATA
> devices).
>
> To re-iterate what I've said before on the subject:
>
> For ATA drives it should probably be 150 seconds.  That's 30 seconds beyond
> the typical amount of time most consumer drives will keep retrying a sector,
> so even if it goes the full time to try and recover a sector this shouldn't
> trigger.  The only people this change should negatively impact are those who
> have failing drives which support SCT ERC and have it enabled, but aren't
> already adjusting this timeout.
>
> For physical SCSI devices, it should continue to be 30 seconds.  SCSI disks
> are sensible here and don't waste your time trying to recover a sector.  For
> PV-SCSI devices, it should probably be adjusted too, but I don't know what a
> reasonable value is.
>
> For USB devices it should probably be higher than 30 seconds, but again I
> have no idea what a reasonable value is.

I don't know how all of this is designed but it seems like there's
only one location for the command timer, and the SCSI driver owns it,
and then everyone else (ATA and USB and for all I know SAN) are on top
of that and lack any ability to have separate timeouts.

The nice thing about the udev rule is that it tests for SCT ERC before
making a change. There certainly are enterprise and almost enterprise
"NAS" SATA drives that have short SCT ERC times enabled out of the box
- and the udev method makes them immune to the change.


-- 
Chris Murphy
