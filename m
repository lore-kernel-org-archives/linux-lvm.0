Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAE3uJWu003921
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 22:56:19 -0500
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAE3u7AM012073
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 22:56:07 -0500
Received: by ewy8 with SMTP id 8so298224ewy.33
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 19:56:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101113230310.GH14546@barkeeper1-xen.linbit>
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
	<20101113230310.GH14546@barkeeper1-xen.linbit>
Date: Sat, 13 Nov 2010 22:56:05 -0500
Message-ID: <AANLkTinXXW_QFHa7wEM-rb8rvO-8iXmAzK3yEL1j79uL@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
Reply-To: swestrup@gmail.com,
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 13, 2010 at 6:03 PM, Lars Ellenberg
<lars.ellenberg@linbit.com> wrote:
> On Sat, Nov 13, 2010 at 04:45:36PM -0500, Stirling Westrup wrote:

...
>> All I want to do is move physical extents from one physical volume to
>> another. Both of those volumes are present and accessible. Why should
>> uninvolved missing volumes be an issue, and is there any way around
>> it? �pmmove suggests running "vgreduce --removemissing" but the
>> documentation for vgreduce seems to say that I'd need to 1) use
>> --force and 2) it would likely result in data loss.
>>
>> Is there anything I can do, short of borrowing another storage array
>> somewhere, just so I can have an extra slot to do this move? My other
>> option is to put the new drive into a USB case, but the server only
>> supports USB1, so moving a terrabyte will take over a week.
>>

> If you do it offline anyways:
>
> Shut down.
> Unplug one of the good old drives, plug in the new drive.
> If you want to be extra sure against typos,
> unplug all but the bad-old drive ;-)
>
> Boot into maintenance mode, use a live-cd if you have to.
>
> Don't activate the VG. �It won't activate with one pv missing anyways,
> unless you really want it to.
>
> Then dd_rescue copy the disk image from bad-old to new, including
> everything (partition table, if any, LVM signature, the full image).
>
> Remove bad-old drive, have all other old and the new plugged,
> reboot normally.
>
> Done.
>
> Estimated downtime, assuming a sustained linear write speed of 80 MiB/s:
> 1 TiB / (80 MiB/s), well under 4 hours.
>

Thanks. I did consider this, but the new drive is twice the size of
the old one, so I would need to make sure I had created a partition on
the new drive the exact size of the old one, and had dd-ed everything
correctly. Even then, I wasn't sure if it would work, because I don't
know what the metadata records in terms of the drive configurations.

-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
