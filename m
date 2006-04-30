Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3U7U8Xp002709
	for <linux-lvm@redhat.com>; Sun, 30 Apr 2006 03:30:08 -0400
Received: from ns1.ballihost.com (ns1.ballihost.com [69.57.158.65])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k3U7U0MW015007
	for <linux-lvm@redhat.com>; Sun, 30 Apr 2006 03:30:01 -0400
Message-ID: <1282.85.107.14.146.1146382053.squirrel@85.107.14.146>
Date: Sun, 30 Apr 2006 10:27:33 +0300 (EEST)
From: "Omer Faruk Sen" <omer@faruk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] realtime snapshot or ?
Reply-To: omer@faruk.net,
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
To: linux-lvm@redhat.com


Hi,

I am looking for a solution that I can use as a realtime snapshot or maybe
it should be called realtime raid or whatever.

What I want is like this:

Say I have a VG1 and VG2. I use VG2 as a backup VG2  and some machines
will mount it as read-only( I mean LV2 on VG2) My main server (which runs
mysql and all write operations will go to LV1) will run mysql and use 
/sql as its --data-dir. /sql uses /dev/VG1/LV1. But every write operations
on LV1 that resides on VG1 should go to VG2 thus to LV2 too.

I have found that nbd ord drbd does similar things. But nbd just exports a
block device (JUST ONE block device) so other machines can mount it. DRBD
is closer to what I want but I can't mount drbd on secondary (backup
machine) even as read-only



To depict what I want
                            rw
|SERVER1| ----> MYSQL DATA ---->    | REMOTE STORAGE | VG1/LV1
                           |
                           |--->    | REMOTE STORAGE | VG2/LV2 --|
                             rw                                  |
                                                                 |
                                                                 |
                                                             ro  |
                                   /backupsql/--- |SERVER2|   <--|






-- 
Omer Faruk Sen
http://www.faruk.net
