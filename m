Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KExYPD016479
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:59:34 -0400
Received: from mx2.studentuniverse.com (mx2.studentuniverse.com
	[146.115.12.43])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KExYTb026082
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:59:34 -0400
Received: from sumail03.studentuniverse.com (sumail03.studentuniverse.com
	[192.168.1.7])
	by mx2.studentuniverse.com (8.13.3/8.13.3/SuSE Linux 0.7) with ESMTP id
	k8KExJr2016230
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 10:59:21 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] LVM on RAID
Date: Wed, 20 Sep 2006 10:59:18 -0400
Message-ID: <D2575519D6CA2840B6D3E26087EA71B6CB4D@sumail03.studentuniverse.com>
From: "Marlier, Ian" <ian.marlier@studentuniverse.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>



> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alexander Lazarevich
> Sent: Wednesday, September 20, 2006 10:48 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] LVM on RAID
> 
> I should have been more clear. I'm not worried about LVM on one RAID.
My
> questions is specifically about creating an LVM volume group ACROSS
two
> RAID's.
> 
> For example, we have a 64bit linux server, with two different RAID
devices
> attached to the host via Fiber. These RAID's are each 4TB volumes. The
> RAID is attached as /dev/sda and /dev/sdb. What I'm asking about is
> creating a LVM volume group, and joining /dev/sda AND /dev/sdb to that
> same volume group, creating the lv of 8TB (minus overhead of course),
and
> then creating a filesystem on that lv. A 8TB filesystem, which is
spanned
> (via LVM) across both RAID's.
> 
> Does anyone here do that? Reading all the reply's I realize I wasn't
clear
> enough about that, and neither was anyone's responses.

I'm not using fiber, but I have a very similar setup: 2 x 3ware 9550SX
hardware raid cards, with 3.73GB of SATA disk attached to each, exported
as /dev/sdb and /dev/sdc.  I've got a single VG across them.

I allocate logical volumes as needed, rather than having a single
massive LV spanned across the whole thing.  At least one of those LVs
has to span across the RAID div, though, as I've got more allocated than
the capacity of a single RAID device.

All in all, it's been a rock-solid setup, and very fast.  

 
