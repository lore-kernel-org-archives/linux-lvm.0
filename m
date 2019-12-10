Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7471F1049477
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 21:29:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 407A78F6464
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 21:29:23 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24048.3630.705344.759092@quad.stoffel.home>
Date: Tue, 10 Dec 2019 16:29:18 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <0154b0c2-be41-cf37-0973-2ade719321cd@assyoma.it>
References: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
	<0154b0c2-be41-cf37-0973-2ade719321cd@assyoma.it>
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
Cc: Daniel Janzon <daniel.janzon@edgeware.tv>

>>>>> "Gionatan" == Gionatan Danti <g.danti@assyoma.it> writes:

Gionatan> On 09/12/19 11:26, Daniel Janzon wrote:
>> Exactly. The md driver executes on a single core, but with a bunch of RAID5s
>> I can distribute the load over many cores. That's also why I cannot join the
>> bunch of RAID5's with a RAID0 (as someone suggested) because then again
>> all data is pulled through a single core.

Gionatan> MD RAID0 is extremely fast, using a single core at the
Gionatan> striping level should pose no problem. Did you actually
Gionatan> tried this setup?

Gionatan> Anyway, the suggestion from Guoqing Jiang sound promising. Let me quote him:

>> Perhaps set "/sys/block/mdx/md/group_thread_cnt" could help here,
>> see below commits:
>> 
>> commit b721420e8719131896b009b11edbbd27d9b85e98
>> Author: Shaohua Li <shli@kernel.org>
>> Date:   Tue Aug 27 17:50:42 2013 +0800
>> 
>> raid5: sysfs entry to control worker thread number
>> 
>> commit 851c30c9badfc6b294c98e887624bff53644ad21
>> Author: Shaohua Li <shli@kernel.org>
>> Date:   Wed Aug 28 14:30:16 2013 +0800
>> 
>> raid5: offload stripe handle to workqueue

I think this requires a much newer kernel, but since he's running on
RHEL7 using kernel 3.10.x with RH patches and such, that feature
doesn't exist.  I just checked on my one my RHEL7.6 systems and I
don't see that option.  And I just setup a RAID5 four device RAID and
it doesn't have that option.

So I think maybe you need to try:

  mdadm -C -l 0 -c 64 md_stripe /dev/md_raid5[1-8]

But thinking some more, maybe you want to pin the RAID5 threads for
each of your RAID5s to a seperate CPU using cpusets?  Maybe that will
help performance?

But wait, why using use an MD stripe on top of the RAID5 setup?  Or
are you?

Can you please provide the setup of the system?

cat /proc/mdstat
vgs -av
pvs -av
lvs -av

Just so we can look at what you're doing?

Also, what's the queue depth of your devices?  Maybe with NVMe you can
bump it up higher?  Or maybe it wants to be lower... something else to
check.

John
