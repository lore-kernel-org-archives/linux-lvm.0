Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5FHhB1Q008782
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:43:11 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5FHh9iU005266
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:43:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p5FHh2qb005413
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:43:02 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p5FHh034009814
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:43:00 -0400
Date: Wed, 15 Jun 2011 13:43:00 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4DF8EB19.6030106@infocamere.it>
Message-ID: <alpine.LRH.2.00.1106151337320.9715@bmsred.bmsi.com>
References: <4DF8EB19.6030106@infocamere.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Meaning of LV -missing_<x>_<x> devices
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 15 Jun 2011, Enrico Ferro wrote:

> after the extention of a logical volume (mysqld1) a new "ghost" logical 
> volume
> appeared with a <missing> suffix:
>
> brw-rw---- 1 root disk 253, 38 Feb 15 20:53 vgmysql-mysqld1
> brw-rw---- 1 root disk 253, 44 Jun 1 10:21 vgmysql-mysqld1-missing_4_0

That means the lv was extended onto a PV that is no longer online.
The missing device is the extents allocated on the missing PV.

> Before performing this LV we partitioned and added a new LUN to the existing
> vgmysql volume group (again, no errors reported).
>
> We did not discovered this strange device immediately (the lvextend
> command did not reported errors), only after resizing the file system.
> The ext2fs operation aborted and so we started with investigation.

> So online resize of the FS failed, we unmounted the LV, extended with
> (apparent) success the filesystems and lived happy for a few days. Only
> while a deep corruption of the FS appeared. :-(

You needed to do an fsck after the aborted filesystem resize.  I'm
suprised the fs resize didn't make you do so.  If you did do the fsck,
then there are serious problems with your new PV.

> A reboot cleaned up the strange "missing" LV, it is no more present.

> The point is: what is the meaning of -missing_* device? When are they
> generated (and why there are no warnings reported?)

Apparently, the new PV went offline between lvextend and resize.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
