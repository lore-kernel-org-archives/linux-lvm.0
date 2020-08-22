Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3B82166B27
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 12:39:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C40D48EB550
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 12:39:01 +0000 (UTC)
Received: from wiki.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 07MBjOoP011621
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 07:45:28 -0400
Date: Sat, 22 Aug 2020 07:45:24 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
In-Reply-To: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
Message-ID: <alpine.LRH.2.23.451.2008220740230.11549@mail.gathman.org>
References: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] What to do about new lvm messages
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 22 Aug 2020, L A Walsh wrote:

> I am trying to create a new pv/vg/+lvs setup but am getting some weird messages
>
> pvcreate  -M2 --pvmetadatacopies 2 /dev/sda1
>  Failed to clear hint file.
>  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
> the VG to update.
>  Physical volume "/dev/sda1" successfully created.
>
> So why am I getting a message about not clearing a hint file (running s root)

Because there is an ole PV header on sdd1

>> From an online man page, I should have been able to use -ff to
> recreate a pv over
> the top of a preexisting one, but that didn't seem to work.  I got:
> pvcreate -ff -M2 --pvmetadatacopies 2 /dev/sda1
>  Failed to clear hint file.
>  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify

You wrote a new PV header on sda1 - but that didn't do diddly squat 
about the old one on sdd1.

> the VG to update.
>  Cannot access VG Space with system ID Ishtar with unknown local system ID.
>  Device /dev/sda1 excluded by a filter.

The PV filter is excluding sda1.  Are you confused about what is on 
which sdx?

> dd if=/dev/zero of=/dev/sda1 bs=4096 count=1
> 1+0 records in
> 1+0 records out
> 4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000175409 s, 23.4 MB/s

I hope sda1 was really what you think it was.

What is on sdd1?  None of your listings examine it.
