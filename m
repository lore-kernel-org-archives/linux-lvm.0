Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CCC42166BA0
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 18:54:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD4BE18AE949
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 18:54:08 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24409.9033.527504.36789@quad.stoffel.home>
Date: Wed, 9 Sep 2020 14:47:37 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
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
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?iso-8859-1?Q?H=E5kon?= <hawken@thehawken.org>

>>>>> "Gionatan" == Gionatan Danti <g.danti@assyoma.it> writes:

Gionatan> Il 2020-09-09 17:01 Roy Sigurd Karlsbakk ha scritto:
>> First, filelevel is usually useless. Say you have 50 VMs with Windows
>> server something. A lot of them are bound to have a ton of equal
>> storage in the same areas, but the file size and content will vary
>> over time. With blocklevel tiering, that could work better.

Gionatan> It really depends on the use case. I applied it to a
Gionatan> fileserver, so working at file level was the right
Gionatan> choice. For VMs (or big files) it is useless, I agree.

This assumes you're tiering whole files, not at the per-block level
though, right? 

>> This is all known.

Gionatan> But the only reason to want tiering vs cache is the
Gionatan> additional space the former provides. If this additional
Gionatan> space is so small (compared to the combined, total volume
Gionatan> space), tiering's advantage shrinks to (almost) nothing.

Do you have numbers?  I'm using DM_CACHE on my home NAS server box,
and it *does* seem to help, but only in certain cases.   I've got a
750gb home directory LV with an 80gb lv_cache writethrough cache
setup.  So it's not great on write heavy loads, but it's good in read
heavy ones, such as kernel compiles where it does make a difference.

So it's not only the caching being per-file or per-block, but how the
actual cache is done?  writeback is faster, but less reliable if you
crash.  Writethrough is slower, but much more reliable.  
