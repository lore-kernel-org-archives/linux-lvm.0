Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7NGJrBW029594
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 12:19:53 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7NGJpZC025814
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 12:19:52 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7NGJkiC029095
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 12:19:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7NGJkM2024635
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 12:19:46 -0400
Date: Thu, 23 Aug 2007 12:19:46 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Guest os running with lvm under xen (lvm-backed vbd)
In-Reply-To: <BAY115-W274EC6B50C58F0EADF27EB85D60@phx.gbl>
Message-ID: <Pine.LNX.4.44.0708231211420.24507-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 23 Aug 2007, Achievement wrote:

> 4. the guest domain also use lvm, vg 'Xen1Vbd1VG00' created within the guest
> domain.
> 
> Then, i have several guest domain with same data.
...
> I got the following error:
> 
> [root@xen2 ~]# pvs
> 
>   Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
>   Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
> Segmentation fault
...
> Any one face the similar error? and why lvm see the logical volume as a
> physical volumes?  or I should not use lvm in guest domain if i use
> lvm-backed vbd for xen?

It sees the lv as a pv because you made it a pv with the guest domain.
The device scanning logic *should* skip logical volumes, and perhaps you
can add a pattern to /etc/lvm/lvm.conf to make it do so.

I would not recommend running lvm in both host and guest, if only because
of the redundancy.  Either map LVs to partitions on guest, or give the
guest a PV and run LVM there.  I prefer mapping LVs to partitions on guest,
because then the guest has simpler initrd and doesn't load lvm stuff.
Plus, you don't have to keep track of multiple VGs (one for each guest).
The only drawback is that it doesn't seem to be possible to resize
the LV and have the guest see it without rebooting the guest.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
