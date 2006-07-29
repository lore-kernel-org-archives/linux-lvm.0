Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6TA4ML1024276
	for <linux-lvm@redhat.com>; Sat, 29 Jul 2006 06:04:22 -0400
Received: from web26602.mail.ukl.yahoo.com (web26602.mail.ukl.yahoo.com
	[217.146.176.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6TA4Jc9028031
	for <linux-lvm@redhat.com>; Sat, 29 Jul 2006 06:04:19 -0400
Message-ID: <20060729081733.88249.qmail@web26602.mail.ukl.yahoo.com>
Date: Sat, 29 Jul 2006 08:17:33 +0000 (GMT)
From: ramsis farhat <sismar2002@yahoo.fr>
MIME-Version: 1.0
Subject: [linux-lvm] root partition
Reply-To: ramsis farhat <sismar2002@yahoo.fr>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello every body. I'm student and I have training in a company that wants to put LVM partitions in its server.
The problem is that they do not want to format the hard disk.
For the moment, I'm working on a virtual machine with Red Hat Entreprise 3.
I'm working with 2 hard disks of 8GB. The first is partitioned like this
sda1 boot (101 MB)
sda2 /      (7400MB)
sda3 swap (573 MB)
 
I followed exactly the steps in the LVM-HOWTO excepted that I added the second Hard disk sdb.
I made a lvm partion sdb1 and I put all the root data on it.
Then, I had 2 problems. The first is that the RAM disk can't be created because of the lack of space ( I'm not sure of that)
And the second is that the server is using GRUB and not LILO, so I don't know How rebooting on the new root file.
 
If anybody have any suggestion, and thank you for your help.
