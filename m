Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KC5Mu13292
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 08:05:22 -0400
Received: from hermesnew.ex.ac.uk (dot.ex.ac.uk [144.173.6.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KC5CXI009615
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 08:05:16 -0400
Received: from volt.ex.ac.uk ([144.173.228.65] helo=volt)
	by hermesnew.ex.ac.uk with esmtp (Exim 4.50/mail) id 1DkL1P-0001Yx-Fy
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 13:04:59 +0100
Received: from rowe by volt with local (Exim 4.43) id 1DkKzP-0004Tj-L2
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 13:02:55 +0100
From: John Rowe <rowe@excc.ex.ac.uk>
Content-Transfer-Encoding: 7bit
Date: Mon, 20 Jun 2005 13:02:55 +0100
Message-Id: <1119268975.25392.34.camel@volt>
Mime-Version: 1.0
Sender: John Rowe <rowe@excc.ex.ac.uk>
Subject: [linux-lvm] Is LVM safe?
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

With a 'standard' disk partition (ext3, etc.) I can be confident that if
I have the partition I have the data: I can always just move the disk to
another system and mount it. Is the same true for LVM? 

I am concerned that the LVM system also seems to need some information
kept on the host files system in /etc/lvm* and that if I lose that I'm
in serious trouble.

John
