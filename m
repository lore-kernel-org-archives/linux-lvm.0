Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QJe5mR019173
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:40:05 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QJds2U023761
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:39:55 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9QJdsFM008378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:39:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9QJdsY2022641
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:39:54 -0400
Date: Mon, 26 Oct 2009 15:39:54 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
In-Reply-To: <a5a956f70910260820l793f8435s18c68deb252edd81@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910261536030.22595@bmsred.bmsi.com>
References: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
	<20091025084610.GA737@maude.comedia.it>
	<c268e4660910250613y5d307d92t3ab0f4198d76c373@mail.gmail.com>
	<Pine.LNX.4.64.0910251408410.6251@bmsred.bmsi.com>
	<Pine.LNX.4.64.0910251513440.6251@bmsred.bmsi.com>
	<a5a956f70910260820l793f8435s18c68deb252edd81@mail.gmail.com>
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

On Mon, 26 Oct 2009, Lou Arnold wrote:

> Hat do you mean by:"4) switch root (remount won't be good enough since it
> changed "underfoot")"
> Can you please explain?

You can't change a filesystem by directly writing the block device while
it is mounted, without hopelessly confusing the filesystem driver. 
(Exceptions would be filesystems designed to be updated by multiple
computers - but these have their own limitations.)

Switchroot actually closes all files, umounts root fs, and mounts it again.
It is normally used at the end of initrd to switch from the ramdisk root
to the real root filesystem.  Not much better than a reboot actually,
but technically not a reboot :-)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
