Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB1ENXtd020474
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 09:23:33 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB1ENOY7005439
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 09:23:25 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1PNnad-0003qQ-RD
	for linux-lvm@redhat.com; Wed, 01 Dec 2010 15:23:23 +0100
Received: from lan-fw.biochem.mpg.de ([141.61.181.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 15:23:23 +0100
Received: from johannes_graumann by lan-fw.biochem.mpg.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 15:23:23 +0100
From: Johannes Graumann <johannes_graumann@web.de>
Date: Wed, 01 Dec 2010 15:23:10 +0100
Message-ID: <id5lof$lir$1@dough.gmane.org>
References: <id4tfc$81m$1@dough.gmane.org> <id56v8$fc4$1@dough.gmane.org>
	<id5ji7$b6h$1@dough.gmane.org>
	<20101201141259.GA17090@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] [SOLVED]: lvm2 and partition shringkin:
	superblock/filesystem size mismatch
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

There ware complaints about unmatching group sizes, so I guess I lost data.

Joh

Lars Ellenberg wrote:

> On Wed, Dec 01, 2010 at 02:45:42PM +0100, Johannes Graumann wrote:
>> And yes, by that I set the truncation of the FS (thanks, Lars for
>> pointing that out) in stone ...
> 
> Soo... did the fsck you ran immediately after the mke2fs -S complain,
> or did you get away with no more than a fright?
> 
> Lars
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
