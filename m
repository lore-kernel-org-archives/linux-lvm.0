Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4912026D69
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 16:16:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B8388EDA23
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 16:16:34 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f8so8647664edv.2
	for <linux-lvm@redhat.com>; Sat, 07 Dec 2019 08:16:32 -0800 (PST)
MIME-Version: 1.0
References: <A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3B@EX01.edgeware.tv>
In-Reply-To: <A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3B@EX01.edgeware.tv>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Sat, 7 Dec 2019 19:16:20 +0300
Message-ID: <CADxRZqyWbvoGGVJXdx9Mj+9toTM8tSMP9oUE8F0b+OhYqJ4uUA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 29, 2019 at 12:14 PM Daniel Janzon
<daniel.janzon@edgeware.tv> wrote:
>
> Hello,
>
> I have a server with very high load using four NVMe SSDs and therefore no HW RAID. Instead I used SW RAID with the mdadm tool. Using one RAID5 volume does not work well since the driver can only utilize one CPU core which spikes at 100% and harms performance. Therefore I created 8 partitions on each disk, and 8 RAID5s across the four disks.
>
> Now I want to bring them together with LVM. If I do not use a striped volume I get high performance (in expected magnitude according to disk specs). But when I use a striped volume, performance drops to a magnitude below. The reason I am looking for a striped setup is to ensure that data is spread well over the drive to guarantee a good worst-case performance. With linear allocation rather than striped, if load is directed to files on the first PV (a SW RAID) the system is again exposed to the 1-core limitation.
>
> I tried "--stripes 8 --stripesize 512", and would appreciate any ideas of other things to try. I guess the performance hit can be in the file system as well. I tried XFS and EXT4 with default settings.

Daniel,

a bit more about your system? Like kernel version, io scheduler, etc..
Have you tried with recent kernels MQ (multi-queue) schedulers (noop,
deadline) ?
