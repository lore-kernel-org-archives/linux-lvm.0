Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i58IFL024560
	for <linux-lvm@redhat.com>; Tue, 8 Jun 2004 14:15:21 -0400
Received: from fri.itea.ntnu.no (fri.itea.ntnu.no [129.241.7.60])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i58IFFXn011408
	for <linux-lvm@redhat.com>; Tue, 8 Jun 2004 14:15:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by fri.itea.ntnu.no (Postfix) with ESMTP id E69BD873B
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2004 20:15:14 +0200 (CEST)
Received: from localhost (textus6.stud.ntnu.no [129.241.56.156])
	by fri.itea.ntnu.no (Postfix) with ESMTP id A71198737
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2004 20:15:14 +0200 (CEST)
Message-ID: <1086718514.40c602329979c@webmail.ntnu.no>
Date: Tue,  8 Jun 2004 20:15:14 +0200
From: David Ellingsen <davide@stud.ntnu.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovering files from incomplete set of pvs?
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

Hello, 

I had a volume group with several logical volumes across 3 lvm physical
volumes that was partitions on the same disk. Then I had a little
accident and lost the partition table. I managed to recover most of the
partitions on the disk with the help of gpart. 

The root partition was recovered correctly, so I am able to boot into
single user mode and have access to /etc/lvm. The big problem is that I
suspect only one of the lvm partitions was recovered correctly. Only
this partition matches one of the sizes described in
/etc/lvm/archive/vg0_00004.vg. pvscan also seem to display this
partition correctly (after running a program called uuid_fixer). (the
other two pvs is displayed with 0 free space).

My question is: Since linear mapping is used, should it not be possible
to recover some of the files even if only one pv is available?

The machine run lvm 2.00.06 and kernel 2.6.1 on Debian. I have very
little experience with lvm, so any help will be appreciated. 

David
