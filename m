Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i74GaGa02508
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 12:36:16 -0400
Received: from c000.snv.cp.net (h000.c000.snv.cp.net [209.228.32.64])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i74GaEe1009500
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 12:36:14 -0400
From: "S. Anthony Sequeira" <tony@sequeira.com>
Message-Id: <1091637370.1453.420.camel@aurora.sequestor.lan>
Mime-Version: 1.0
Date: Wed, 04 Aug 2004 17:36:11 +0100
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgchange -a n returns error 5 'Locking type 1
	initialization failed'
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM List <linux-lvm@redhat.com>

LFS build.  Kernel 2.4.26, upgraded to LVM2.  Haven't converted my
existing LVMs to LVM2 yet?

Installed device-mapper stable, version 1.00.18, dated 06/20/04
14:28:00.

Installed LVM2 stable, version 2.00.15, dated 06/20/04 14:17:00.

I always get the error mentioned in the subject on a shutdown.

Any ideas please?  Google tells me that this is listed on Bugzilla.  My
Gentoo and SuSE installations do not evince the problem.  This could be
because they are using kernel 2.6 though.
-- 
You don't become a failure until you're satisfied with being one.
