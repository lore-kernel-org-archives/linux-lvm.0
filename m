Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9C7FcOC016770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2016 03:15:38 -0400
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D13043B707
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2016 07:15:36 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id f128so2375633qkb.0
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2016 00:15:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
	<CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Wed, 12 Oct 2016 08:15:15 +0100
Message-ID: <CAE-HYsPmC-Qm+bXU-p0L1iF3zEVZ-GZfchrbBSOXFss4BPX=aw@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12 October 2016 at 07:57, Giuliano Procida
<giuliano.procida@gmail.com> wrote:
>>  array_position=4294967295
>
> This should be 1 instead. This is 32-bit unsigned 0xf...f. It may be
> that it has special significance in kernel or LVM code. I've not
> checked beyond noticing one test: role < 0.

http://lxr.free-electrons.com/source/drivers/md/dm-raid.c

Now role is an int and the RHS of the assignment is le32_to_cpu(...)
which returns a u32. Testing < 0 will *never* succeed on a 64-bit
architecture. This is a kernel bug. If the code is changed so that
role is also u32 and the test is against ~0, it's possible that
different, better things will happen. Please try reporting this to the
dm-devel people.

I still don't know what wrote that value to the superblock though.
