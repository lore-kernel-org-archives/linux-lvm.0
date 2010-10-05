Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o956OL1X020868
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:24:21 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o956OAwl012746
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:24:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o956O9wE013198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:24:09 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o956O9No026386
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:24:09 -0400
Date: Tue, 5 Oct 2010 02:24:09 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010050215180.26224@bmsred.bmsi.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
	<AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
	<AANLkTimTBv67Q6qa4ONibbPxHz-eOufR+gR=Qe4-CE3H@mail.gmail.com>
	<AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 5 Oct 2010, Tapas Mishra wrote:

> I have read it but what I am asking is not mentioned.
> I am breaking an LVM which is not having any filesystem on it into 2 parts.

"LVM" stands for Logical Volume Manager. You can't break it up.  It is a set
of software.  (Well, you can, but then it wouldn't work so good.)  Some things
you might be trying to say:

1) a "PV" is a Physical Volume.  You add these to to a Volume Group, and
   once you do that you can do one of the following.

2) a "VG" is a Volume Group.  This you can "break up" into many logical
   volumes.  Use the lvcreate command to create logical volumes, one
   for your filesystem and another for your swap.

3) an "LV" is a Logical Volume.  An advanced user might want to use an
   LV to simulate a disk, putting a partitional table on it.  Usually
   this is done by using the LV as a virtual disk for a Virtual Machine,
   which then partitions and uses the virtual disk as it pleases.
   You could also use fdisk/parted to partition an LV, and kparted to
   make the partitions available as separate block devices.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
