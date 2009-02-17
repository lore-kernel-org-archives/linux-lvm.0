Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1HDkUEs013751
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 08:46:30 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1HDkG0j014640
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 08:46:17 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZQHB-0004Nc-FF
	for linux-lvm@redhat.com; Tue, 17 Feb 2009 13:46:17 +0000
Received: from 76-10-148-202.dsl.teksavvy.com ([76.10.148.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 13:46:17 +0000
Received: from monnier by 76-10-148-202.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2009 13:46:17 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Tue, 17 Feb 2009 08:46:08 -0500
Message-ID: <jwvhc2tyy8t.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498EE80D.3090307@redhat.com>
	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<49905A90.2000802@redhat.com>
	<jwvk57q0y5w.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<20090217000623.GD26197@agk.fab.redhat.com>
	<jwv7i3p24qp.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<499A67B8.8070507@redhat.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: Problems running my home-built LVM2
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

> This really seems like problem unrelated to LVM2,
> is possible that O_DIRECT is just buggy on ARM & similar archs
> see http://lkml.org/lkml/2008/11/19/300 for example...

Yes, that's also my impression.  It would be good to add a clear
note/warning about it somewhere in the README, or even change the
`configure.in' to test O_DIRECT (or even disable it on the affected
platforms).
I spent a lot of time trying to figure out why my LVM2 build
didn't work and how to fix it, and I hope nobody else needs to go
through that.


        Stefan
