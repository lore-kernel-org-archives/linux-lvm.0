Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JJYmeo004362
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 15:34:48 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JJYcvc017117
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 15:34:39 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JJYcIf003935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 15:34:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JJYcb9029679
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 15:34:38 -0400
Date: Wed, 19 May 2010 15:34:38 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1274289803.16893.12@raydesk1.bettercgi.com>
Message-ID: <Pine.LNX.4.64.1005191524400.29583@bmsred.bmsi.com>
References: <1274289803.16893.12@raydesk1.bettercgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On Wed, 19 May 2010, Ray Morris wrote:

>  It's also useful during the boot process.  If, for example, you
> later add another disk, this disk might become sdd, where it used to
> be sdc.  That can confuse initrd and friends and result in an
> unbootable system.  On almost every machine where I've skipped
> creating partitions for RAID or LVM, this kind of thing has come
> back to bite me later - maybe years later.  Now, I always create
> "Linux LVM" partitions for LVM and "Linux raid autodetect" partitions
> for RAID.  It makes booting an recovering much more reliable in
> case of changes or problems.

PVs are identified by UUID.  It doesn't matter whether they change
names.  And changing names from sdc1 to sdd1 is just as bad as changing
names from sdc to sdd. 

However, you are correct that the default device searching rules used by
lvm might work correctly with a Linux LVM labeled partition where they might
otherwise skip a device.  If you aren't familiar with lvm.conf, then
using labeled partitions is a safer course.  (initrd uses a copy
of lvm.conf to find PVs so it can activate the volume group of the
root filesystem if necessary.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
