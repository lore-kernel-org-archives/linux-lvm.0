Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6D2OU1u012408
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 22:24:30 -0400
Received: from web50705.mail.yahoo.com (web50705.mail.yahoo.com
	[206.190.38.103])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6D2OSlD003386
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 22:24:28 -0400
Message-ID: <20060713012417.80370.qmail@web50705.mail.yahoo.com>
Date: Wed, 12 Jul 2006 18:24:17 -0700 (PDT)
From: John Koshi <jkoshi@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM question on move and resize
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
To: linux-lvm@redhat.com


Hello,

I have the following setup:

HP dv1000 laptop with an 80G hard disk laid out as follows:
1)70Gb NTFS, WinXP primary
2)100Mb ext3 primary Fedora 4 /boot
3)10Gb Extd primary, containing logical(8E) LVM Fedora 4 root

Since the Linux root is getting full, I want to expand it,
by reducing the NTFS partition, and moving all the Linux
partitions down, and then expand the LVM root outwards.

With Partition Magic 8.0, I can resize the NTFS disk, and
move the ext3 boot partition (after removing it's features
resize_inode, dir_index, and ext_attr using e2fsprogs),
and resize the Extended partition to the left as needed.

The problem now is how to move and expand the LVM root as
mentioned above. Partition Magic and Qtparted can't do it.

Is it possible to do this? If so, what are the steps?

regards,
John
