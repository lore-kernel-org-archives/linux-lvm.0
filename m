Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8TK3vr01617
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 16:03:57 -0400
Received: from dermis.amis.com (dermis.amis.com [207.141.5.253])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i8TK3pRP017719
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 16:03:51 -0400
Received: from [172.16.17.173] (bighorn.design.amis.com [172.16.17.173])
	by mxrelayus.pc.amis.com (Postfix) with ESMTP id C678A5869A
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 14:03:44 -0600 (MDT)
Message-ID: <415B14E7.1010401@theserrs.net>
Date: Wed, 29 Sep 2004 14:02:47 -0600
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove unable to move extents to multiple smaller pvs
References: <415A53B4.60001@theserrs.net>
In-Reply-To: <415A53B4.60001@theserrs.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Some more information that may be of use:
kernel 2.4.26 (vanilla) on gentoo on a P4 HT and SMP is enabled
lvm 2.00.08

It seems that everytime I do a "pvmove" it would be hard to always go to 
a contiguous pv the same size or bigger.  This is why I wonder if I'm 
doing something wrong.

Thanks again [to anyone out there],
Scott Serr

Scott Serr wrote:

> I'm trying to use pvmove to shuffle things around.  I have a pv with 
> 22375 extents which I would like to remove from the system.  I've 
> added two (2) pvs with 11194 extents each.  I get an error message:
>
> Insufficient contiguous allocatable extents (11194) for logical volume 
> pvmove0: 22375 required
> Allocation for temporary pvmove LV
>
> Now before you say, don't make it contiguous... It seems that it isn't 
> already.
>
> # lvchange --contiguous n /dev/data_vg/data_lv
> Allocation policy of logical volume "data_lv" is already not contiguous
>
> Is this normal?  Do I really need all that contiguous space on 1 pv?
>
> Thanks in advance,
> Scott Serr
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
