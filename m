Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6U8Aaa32363
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 04:10:36 -0400
Received: from smtp105.mail.sc5.yahoo.com (smtp105.mail.sc5.yahoo.com
	[66.163.169.225])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i6U8ATXn014174
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 04:10:30 -0400
Sender: frank@redhat.com
Message-ID: <410A0269.14F0DFB5@yahoo.de>
Date: Fri, 30 Jul 2004 10:10:17 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Tool to convert LVM1 vgcfgbackup to readable format?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

is there any tool to convert vgcfgbackup files to a editable format and
back?

I still try to fix some broken PE entries. 
I think the easiest way to fix these would be to work with the last
backup file,
fix them there and then do a vgcfgrestore.

Frank
