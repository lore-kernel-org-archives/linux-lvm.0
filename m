Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0SA3bsJ014472
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 05:03:37 -0500
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0SA3a9Q016996
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 05:03:36 -0500
Received: by mail-qa0-f44.google.com with SMTP id bv4so824108qab.10
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 02:03:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOS+5GGR1yPe5_dWJ8H8fjXXvVMKVX=xfWg4LhxYHv_ECMLaJg@mail.gmail.com>
References: <CAOS+5GGR1yPe5_dWJ8H8fjXXvVMKVX=xfWg4LhxYHv_ECMLaJg@mail.gmail.com>
From: Gabriel <jarod125@gmail.com>
Date: Mon, 28 Jan 2013 12:03:16 +0200
Message-ID: <CAJc7SsZ_Yb2T8+aCFdHBABTE6KR19E5vVVkpP7Taq+wMemZwpQ@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jan 27, 2013 at 8:51 AM, Another Sillyname
<anothersname@googlemail.com> wrote:
> I had a 487G LVM that contained a single partition and a swap partition.
>
> On the data partition I had 86G free that I needed to use elsewhere.
>
> All the following have been done from a recovery disk so the data is all
> still intact.
>
> When I tried to resize to 400G it wouldn't  let me stating below mjnimum
> size...
>
> sudo resize2fs -p /dev/pathto/lvmdevice 400G
>
> However mounting it df -h reports
>
>                                                  Size      Used     Free
> /dev/pathto/lvmdevice        487G   377G     86G
>
> or in 4k blocks
>
> /dev/pathto/lvmdevice         127571672     98643758    22449438
>
> So I was forced to run the resize2fs in tye default 4k mode
>
> sudo resize2fs -p /dev/pathto/lvmdevice 105000000
>
> This should give me a sufficient overhead and finished correctly
>
> I then did
>
> sudo lvresize -L /dev/pathto/lvmdevice
>
> This also appeared to be successful.
>
> However I can't mount it as it's reporting wrong fs type, bad option etc
> error.
>
> I think I've identified the problem as a mismatch on ghe block count.
>
> Even though I resized to 105000000 blocks I now see that df -h reported the
> size as 103352144 before I did the  lvresize (I didn't notice at the time)
>
> So I think the discrepancy between the  block count size reported by df at
> 103352144 and tune2fs at 105000000 is the error.
>
> How can I change the block count number reported by tune2fs from 105000000
> to 103352144 that will then allow me to run e2fsck again?
>
> Thanks

You should use dumpe2fs -h /dev/pathto/lvmdevice | grep -i block and
look for block count and block size. Multiply those two values to
obtain the "grand total" (in bytes) that your filesystem is using. The
lv must be higher than that.
