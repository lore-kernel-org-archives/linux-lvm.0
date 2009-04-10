Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3AAKNZR007218
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:20:23 -0400
Received: from e7.ny.us.ibm.com (e7.ny.us.ibm.com [32.97.182.137])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3AAK1Al005969
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:20:01 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e7.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n3AAA66g021635
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:10:06 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n3AAK0r5158320
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:20:00 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n3AAILcb005327
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:18:21 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n3AAILKj005318
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:18:21 -0400
Date: Fri, 10 Apr 2009 03:19:59 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"?
Message-ID: <20090410101959.GA21846@us.ibm.com>
References: <49DCA275.8070203@Calva.COM> <49DF02A7.50606@Calva.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49DF02A7.50606@Calva.COM>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

John Hughes [john@Calva.COM] wrote:
> John Hughes wrote:
>>                if (lp->stripes > 1) {
>>                        log_error("mirrors and stripes are currently "
>>                                  "incompatible");
>>                        return 0;
>>                }
>>
>> Should I just stick with mdadm for my mirroring and striping needs?

You can do it today with some hassle or wait until someone implements a
feature called 'generic layering'. The feature really means, treat some
LVs as PVs!

How can you do raid10 today? Create two raid0 LVs. Lets us call these
lvgroup0/lv0 and lvgroup0/lv1. Now create raid1 lv in lvgroup1 where
lvgroup1's PVs are lvgroup0/lv0 and lvgroup0/lv1.

Isn't that a rai10 volume?

Thanks, Malahal.
