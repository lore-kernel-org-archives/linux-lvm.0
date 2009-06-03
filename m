Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n53IgijP008454
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:42:44 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n53IgUT9019810
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:42:31 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n53IgT9o020987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:42:29 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n53IgT37014673
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:42:29 -0400
Date: Wed, 3 Jun 2009 14:42:29 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm on a single big partition or just a single big
	partition?
In-Reply-To: <20090603164231.GA23418@m364d1.ece.northwestern.edu>
Message-ID: <Pine.LNX.4.64.0906031436460.14629@bmsred.bmsi.com>
References: <20090603164231.GA23418@m364d1.ece.northwestern.edu>
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

On Wed, 3 Jun 2009, Zhengquan Zhang wrote:

> For one harddrive I often create a /boot parition that is not lvm and
> create a huge partition on the rest of the harddrive for PV of lvm. Now
> I am thinking what is the difference between doing partition like this
> and just a single big partition without lvm?

With LVM, you can create many logical volumes.  If you only ever create one
logical volume that fills the entire PV, and you aren't spanning drives
(multiple PVs) or mirroring, then LVM is not doing anything for you.

Even with just one LV, leave some space for a snapshot.  Then you can
take more consistent backups by creating a snapshot of your main LV
and backing that up instead.  Put your swap space in LVM as well.

One reason to create multiple LVs is for virtual machines.  If you
run Xen, VMWare, or other virtual machine, then each virtual machine
should have its own LVs for disk drives.  This is more efficient
than using a filesystem file for a virtual disk.

PS.  I wonder if Grub will ever support LVM?  Does LILO work with LVM?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
