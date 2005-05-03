Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j436bpO24830
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 02:37:51 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j436bjAo007252
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 02:37:45 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:ANHS3Vu3Bsh2vvMme3FIkb2fFMNNEP1Q@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j436bhqt005414
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 02:37:43 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:Al0WIu0kQKM6M5C4B8f5GBWeFlZylcOL@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j436bhMl027526
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 02:37:43 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j436bgvI027522
	for <linux-lvm@redhat.com>; Tue, 3 May 2005 02:37:43 -0400
Date: Tue, 3 May 2005 02:37:42 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0505030212030.27177-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Shared library liblvm2clusterlock.so does not contain
 locking functions
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
To: linux-lvm@redhat.com

Hello,

I'm trying to create my PV, and I get this:

LVM2 # pvcreate 
  Shared library liblvm2clusterlock.so does not contain locking functions
  Locking type 2 initialisation failed.

I orginially followed instructions from the GFS wiki, though the 
LVM howto hasn't helped either.  I started from the LVM2 sources
checked out from cvs HEAD.  is there a more stable branch?

also...there isn't a patch dir in the LVM2 checkout...so I don't have 
lvm-mod in the kernel running, so that may be the problem.  Is there
a lvm2-mod?

-dan

-- 
