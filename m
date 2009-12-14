Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBEGM39U015592
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 11:22:03 -0500
Received: from er-systems.de (er-systems.de [85.25.136.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBEGLloc007293
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 11:21:47 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	by er-systems.de (Postfix) with ESMTP id 533FB17405E
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 17:21:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by er-systems.de (Postfix) with ESMTP id 33473174059
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 17:21:32 +0100 (CET)
Date: Mon, 14 Dec 2009 17:21:31 +0100 (CET)
From: Thomas Voegtle <tv@lio96.de>
Sender: thomas@er-systems.de
Subject: Re: [linux-lvm] lvcreate does not respect units?
In-Reply-To: <20091214144519.GC14009@agk-dp.fab.redhat.com>
Message-ID: <alpine.LNX.2.00.0912141719030.31679@er-systems.de>
References: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
	<20091214140057.GA14009@agk-dp.fab.redhat.com>
	<alpine.LNX.2.00.0912141527510.25221@er-systems.de>
	<20091214144519.GC14009@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 14 Dec 2009, Alasdair G Kergon wrote:

> On Mon, Dec 14, 2009 at 03:28:24PM +0100, Thomas Voegtle wrote:
>> Why is it possible to use vgdisplay with units power of 1000, if you
>> cant use lvcreate with that kind of units?
>> The lvcreate man page says:
>>      -L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]
>
> For input, it ignores case.
>
> I've not felt particularly happy about changing that as it could change the
> behaviour of existing scripts, and typically, people pay little attention
> to the case of units when they are typing.

Ah, ok, I agree.


> But should we change this in time for RHEL6?
>
> Any more opinions?


Why don't you just do something like si_unit_consistency again, but this 
time for input? Or something similiar?
