Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p05Ik6Y6004943
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 13:46:06 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p05IjpKY027661
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 13:45:51 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p05Ijo66007078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 13:45:50 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p05Ijn4T003986
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 13:45:49 -0500
Date: Wed, 5 Jan 2011 13:45:49 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <581831.19828.qm@web39308.mail.mud.yahoo.com>
Message-ID: <Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
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

On Tue, 4 Jan 2011, Brian Neu wrote:

>   For many years, I've greatly desired a snapshotting solution which goes
>   above and beyond the current lvm features.  I'd love to see the ability to
>   instantiate a storage pool for creating snapshots, with either a
>   first-in-first-out or even some other method for bumping snapshots when the
>   pool fills up.  The inefficiency of the former style of lvm snapshots in
>   both space and speed and the cumbersome nature of managing them has kept me
>   looking for alternatives.  Btrfs isn't quite there yet and may not be
>   through 2011 or beyond.  zfs-fuse can't seem to act as a volume manager and
>   I'm having problems with crashes.  Frustrated, I'm turning back to lvm.
> 
>    So now I'm looking at the lvm wiki and I'm seeing "shared exception
>    store".  Can someone fill me in on the current status of this effort as
>    the wiki was last updated in May-2009 ?

These guys have snapshot pools working as an addon product.  It mostly
works using straight device mapper - but they have a kernel patch that is
needed for some deadlock issues.

http://zumastor.org/

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
