Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2FHEgad026811
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 13:14:42 -0400
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2FHEdBF032568
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 13:14:41 -0400
Received: by ladw1 with SMTP id w1so22902287lad.0
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 10:14:39 -0700 (PDT)
Received: from opensuse.site (ppp91-76-14-38.pppoe.mtu-net.ru. [91.76.14.38])
	by mx.google.com with ESMTPSA id
	ei4sm1665478lad.31.2015.03.15.10.14.37 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 10:14:38 -0700 (PDT)
Date: Sun, 15 Mar 2015 20:14:36 +0300
From: Andrei Borzenkov <arvidjaar@gmail.com>
Message-ID: <20150315201436.30777072@opensuse.site>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM miscalculates bitmap size for RAID1 and small extent
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Using lvm2-2.02.98-43.17.1 in openSUSE 13.2

bor@opensuse:~/src/lvm2> dd if=/dev/zero of=/tmp/sparse2 bs=1 count=1 seek=100M
bor@opensuse:~/src/lvm2> dd if=/dev/zero of=/tmp/sparse1 bs=1 count=1 seek=100M
bor@opensuse:~/src/lvm2> sudo losetup -f --show /tmp/sparse1
/dev/loop0
bor@opensuse:~/src/lvm2> sudo losetup -f --show /tmp/sparse2
/dev/loop1
bor@opensuse:~/src/lvm2> sudo pvcreate /dev/loop0
bor@opensuse:~/src/lvm2> sudo pvcreate /dev/loop1
bor@opensuse:~/src/lvm2> sudo vgcreate -s 1k x_test /dev/loop0 /dev/loop1
bor@opensuse:~/src/lvm2> sudo lvcreate -n r1 -L 80m x_test -m 1 

Kernel messages

мар 15 20:06:45 opensuse.site sudo[4320]: bor : TTY=pts/1 ; PWD=/home/bor/src/lvm2 ; USER=root ; COMMAND=/sbin/lvcreate -n r1 -L 80m x_test -m 1
мар 15 20:06:45 opensuse.site kernel: device-mapper: raid: Superblocks created for new array
мар 15 20:06:45 opensuse.site kernel: md/raid1:mdX: not clean -- starting background reconstruction
мар 15 20:06:45 opensuse.site kernel: md/raid1:mdX: active with 2 out of 2 mirrors
мар 15 20:06:45 opensuse.site kernel: Choosing daemon_sleep default (5 sec)
мар 15 20:06:45 opensuse.site kernel: created bitmap (1 pages) for device mdX
мар 15 20:06:45 opensuse.site kernel: attempt to access beyond end of device
мар 15 20:06:45 opensuse.site kernel: dm-7: rw=7185, want=9, limit=2

Individual constituents

bor@opensuse:~/src/lvm2> sudo dmsetup table x_test-r1_rimage_1
0 163840 linear 7:1 2050
bor@opensuse:~/src/lvm2> sudo dmsetup table x_test-r1_rimage_0
0 163840 linear 7:0 2050
bor@opensuse:~/src/lvm2> sudo dmsetup table x_test-r1_rmeta_1
0 2 linear 7:1 2048
bor@opensuse:~/src/lvm2> sudo dmsetup table x_test-r1_rmeta_0
0 2 linear 7:0 2048


Is it known problem? I could not find anything obvious in commit log.
