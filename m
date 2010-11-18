Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAIIUN2D019914
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 13:30:23 -0500
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAIIUCj6021434
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 13:30:12 -0500
Received: by ewy8 with SMTP id 8so2242552ewy.33
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 10:30:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101116062508.GA17499@maude.comedia.it>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
Date: Thu, 18 Nov 2010 13:30:11 -0500
Message-ID: <AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Just wanted to thank everyone for their help and advice. With a
combination of cooling the drive with ice, and moving groups of 1000
extents at a time, I was able to completely recover all of my data
from the drive. As far as I can tell there was no data loss.

I do think the fact that pvmove does no user-visible checkpointing is
a bug. In fact, from the few tests that I ran in preparation for the
final successful recovery effort, it appears that pvmove does not do
any actual checkpointing whatsoever. Certainly none that my tests
could uncover.

In any event, I am extremely happy for a successful recovery, and
wanted to share that with the forum.

-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
