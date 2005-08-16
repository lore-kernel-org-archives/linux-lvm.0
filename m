Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GHNkV05435
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 13:23:46 -0400
Received: from eastrmmtao01.cox.net (eastrmmtao01.cox.net [68.230.240.38])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7GHNfgH012416
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 13:23:41 -0400
Received: from localhost ([24.250.31.7]) by eastrmmtao01.cox.net
	(InterMail vM.6.01.04.00 201-2131-118-20041027) with ESMTP
	id <20050816172334.IHHL21289.eastrmmtao01.cox.net@localhost>
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 13:23:34 -0400
Received: from chris by localhost with local (Exim 4.43) id 1E55Bx-0004XC-5v
	for linux-lvm@redhat.com; Tue, 16 Aug 2005 13:25:37 -0400
Date: Tue, 16 Aug 2005 13:25:37 -0400
From: Chris Shoemaker <c.shoemaker@cox.net>
Message-ID: <20050816172537.GA17428@pe.Belkin>
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

[Resending now that I've subscribed.]
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
