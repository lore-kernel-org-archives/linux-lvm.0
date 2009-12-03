Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB3IgvDT004142
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:42:57 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB3IgfZN032718
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 13:42:41 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id nB3IeIwM009140
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 11:40:18 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	nB3IgW6t084874
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 11:42:34 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id nB3BWKj5020318
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 04:32:20 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nB3BWK4e020229
	for <linux-lvm@redhat.com>; Thu, 3 Dec 2009 04:32:20 -0700
Date: Thu, 3 Dec 2009 10:42:19 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Questions regarding LVM
Message-ID: <20091203184219.GA29968@us.ibm.com>
References: <89A593F9810AA744B420746E2755B8480DFE0A@xmb-sjc-224.amer.cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89A593F9810AA744B420746E2755B8480DFE0A@xmb-sjc-224.amer.cisco.com>
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

Vishal Verma -X (vishaver - Embedded Resource Group at Cisco) [vishaver@cisco.com] wrote:
>    1.       Under scenario where, several hard-drives are part of LVM volume
>    group and if one of hard-disk gets corrupted then would whole volume group
>    be inaccessible ?

No.

>    What would be impact on volume group's filesystem ?

A volume group may have several file system images. You should have no
problem in accessing logical volumes (or file systems on them) that
don't include the corrupted/failed disk. Obviously, logical volumes that
include the corrupted/failed disk will have problems unless it is
a mirrored logical volume!

>    2.       From stability perspective, which version of LVM is better on
>    Linux kernel 2.6.x, LVM2 or LVM1 ?

I would go with LVM2.
