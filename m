Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6UEiaa21607
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 10:44:36 -0400
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk
	[129.215.166.64])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6UEiYe1012522
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 10:44:34 -0400
Received: from grassmarket.ucs.ed.ac.uk (localhost [127.0.0.1])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id
	i6UEiXcn023113
	for <linux-lvm@redhat.com>; Fri, 30 Jul 2004 15:44:33 +0100 (BST)
Received: (from nobody@localhost)
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.9/Submit) id i6UEiXe7023103
	for linux-lvm@redhat.com; Fri, 30 Jul 2004 15:44:33 +0100 (BST)
Message-ID: <1091198673.410a5ed155ab3@sms.ed.ac.uk>
Date: Fri, 30 Jul 2004 15:44:33 +0100
From: Rupert Hair <rupert.hair@ntlworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] ext3 on LVM2 on RAID 5
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
To: linux-lvm@redhat.com

I have read various posts on this topic and none have been answered so I thought
I'd try again.

I have spent an afternoon with google trying to find any information on using
ext3 on a LVM2 LV on a RAID 5 PV.  I have found various reports of this working
OK but no recommendations for PE size for the LV, the 'chunk-size' on the RAID
and the mk2fs stride option.

If anyone uses this configuration I would greatly appreciate any input on what
values you used for the options above and any other good or bad experiences you
had with this setup.

Thanks in advance,

Rupert

Ps. Details of the machine in question (in case they are relevant):
      9 x 250GB drives spread across various parallel and serial ATA
controllers.
      Debian testing with kernel 2.6.6
