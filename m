Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GDxhvB020699
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 09:59:43 -0400
Received: from interhosting.it (smtpauth.interfree.it [213.158.72.43])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8GDxSfF010816
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 09:59:31 -0400
Received: from delo.gdit (delo.gdit [127.0.0.1])
	by delo.gdit (8.14.2/8.14.2) with ESMTP id n8GDxQDZ015452
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:59:27 +0200
Received: (from root@localhost)
	by delo.gdit (8.14.2/8.14.2/Submit) id n8GDxQtN015450
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 15:59:26 +0200
From: Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it>
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Sep 2009 15:59:26 +0200
Message-Id: <1253109566.5326.15.camel@delo.gdit>
Mime-Version: 1.0
Subject: [linux-lvm] Using LVM Mirroring to obtain a usable backup
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all.
I'm doing a big upgrade on my computer and I tryed to use lv mirroring
to obtain a copy of my data before to do it.

As I do with LVM on other OS i thought that after mirroring one could
chose to split the mirrored lv.

I can't find how to do it with LVM2 on Linux.

There is a way?
Tnx
 Ambrogio
