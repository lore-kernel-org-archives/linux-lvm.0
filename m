Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5TGHYu26131
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:34 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5TGHPfl012063
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:25 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:5TkijARZe/T+PE30R9TJ2O74BkVGFenv@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j5TGHISa024729
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:18 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:zMovntlNcSOqooI8Wv1SebK/XL0i6Q8k@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j5TGHGMl017632
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:18 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j5TGHF9d017628
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:16 -0400
Date: Wed, 29 Jun 2005 12:17:15 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0506291211180.15781-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
Subject: [linux-lvm] my volume group disappeared!
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello all, I'm in desperate need of some assistance.  I
used to have 2 volume groups, big_cheese and lil_cheesy1.


  blade01:phung # vgscan
    Reading all physical volumes.  This may take a while...
    Found volume group "lil_cheesy1" using metadata type lvm2
    Found volume group "big_cheese" using metadata type lvm2

but I've been messing with my GFS configuration and rebooting
"spontaneously" (to test the locking setup I have), and now
I'm missing one of my beloved volume groups!


  blade01:phung # vgscan
    Reading all physical volumes.  This may take a while...
    Found volume group "lil_cheesy1" using metadata type lvm2


This is an IBM fastT500/EXP500 SAN, so I can login using their
SMclient facility and I see that the array is still correctly 
configured, and I do see the /dev/sda where the data lives, 
and I can fdisk that device to see my array, but the physical
volume also seems to be missing!

  blade01:phung # pvs
    PV         VG          Fmt  Attr PSize  PFree
    /dev/sdb   lil_cheesy1 lvm2 a-   68.32G 68.32G

any help would be much appreciated.
- dan
