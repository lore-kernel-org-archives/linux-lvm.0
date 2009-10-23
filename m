Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NIfJUk007197
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 14:41:19 -0400
Received: from mail-fx0-f217.google.com (mail-fx0-f217.google.com
	[209.85.220.217])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NIf0L9024511
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 14:41:00 -0400
Received: by fxm17 with SMTP id 17so5340922fxm.3
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:41:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091023172914.GA12748@us.ibm.com>
References: <4AE1B9FB.504@mortent.org> <20091023172914.GA12748@us.ibm.com>
Date: Fri, 23 Oct 2009 20:40:59 +0200
Message-ID: <29ae894c0910231140l2a7732d4na691ef87e4b852e8@mail.gmail.com>
Subject: Re: [linux-lvm] Mirrored LVs
From: brem belguebli <brem.belguebli@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2009/10/23  <malahal@us.ibm.com>:
> Morten Torstensen [morten@mortent.org] wrote:
>> Why cannot the mirrorlog be stored persistently in one or more LEs in
>> the LV? Why the need for a seperate PV for this?
>
> For better redundancy...
That is something I do not clearly see.
I am not going to enumarate em all, but mdadm stores the bitmap on
each mirror leg, HP-UX LVM store the MWC on each mirror leg .... what
makes them less redundant?

If we came to loose the LVM2 mirror third log device, what would
happen (you already answered me on this topic that the mirror would
stop).

I saw that there is some work being done to add a fourth log device to
address this SPOF.

I think the current implementation, by trying to be the MOST redundant
one, is getting too complex, or too expensive (each mirror device
requiring 3 or 4 devices even if the 1 or 2 log devices are a few
Megs) that one would, in the best case, use corelog instead, or
partition the drives to mirror with 1 small log partition and the
remaining space for data : both cases got off of the redundancy
targeted.

Worst case one would use mdadm as underlying RAID.
>
>> Since most servers I work with have two disks for the system, this force
>> me to use md for mirroring, adding unneeded complexity for a simple mirror.
>
> Use "--alloc anywhere" to place the log LV on one of them when you
> create your mirror.
>
It still requires/creates a log LV ?

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

Brem
