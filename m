Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5FFNx26011062
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2010 11:23:59 -0400
Received: from EXHUB016-1.exch016.msoutlookonline.net
	(exhub016-1.exch016.msoutlookonline.net [207.5.72.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5FFNnAW000448
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2010 11:23:49 -0400
Message-ID: <4C179B03.2000102@cfl.rr.com>
Date: Tue, 15 Jun 2010 11:23:47 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Why does every lvm command insist on touching every pv?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Every time I run any lvm command, it goes out and touches every pv,
causing all the disks to wake up from standby.  Why is this?  Shouldn't
a simple lvs command be able to look in the /etc/lvm/cache for what it
needs instead of touching every pv, even ones with no lvs on them?
