Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j65GfVV19447
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 12:41:31 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j65GfT9q001705
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 12:41:29 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:3BNf4pdsJhwWg1j3nhT7U5aeJ8bAPyvF@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j65GfPSa027830
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 12:41:26 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:+z63pBA6xsPX4/t2AIGR6Vu0ggTO/FeK@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j65GfPMl020821
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 12:41:25 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j65GfPfU020817
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 12:41:25 -0400
Date: Tue, 5 Jul 2005 12:41:25 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0507051240100.21204-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Segfault in lvcreate?
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

am I doing something wrong? 

blade01:phung # pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdb
  VG Name               lil_cheesy1
  PV Size               68.32 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              17491
  Free PE               17491
  Allocated PE          0
  PV UUID               LXHvR8-IrQ0-SGV9-wkL2-a0bE-GsQG-vLG6Mg

blade01:phung #  lvcreate  -L68G -n lil_cheesy1_lv lil_cheesy1
Segmentation fault


-dan
