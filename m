Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i59MKQ010825
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 18:20:26 -0400
Received: from mail.cs.utexas.edu (root@mail.cs.utexas.edu [128.83.139.10])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i59MKQi5006494
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 18:20:26 -0400
Received: from monet.cs.utexas.edu (nav@monet.cs.utexas.edu [128.83.144.138])
	by mail.cs.utexas.edu (8.12.11/8.12.11) with ESMTP id i59MKPnO005838
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 17:20:25 -0500 (CDT)
Date: Wed, 9 Jun 2004 17:20:25 -0500 (CDT)
From: Navendu Jain <nav@cs.utexas.edu>
Message-ID: <Pine.LNX.4.58.0406091719520.3739@monet.cs.utexas.edu>
MIME-Version: 1.0
Subject: [linux-lvm] snapshot implementation
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I am looking for a documentation/HOW-TO/tech report explaining the
implementation of the snapshots feature in LVM1/LVM2 source. I couldn't
find much related info on snapshot internals in the mailing-list archive.

Also, a related question is if there are in-built methods of comparing two
snapshots of the same logical volume ?

Thanks,
Navendu
