Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p49KbLCd009858
	for <linux-lvm@redhat.com>; Mon, 9 May 2011 16:37:21 -0400
Received: from qmail-admn-norm-0.netfirms.com (admin-norm-b.netfirms.com
	[70.35.17.200])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p49KbKD0023784
	for <linux-lvm@redhat.com>; Mon, 9 May 2011 16:37:20 -0400
Received: from steve by steve-desktop with local (Exim 4.69)
	(envelope-from <steve@netfirms.com>) id 1QJXDi-0007dh-4Q
	for linux-lvm@redhat.com; Mon, 09 May 2011 16:38:22 -0400
Date: Mon, 9 May 2011 16:38:22 -0400
From: Steve Shorter <steve@netfirms.com>
Message-ID: <20110509203822.GA29336@netfirms.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] creating pv's on LVM's for virtual guests
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Howdy!

	I am setting up virtual guests to have a LVM created
from the host. It would be good to use LVM's in the
guest also.. for easy volume expansion etc...

ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to
work but some of the userland tools need the option -ff

	Does anybody see any issues doing this?

	thanx - steve
