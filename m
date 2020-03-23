Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D81C92026D68
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 16:26:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23337101A55A
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 16:26:52 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 6D29C1E846
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 12:26:48 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <24184.58183.680172.804079@quad.stoffel.home>
Date: Mon, 23 Mar 2020 12:26:47 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] when bringing dm-cache online,
	consumes all memory and reboots
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

>>>>> "Zdenek" == Zdenek Kabelac <zkabelac@redhat.com> writes:

Zdenek> Dne 23. 03. 20 v 9:26 Joe Thornber napsal(a):
>> On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
>>> have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
>>> data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
>>> these disks are hosted by a small 4GB big.little ARM system
>>> running4.4.192-rk3399 (armbian 5.98 bionic).  parameters were set
>>> with: lvconvert --type cache --cachemode writeback --cachepolicy smq
>>> --cachesettings migration_threshold=10000000
>> 
>> If you crash then the cache assumes all blocks are dirty and performs
>> a full writeback.  You have set the migration_threshold extremely high
>> so I think this writeback process is just submitting far too much io at once.
>> 
>> Bring it down to around 2048 and try again.
>> 

Zdenek> Hi

Zdenek> Users should be 'performing' some benchmarking about the 'useful' sizes of
Zdenek> hotspot areas - using nearly 1T of cache for 1.8T of origin doesn't look
Zdenek> the right ration for caching.
Zdenek> (i.e. like if your CPU cache would be halve of your DRAM)

Zdenek> Too big 'cache size' leads usually into way too big caching
Zdenek> chunks (since we try to limit number of 'chunks' in cache to 1
Zdenek> milion - you can rise up this limit - but it will consume a
Zdenek> lot of your RAM space as well) So IMHO I'd recommend to use at
Zdenek> most 512K chunks - which gives you about 256GiB of cache size
Zdenek> - but still users should be benchmarking what is the best for
Zdenek> them...)

I think dm-cache should be smarter as well, and not let the users
bring the system to it's knees with outrageous numbers.  When a user
puts a migration_threshold that high, there needs to be a safety check
that the system isn't them using too much memory, and should listen to
memory pressure instead.

Also, can you change the migration_threshold without activating?  Or
when activated?

John
