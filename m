Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r16CPuWj014009
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 07:25:56 -0500
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r16CPrAR012066
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 07:25:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 54574B0E003
	for <linux-lvm@redhat.com>; Wed,  6 Feb 2013 13:25:53 +0100 (CET)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4qQ8dwAOOvl for <linux-lvm@redhat.com>;
	Wed,  6 Feb 2013 13:25:53 +0100 (CET)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id 38C33B0E001
	for <linux-lvm@redhat.com>; Wed,  6 Feb 2013 13:25:53 +0100 (CET)
Date: Wed, 6 Feb 2013 13:25:53 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20130206122553.GA17944@soda.linbit>
References: <CAPhuxPsnfme0a=AeqAQ_CS0WNp9FEhE=5oXyO7A9iZHHpA+MdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhuxPsnfme0a=AeqAQ_CS0WNp9FEhE=5oXyO7A9iZHHpA+MdA@mail.gmail.com>
Subject: Re: [linux-lvm] LVM mirror logic bug?
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

On Wed, Feb 06, 2013 at 01:43:05PM +0200, Robert wrote:
> Hi,
> 
> Today I created a mirror due to some data migrations I am doing, and
> the funny thing is that two mirror legs ended up on the same physical
> volume:
> 
> # lvs -a -o +devices
>   LV                VG     Attr   LSize   Origin Snap%  Move Log Copy%
>  Convert Devices
>   oraarch           sapvg  -wi-ao  20.00G
>          /dev/dm-18(0)
>   oracle            sapvg  -wi-ao   5.00G
>          /dev/dm-18(5120)
>   orapta            sapvg  mwi-ao 299.12G
> 100.00         orapta_mimage_0(0),orapta_mimage_1(0)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-5(11520)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-3(12800)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-3(30002)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-4(0)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-4(9913)
>   [orapta_mimage_0] sapvg  iwi-ao 299.12G
>          /dev/dm-6(0)
>   [orapta_mimage_1] sapvg  iwi-ao 299.12G
>          /dev/dm-6(34249)
>   [orapta_mimage_1] sapvg  iwi-ao 299.12G
>          /dev/dm-16(0)
>   [orapta_mimage_1] sapvg  iwi-ao 299.12G
>          /dev/dm-17(0)
> ...
> ...
> 
> Here you can see /dev/dm-6 contains part of both mirror legs.
> 
> I have to admit I just used the command:
> lvconvert -m1 --corelog sapvg/orapta
> not specifying the target pv's as I thought LVM would calculate it for itself.
> 
> There should be a rule in place to never use the same PV for the
> second leg of a mirror that is used by the first shoudln't there?

I assume you have an --alloc=anywhere setting somewhere.
Try to reproduce with an explicit --alloc=normal.
See also man lvm

	Lars

> I am using a statically compiled version of LVM so I can use it on
> different machines that are older than SLES11SP2 as the older distro
> won't allow me to mirror multi segmented LV's.
> 
> # /tmp/lvm.static version
>   LVM version:     2.02.98(2) (2012-10-15)
>   Library version: 1.02.77 (2012-10-15)
>   Driver version:  4.15.0
> 
> Thanks!
> Robert

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
