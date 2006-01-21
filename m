Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0LI2c107612
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 13:02:38 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0LI2cSl032203
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 13:02:38 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1F0N4P-00058p-RU
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 10:02:37 -0800
Date: Sat, 21 Jan 2006 10:02:37 -0800
From: David Brown <lvm@davidb.org>
Message-ID: <20060121180237.GA19642@old.davidb.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Additional snapshot issue.
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

One other snapshot issue...

I'm having an interesting issue with snapshots.  I'm running the following:

  linux 2.6.14 (gentoo-r5)
    (which I believe contains the DM in the stock 2.6.14 kernel).
  lvm2 2.01.14

Backup is of the snapshot.

The problem: I'm finding that if I backup the snapshot, and certain files
are modified, usually database-type files (cyrus-imapd's databases and the
likes), they files on the snapshots see some modifications.  I have not
been able to reproduce this with my own databases, so I don't know what is
going on.

Again the question I would ask is if this is part of the known issue, or
should I investigate further.

Thanks,
David Brown
