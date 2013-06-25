Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5PNX18P025607
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 19:33:01 -0400
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5PNWvxg026398
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 19:32:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id C51FA1B435B
	for <linux-lvm@redhat.com>; Wed, 26 Jun 2013 01:32:55 +0200 (CEST)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3XqfqQqAnPK for <linux-lvm@redhat.com>;
	Wed, 26 Jun 2013 01:32:55 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id AB6F21B40F4
	for <linux-lvm@redhat.com>; Wed, 26 Jun 2013 01:32:55 +0200 (CEST)
Date: Wed, 26 Jun 2013 01:32:55 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20130625233255.GE25155@soda.linbit>
References: <"H00000670003132b.1372196759.sx.f1-outsourcing.eu*"@MHS>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <"H00000670003132b.1372196759.sx.f1-outsourcing.eu*"@MHS>
Subject: Re: [linux-lvm] pvresize missing 500GB or more
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Tue, Jun 25, 2013 at 11:45:59PM +0200, Marc Roos wrote:
> 
> We have a reshaped a raid5 array from 11TB to 14TB, on top of this we 
> have a drbd device that resized to  14994.5 GB, 14994541563904 bytes, 
> but after the pvresize I have 
> 
> 
> pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/drbd21
>   VG Name               VGstorage21
>   PV Size               13.64 TB / not usable 948.00 KB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              3574977
>   Free PE               717377
>   Allocated PE          2857600
> 
> 
> Is it normal to have this much loss?
> 
> Thanks in advance,
> Marc

Don't confuse SI units with "binary" units.

pvdisplay TB are actually TiB.

1000 != 1024
1000 * 1000 * 1000 * 1000 != 1024 * 1024 * 1024 * 1024

x**y --> x to the power of y

10**12 / 2**40  = 0.91
2**40 / 10**12  = 1.1

14994541563904 / 2 ** 40
13.64

So yes, in the "terra" range,
it is normal to have about 10 percent "loss"
due to "unit confusion".

more recent LVM tools try to make that clear by using
TB, GB vs TiB, GiB and so on.

you can specify --units in lower case letters for "base 1024",
upper case for "base 1000" units.

pvdisplay --units t
pvdisplay --units T

pvdisplay --units g
pvdisplay --units G

(same goes for all lvm tools)

	Lars

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
