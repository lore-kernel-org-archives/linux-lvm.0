Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C102166B28
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 21:36:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8DA2800299
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 21:35:59 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id h35so5595747uae.5
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 14:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
In-Reply-To: <20200323082608.7i6wzq2t3k24hzun@reti>
From: Scott Mcdermott <scott@smemsh.net>
Date: Mon, 23 Mar 2020 14:35:45 -0700
Message-ID: <CACRKOwyuDawzP3f9XL1N2PreixCmS8-80UqEOEdKoCS4=x2UpQ@mail.gmail.com>
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

On Mon, Mar 23, 2020 at 1:26 AM Joe Thornber <thornber@redhat.com> wrote:
> On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
> > [system crashed, uses all memory when brought online...]
> > parameters were set with: lvconvert --type cache
> > --cachemode writeback --cachepolicy smq
> > --cachesettings migration_threshold=10000000
>
> If you crash then the cache assumes all blocks are dirty and performs
> a full writeback.  You have set the migration_threshold extremely high
> so I think this writeback process is just submitting far too much io at once.
>
> Bring it down to around 2048 and try again.

the device wasn't visible in "dmsetup table" prior to activation, so I tried:

  lvchange -ay raidbak4/bakvol4; dmsetup message raidbak4-bakvol4 0
migration_threshold 204800

but this continued to crash, apparently the value used at activation
time is enough to crash the system.  instead using:

  lvchange --cachesettings migration_threshold=204800 raidbak4/bakvol4
  lvchange -ay raidbak4/bakvol4

it worked, and the used disk bandwidth was much lower (which, I don't
want it to be, but a functioning system is needed for the thing to
work at all).  after some time doing a lot of I/Os, it went silent and
is presumably flushed, seems to be in working order, thanks.

so I have to experiment to find the highest migration_threshold value
that won't crash my system with OOM? I don't want there to be any
cache bandwidth restriction, it should saturate and use all available
to aggressively promote (for my frequent case, working set actually
would fit entirely in cache, but it's ok if the cache learns this
slowly from usage).

seems like I should be able to use a value that means "use all
available bandwidth" that isn't going to take down my system with OOM.
even if I play with the value, I might find during some pathological
circumstance, it pushes beyond where I tested and now it crashes my
system again.  is there some safe calculation I can use to determine
the maximum amount?
