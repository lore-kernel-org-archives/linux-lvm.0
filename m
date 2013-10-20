Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9KILZql014262
	for <linux-lvm@redhat.com>; Sun, 20 Oct 2013 14:21:35 -0400
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9KILYug001189
	for <linux-lvm@redhat.com>; Sun, 20 Oct 2013 14:21:34 -0400
Received: by mail-ob0-f175.google.com with SMTP id uz6so4973012obc.34
	for <linux-lvm@redhat.com>; Sun, 20 Oct 2013 11:21:34 -0700 (PDT)
Message-ID: <52641F24.6000406@inktank.com>
Date: Sun, 20 Oct 2013 11:21:24 -0700
From: Josh Durgin <josh.durgin@inktank.com>
MIME-Version: 1.0
References: <CAE63xUO1jhgxQoRbJU-8+j-cxRB7QEspu=JWvekp9ExzFmnjSA@mail.gmail.com>	<alpine.DEB.2.00.1310160914360.22271@cobra.newdream.net>	<20131017151828.GB28859@redhat.com>	<CAE63xUPtovZwGq=4Xseq3DJ+uAyGJJmYbO70ry=WJqqGcBamRA@mail.gmail.com>	<alpine.DEB.2.00.1310181657151.19763@cobra.newdream.net>
	<CAE63xUO4ZrzObMFeQ=FXGFnqpwWsjCiiDr2_VhOt91h=djofYw@mail.gmail.com>
In-Reply-To: <CAE63xUO4ZrzObMFeQ=FXGFnqpwWsjCiiDr2_VhOt91h=djofYw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [ceph-users] poor read performance on rbd+LVM,
	LVM overload
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
To: Ugis <ugis22@gmail.com>, Sage Weil <sage@inktank.com>
Cc: "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "ceph-users@ceph.com" <ceph-users@ceph.com>, Mike Snitzer <snitzer@redhat.com>, linux-lvm@redhat.com

On 10/20/2013 08:18 AM, Ugis wrote:
>>> output follows:
>>> #pvs -o pe_start /dev/rbd1p1
>>>    1st PE
>>>      4.00m
>>> # cat /sys/block/rbd1/queue/minimum_io_size
>>> 4194304
>>> # cat /sys/block/rbd1/queue/optimal_io_size
>>> 4194304
>>
>> Well, the parameters are being set at least.  Mike, is it possible that
>> having minimum_io_size set to 4m is causing some read amplification
>> in LVM, translating a small read into a complete fetch of the PE (or
>> somethinga long those lines)?
>>
>> Ugis, if your cluster is on the small side, it might be interesting to see
>> what requests the client is generated in the LVM and non-LVM case by
>> setting 'debug ms = 1' on the osds (e.g., ceph tell osd.* injectargs
>> '--debug-ms 1') and then looking at the osd_op messages that appear in
>> /var/log/ceph/ceph-osd*.log.  It may be obvious that the IO pattern is
>> different.
>>
> Sage, here follows debug output. I am no pro in reading this, but
> seems read block size differ(or what is that number following ~ sign)?

Yes, that's the I/O length. LVM is sending requests for 4k at a time,
while plain kernel rbd is sending 128k.

<request logs showing this>

> How to proceed with tuning read performance on LVM? Is there some
> chanage needed in code of ceph/LVM or my config needs to be tuned?
> If what is shown in logs means 4k read block in LVM case - then it
> seems I need to tell LVM(or xfs on top of LVM dictates read block
> side?) that io block should be rather 4m?

It's a client side issue of sending much smaller requests than it needs
to. Check the queue minimum and optimal sizes for the lvm device - it
sounds like they might be getting set to 4k for some reason.

Josh
