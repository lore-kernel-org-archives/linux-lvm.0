Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r52LMnvR014966
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 17:22:49 -0400
Received: from mail-bk0-f53.google.com (mail-bk0-f53.google.com
	[209.85.214.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r52LMmpg028546
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 17:22:49 -0400
Received: by mail-bk0-f53.google.com with SMTP id mx10so1539839bkb.40
	for <linux-lvm@redhat.com>; Sun, 02 Jun 2013 14:22:48 -0700 (PDT)
Message-ID: <51ABB7A6.80508@gmail.com>
Date: Sun, 02 Jun 2013 23:22:46 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20130602033724.GA17194@gmail.com>
	<20130602035010.GB17194@gmail.com>
	<20130602073945.GA30753@gmail.com>
In-Reply-To: <20130602073945.GA30753@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] segfault with pvcreate command
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kumar amit mehta <gmate.amit@gmail.com>

Dne 2.6.2013 09:39, Kumar amit mehta napsal(a):
> On Sat, Jun 01, 2013 at 11:50:10PM -0400, Kumar amit mehta wrote:
>> However, I'd appreciate a lot if you can look into my concern, mentioned
>> in "Q3" in my previous mail and guide me to build the debug package of
>> lvm2.
>
> Figured, how to build the binaries(pvcreate,etc) with debugging symbols.
> # ./configure CFLAGS=-g
>
>

Check configure --help

You will find there a lot of options you might want to enable - i.e. udev
support, debug support...

Zdenek
