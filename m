Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2LvxjY014553
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:57:59 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2LvwBK020907
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:57:58 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2LvvnH001232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:57:57 -0500
Message-Id: <6.2.5.6.2.20111202164221.063eb6d0@binnacle.cx>
Date: Fri, 02 Dec 2011 16:47:36 -0500
From: starlight@binnacle.cx
In-Reply-To: <alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

It just occurred to me that the system
in question is a development box that
is abused in stress testing and other 
scenarios.  It crashes in horrible ways
fairly often.

So I realize I should soften my criticism of
LVM  mirroring somewhat.  Probably the
differences resulted during one of the
numerous kernel deaths.  Block-by-block
mirror re-synchronization has been
suppressed by the existence of persistent
mlogs.  Then again, I suppose the mirror
log logic is where the failure resides.

That fact and that LVM mirroring
reliably hangs the kernel if a swap
mirror and only moderate system stress
are present leaves me with the conviction
that LVM mirrors will be entirely avoided
here going forward.

https://bugzilla.redhat.com/show_bug.cgi?id=559959
