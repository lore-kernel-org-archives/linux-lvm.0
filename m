Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8Faur28347
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 10:36:56 -0500
Received: from e-liberty.pl (yh226.internetdsl.tpnet.pl [80.55.241.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8Fat47007175
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 10:36:55 -0500
Received: from [10.0.0.193] (aji238.internetdsl.tpnet.pl [83.16.242.238])
	by e-liberty.pl (Postfix) with ESMTP id 4A70442F7E
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 15:59:22 +0100 (CET)
Message-ID: <418F831B.5030500@e-liberty.pl>
Date: Mon, 08 Nov 2004 15:30:51 +0100
From: Piw <piw@e-liberty.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] xfs freeze nad snapshot problem
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello

I got following problem:
Trying to make snapshot of lv with xfs filesystem:
# xfs_freeze -f /data
# lvcreate -L20G --snapshot --name snap /dev/VG/LV

and system lock...

(kill -9 doesnt work)

I have to create another session and remowe lockup with:
# xfs_freeze -u /data

If I try to create snapshot without freezeng xfs, it works (bo no 
cohesion is guaranteed).

kernel: 2.6.9
lvm:	2.00.25
dm:	1.00.19

Anyone can help?
TIA

PS.
This problem is mentioned in:
http://www.netsys.com/suse-linux-e/2002/08/msg01933.html
but no sloution
--
Piw
