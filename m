Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1E66Zi03495
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 01:06:35 -0500
Received: from ecstasy.winternet.com (CPE-65-25-248-192.mn.rr.com [65.25.248.192])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1E66Yb31405
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 01:06:34 -0500
Message-Id: <200402140615.i1E6Fbr03401@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
Subject: [linux-lvm] LVM 1: Snapshot causes seg fault of lvdisplay and crashes system
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 14 01:05:00 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I did the following to create a snapshot of an active filesystem to try
to make a consistent copy of it:

# lvcreate --extents 30 --snapshot --name home2snap /dev/sys/home2gb
...
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/sys/home\
2snap"
lvcreate -- doing automatic backup of "sys"
lvcreate -- logical volume "/dev/sys/home2snap" successfully created

# lvdisplay /dev/sys/home2gb
--- Logical volume ---
LV Name                /dev/sys/home2gb
VG Name                sys
LV Write Access        read/write
LV snapshot status     source of
                       /dev/sys/home2snap [active]
Segmentation fault
# lvdisplay /dev/sys/home2gb
--- Logical volume ---
LV Name                /dev/sys/home2gb
VG Name                sys
LV Write Access        read/write
LV snapshot status     source of
                       /dev/sys/home2snap [active]
Segmentation fault
ecstasy:/#

<At this point I lost my remote connection to the machine and presume it
crashed; it probably didn't reboot, since subsequent attempts to
reconnect via ssh failed and ping failed as well.>

The kernel is probably 1.0.3 (Debian SPARC sun4u 2.4.21 up) and the lvm
tools are 1.0.8.

Any suggestions for avoiding these seg faults and the system crash?

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
