Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6T8qua28874
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 04:52:56 -0400
Received: from smtp106.mail.sc5.yahoo.com (smtp106.mail.sc5.yahoo.com
	[66.163.169.226])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i6T8qoXn003667
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 04:52:50 -0400
Sender: frank@redhat.com
Message-ID: <4108BADB.758AEB0@yahoo.de>
Date: Thu, 29 Jul 2004 10:52:43 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] looking for tool to edit LVM structures on disk
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

hi

Is the any tool to fix PE entries on disk?

My LVM system seems to have some corrupted PE entries.
A vgcfgrestore doesn't fix these (even with some older backups).
Shouldn't the backup contain the PE entries?

Is there any way to fix the entries? 
By some debugging in vg_read_with_pv_and_lv() I found that some (7)
pe[ope].le_num values
are out of sequence and outside lv_allocated_le (and even some
duplicated).

A better description is in my last mail -- "Re: [linux-lvm] pvscan fails
(some more debugging - cause found)"

Frank
