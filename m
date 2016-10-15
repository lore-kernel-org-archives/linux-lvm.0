Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9F7MLnL010697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2016 03:22:21 -0400
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD5EF821C7
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2016 07:22:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id z190so10055251qkc.3
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2016 00:22:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2d717384-f02b-d260-3d06-167b2416dc0c@redhat.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
	<CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
	<CAE-HYsPmC-Qm+bXU-p0L1iF3zEVZ-GZfchrbBSOXFss4BPX=aw@mail.gmail.com>
	<2d717384-f02b-d260-3d06-167b2416dc0c@redhat.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Sat, 15 Oct 2016 08:21:59 +0100
Message-ID: <CAE-HYsPdfqYXB_vaw-6=bKJhaCFEhEm7Povcb=Xp2OsAAg5MSQ@mail.gmail.com>
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

On 15 October 2016 at 00:19, Heinz Mauelshagen <heinzm@redhat.com> wrote:
> On 10/12/2016 09:15 AM, Giuliano Procida wrote:
>>
>> On 12 October 2016 at 07:57, Giuliano Procida
>> [lies]
>
> Well, the result of le32_to_cpu is assigned to a 32 bit int on 64 bit arch.
>
> The 4294967295 reported by parse_rmeta will thus result in signed int role =
> -1
> which is used for comparision.
>
> The tool should rather report the array_position signed to avoid iritation.

Oops, yes. sizeof(int) == 4 in the kernel, even on a 64-bit architecture.
I'd forgotten this. It seemed surprising that compiler would likely warn
but the warning would have been ignored.

>> I still don't know what wrote that value to the superblock though.
>
> Must have been the position gotten set to -1 indicating failure to hot add
> the image LV back in and thus MD has written it to that superblock.

I didn't find the code that did this when I last looked.

> Did you spot any "Faulty.*device #.*has readable super block.\n Attempting
> to revive it."
> messages from dm-raid in the kernel log by chance?

That's a question for Slava.
