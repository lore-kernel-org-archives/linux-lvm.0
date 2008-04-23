Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NCof8E020036
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 08:50:42 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3NCofxk010076
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 08:50:41 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JoeQr-0004OW-EQ
	for linux-lvm@redhat.com; Wed, 23 Apr 2008 13:50:41 +0100
Date: Wed, 23 Apr 2008 13:50:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm metadata
Message-ID: <20080423125041.GC18935@agk.fab.redhat.com>
References: <cc7379f90804230530j24a16958s637d180f17b781e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc7379f90804230530j24a16958s637d180f17b781e@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

If you hand-edited you might want to change
  status = ["RESIZEABLE", "PARTIAL", "READ"]
to
  status = ["RESIZEABLE", "READ", "WRITE"]

Alasdair
-- 
agk@redhat.com
