Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nATB7Cgi032235
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2009 06:07:12 -0500
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.211.179])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nATB6ugP022046
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2009 06:06:56 -0500
Received: by ywh9 with SMTP id 9so2341422ywh.19
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2009 03:06:56 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 29 Nov 2009 11:06:56 +0000
Message-ID: <3a0a09d20911290306o4e1eb1c0y753a7beb999b66b1@mail.gmail.com>
From: Robert Mortimer <robert.mortimer@gmail.com>
Subject: [linux-lvm] Adjusting stripe size.
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

I have a volume group  that I migrated from 1 physical drive to two
RAID 0 drives. Looking at the disk access it appears that I have no
stripe. All data access seems to be on the first drive. How do I
re-configure the volume group to stripe accross the two physical
drives?
