Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6N8rca30164
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 04:53:38 -0400
Received: from sbbmail1.sbb.ch (sbbmail1.sbb.ch [193.192.251.19])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6N8rWXn019693
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 04:53:32 -0400
Received: from intmail2.sbb.ch (intmail2.sbb.ch [10.104.85.251])
	by sbbmail1.sbb.ch (Switch-3.1.6/Switch-3.1.0) with ESMTP id
	i6N8rLHF005762
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 10:53:21 +0200
Received: from gmx.net (i34390.sbb.ch [147.78.17.245])
	by intmail2.sbb.ch (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	i6N8rKmH002348
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 10:53:20 +0200
Message-ID: <4100D1DD.953FD20A@gmx.net>
Date: Fri, 23 Jul 2004 10:52:45 +0200
From: Thomas Meller <thomas.meller@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] SAN Storage/mirror/lvm
Reply-To: thomas.meller@gmx.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Maybe everything is all right with what I am doing - maybe not.

I have heard roumors that my setup may cause troubles.
Does anybody know something about it?

I try to set up a cluster on a SAN with shared disks, mirrored over 2 storage controllers.

Using QLogic HBAs, I have set
ql2xfailover=1
to use the multipathing feature.

We have 2 separate fabrics to connect to the storage and 2 HBAs in each machine.

Disk layout:

A           B   (controllers)
sda        sdf
sdb        sdg
sdc mirror sdh -+
sdd mirror sdi  |
sde mirror sdj -+
                |
                +-- volume group

Also, we do not have much write thruput to the disks.
I use reiserfs because I could resize it w/o remounting.

Austin Gonyou has written something about write cache mirroring - what is that?
Necessary?
Howto?
I use LVM1

Am I in danger?

Thanks

Thomas

-- 
Thomas Meller
mailto: thomas.meller@t-systems.ch
mailto: thomas.meller@gmx.net
----
...Our continuing mission: To seek out knowledge of C, to explore strange
UNIX commands, and to boldly code where no man page has ever been seen
