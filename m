Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0SB0wBu031104
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 06:00:58 -0500
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0SB0uRT000614
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 06:00:57 -0500
Received: by mail-bk0-f43.google.com with SMTP id jm19so746511bkc.16
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 03:00:56 -0800 (PST)
Message-ID: <51065909.3030704@gmail.com>
Date: Mon, 28 Jan 2013 11:55:05 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAOS+5GGR1yPe5_dWJ8H8fjXXvVMKVX=xfWg4LhxYHv_ECMLaJg@mail.gmail.com>
In-Reply-To: <CAOS+5GGR1yPe5_dWJ8H8fjXXvVMKVX=xfWg4LhxYHv_ECMLaJg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM resize broken file system....
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
Cc: Another Sillyname <anothersname@googlemail.com>

Dne 27.1.2013 07:51, Another Sillyname napsal(a):
> I had a 487G LVM that contained a single partition and a swap partition.
>
> On the data partition I had 86G free that I needed to use elsewhere.
>
> All the following have been done from a recovery disk so the data is all still
> intact.
>
> When I tried to resize to 400G it wouldn't  let me stating below mjnimum size...
>
> sudo resize2fs -p /dev/pathto/lvmdevice 400G
>
> However mounting it df -h reports
>

Unsure from where did you get  that  'df -h' reports something sensible about 
total number of blocks in the filesystem ?

IMHO there is nothing in common - it reports just 'usable' space - but
there is no info about filesystem metadata space being used.
(And in fact it's somewhat 'made-up' number)

So using  'df' for anything related to filesystem resize is not going to work.



> Even though I resized to 105000000 blocks I now see that df -h reported the
> size as 103352144 before I did the  lvresize (I didn't notice at the time)
>
> So I think the discrepancy between the  block count size reported by df at
> 103352144 and tune2fs at 105000000 is the error.
>
> How can I change the block count number reported by tune2fs from 105000000 to
> 103352144 that will then allow me to run e2fsck again?
>

I'd strongly advice to use: 'lvresize -r' which should try to do its best to 
fit the filesystem properly in the give size.


Zdenek
