Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TIIqC8004235
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 14:18:52 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2TIIcD4023171
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 14:18:39 -0400
Message-ID: <4BB0EEFC.5090207@cfl.rr.com>
Date: Mon, 29 Mar 2010 14:18:36 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dmeventd mirror monitoring
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

It seems that dmeventd was created to allow lvm to have it monitor
mirrored volumes and detect errors and take appropriate action, such as
notifying the administrator about the mirror becoming degraded and maybe
rebuilding with a spare.  I can't find any documentation on how to
configure this though, so I get the feeling that it has not been
implemented.  Is this the case?
