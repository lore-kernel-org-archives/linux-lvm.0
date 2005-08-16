Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GEFpV06829
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 10:15:51 -0400
Received: from centrmmtao06.cox.net (centrmmtao06vip.cox.net [68.1.16.144]
	(may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7GEFoCk011766
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 10:15:50 -0400
Received: from localhost ([24.250.31.7]) by centrmmtao06.cox.net
	(InterMail vM.6.01.04.00 201-2131-118-20041027) with ESMTP
	id <20050816141544.GLBX1571.centrmmtao06.cox.net@localhost>
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 10:15:44 -0400
Received: from chris by localhost with local (Exim 4.43) id 1E52G9-0004SH-US
	for linux-lvm@redhat.com; Tue, 16 Aug 2005 10:17:45 -0400
Date: Tue, 16 Aug 2005 10:17:45 -0400
From: Chris Shoemaker <c.shoemaker@cox.net>
Message-ID: <20050816141745.GA17120@pe.Belkin>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] 2.00 TB of PV "not usable"?
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

[I've searched google and the list archives for the answer to this
question, but without success.]

I've got a 3.18 TB PV member of a VG, and everything seems to be
working fine.  But, I noticed that the output of pvdisplay for my PV shows:

...
PVSize        3.18 TB / not usable 2.00 TB
Allocatable   yes (but full)
...

My question is: should I be concerned about the "not usable 2.00 TB" part?

Thanks,

-chris

p.s. kernel is 2.6.9
