Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F8C910BBCC0
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 10:40:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DF4D1011A08
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 10:40:27 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f8so12267945edv.2
	for <linux-lvm@redhat.com>; Mon, 09 Dec 2019 02:40:24 -0800 (PST)
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
	<alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
	<24044.11058.338208.602498@quad.stoffel.home>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <6399a003-cec7-dcc0-656d-0a4c577ce4bf@cloud.ionos.com>
Date: Mon, 9 Dec 2019 11:40:22 +0100
MIME-Version: 1.0
In-Reply-To: <24044.11058.338208.602498@quad.stoffel.home>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>



On 12/7/19 11:44 PM, John Stoffel wrote:
>>>>>> "Stuart" == Stuart D Gathman<stuart@gathman.org>  writes:
> Stuart> On Tue, Oct 29, 2019 at 12:14 PM Daniel Janzon<daniel.janzon@edgeware.tv>  wrote:
>>> I have a server with very high load using four NVMe SSDs and
>>> therefore no HW RAID. Instead I used SW RAID with the mdadm tool.
>>> Using one RAID5 volume does not work well since the driver can only
>>> utilize one CPU core which spikes at 100% and harms performance.
>>> Therefore I created 8 partitions on each disk, and 8 RAID5s across
>>> the four disks.
>>> Now I want to bring them together with LVM. If I do not use a striped
>>> volume I get high performance (in expected magnitude according to disk
>>> specs). But when I use a striped volume, performance drops to a
>>> magnitude below. The reason I am looking for a striped setup is to
> Stuart> The mdadm layer already does the striping.  So doing it again
> Stuart> in the LVM layer completely screws it up.  You want plain JBOD
> Stuart> (Just a Bunch Of Disks).
>
> Umm... not really.  The problem here is more the MD layer not being
> able to run RAID5 across multiple cores at the same time, which is why
> he split things the way he did.
>
> But we don't know the Kernel version, the LVM version, or the OS
> release so as to give better ideas of what to do.
>
> The biggest harm to performance here is really the RAID5, and if you
> can instead move to RAID 10 (mirror then stripe across mirrors) then
> you should be a performance boost.
>
> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
> single thread for RAID5 is a big bottleneck.

Perhaps set "/sys/block/mdx/md/group_thread_cnt" could help here,
see below commits:

commit b721420e8719131896b009b11edbbd27d9b85e98
Author: Shaohua Li <shli@kernel.org>
Date:   Tue Aug 27 17:50:42 2013 +0800

     raid5: sysfs entry to control worker thread number

commit 851c30c9badfc6b294c98e887624bff53644ad21
Author: Shaohua Li <shli@kernel.org>
Date:   Wed Aug 28 14:30:16 2013 +0800

     raid5: offload stripe handle to workqueue

Thanks,
Guoqing
