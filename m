Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8EGtNV0012316
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 12:55:23 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8EGtEGD021691
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 12:55:14 -0400
Date: Wed, 14 Sep 2011 11:55:11 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110914115511.7209c08f@bettercgi.com>
In-Reply-To: <4E70566A.1040501@unfoo.net>
References: <4E6E6BDE.1040301@unfoo.net>
	<alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
	<4E6E8476.6030609@unfoo.net> <4E70566A.1040501@unfoo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] harddisk dies while pvmove is in progress
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: rmu@unfoo.net

> For the record: finally, I edited the last metadata-backup, put the
> successfully mirrored segment on the raid into the LV (instead of the
> pvmovesomething mirror), removed references to pvmove, the damaged PV
> and the "homevideo" LV, vgcfgrestored the config, rebooted, and
> everything works.
> 
> Robert


It's good to know what kind of thing can actually work in practice.
I'm absent minded, the kind of guy who says "oops" a lot, so it's 
always good to know ways of recovering.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 14 Sep 2011 09:23:22 +0200
Robert Schöftner <rmu@unfoo.net> wrote:

> Am 2011-09-13 00:15, schrieb Robert Schöftner:
> > my plan is to edit the latest archived meta-data, remove the
> > pvmove-mirror, exchange the segment pointing to the missing device
> > with the mirrored segment, and vcfgrestore it, if no better idea
> > comes up. the saved metadata confirms that the segment belonging to
> > LV "shares" was completely mirrored before the harddisk died, so
> > all the needed data is there.
> For the record: finally, I edited the last metadata-backup, put the
> successfully mirrored segment on the raid into the LV (instead of the
> pvmovesomething mirror), removed references to pvmove, the damaged PV
> and the "homevideo" LV, vgcfgrestored the config, rebooted, and
> everything works.
> 
> Robert
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
