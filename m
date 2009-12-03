Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB3IpCQn031344
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:51:12 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB3IouY1016107
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:50:56 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nB3IorLP019352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:50:55 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nB3IoqcR013543
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:50:52 -0500
Date: Thu, 3 Dec 2009 13:50:52 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Questions regarding LVM
In-Reply-To: <89A593F9810AA744B420746E2755B8480DFE0A@xmb-sjc-224.amer.cisco.com>
Message-ID: <Pine.LNX.4.64.0912031342400.13455@bmsred.bmsi.com>
References: <89A593F9810AA744B420746E2755B8480DFE0A@xmb-sjc-224.amer.cisco.com>
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

On Thu, 3 Dec 2009, Vishal Verma -X (vishaver - Embedded Resource Group at Cisco) wrote:

> 1.       Under scenario where, several hard-drives are part of LVM
> volume group and if one of hard-disk gets corrupted then would whole
> volume group be inaccessible ?

Short answer: it depends

Long answer: For raw plain hard drives, only logical volumes using the
affected drive are inaccessible.  Think of LVM as managing fancy run-time
expandable partitions.  You may wish to ensure that the LVM metadata (the LVM
equivalent of the partition table) is stored in multiple locations, or
frequently backed up from /etc/lvm.

More often, the "drives" that are part of LVM are software or hardware RAID
drives.  In addition, Linux LVM supports mirroring (RAID1) at the LV level
- although not yet as smoothly as other LVM systems.

> What would be impact on volume group's filesystem ?

Same as with any other partition that goes south.

> 2.       From stability perspective, which version of LVM is better on
> Linux kernel 2.6.x, LVM2 or LVM1 ?

LVM2

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
