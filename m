Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2H9kksr022125
	for <linux-lvm@redhat.com>; Sat, 17 Mar 2012 05:46:46 -0400
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2H9ki0t006246
	for <linux-lvm@redhat.com>; Sat, 17 Mar 2012 05:46:45 -0400
Received: by wibhm17 with SMTP id hm17so1670556wib.9
	for <linux-lvm@redhat.com>; Sat, 17 Mar 2012 02:46:44 -0700 (PDT)
Message-ID: <4F645D81.3010002@redhat.com>
Date: Sat, 17 Mar 2012 10:46:41 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
In-Reply-To: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm fails when /proc/devices contains "-1 smblk"
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
Cc: John Mesmon <jmesmon@gmail.com>

Dne 16.3.2012 07:28, John Mesmon napsal(a):
> It filters out all the possible devices, resulting in almost all
> operations failing (maybe all, I haven't checked that far).
> 
> Introduced by c929a0b3c8c1cd4a32458b5db0aa3d221a949aad
> 
> My opinion is that there is no need for the check that commit adds, It
> can only break things (when the range of valid block devices changes).

I thin you should made your opinion after checking the code around this check
- since then you would notice, that parsed number is used as an index to
static array and using '-1' obviously makes an access outside of the memory
allocated for this mapping array.

The fact it's used to work before this commit means, that overwritten memory
in front of this array was not that much important for lvm executable.

> For reference, the relavent portion of my /proc/devices:
> 
> Character devices:
>   1 mem
>   4 /dev/vc/0
>   4 tty
> ...
> 251 macvtap
> 252 kcopy
> 253 bsg
> 254 rtc
> 
> Block devices:
>  -1 smblk
>   1 ramdisk
> 256 rfd
> 257 ssfdc
> 259 blkext
>   7 loop

While saying that - we may add support for several majors with negative
numbers, but it somehow doesn't make sense to me yet.
(Since the filter's mapping table supports majors in range  [0..4096> )

If I check kernel headers or glibc headers, then  major & minor numbers
are always handled as unsigned numbers.

So how is that, that your /proc/devices shows it as '-1' ??
What are major/minor numbers of devices that belong to 'smblk' ??

How did you came to such block device ??
Is that actually anything from upstream kernel ??

Zdenek
