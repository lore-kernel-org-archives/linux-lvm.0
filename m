Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA5JFir21331
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 14:15:44 -0500
Received: from storix.com ([206.71.178.18])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA5JFPZ2027451
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 14:15:26 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 16D04158F2
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2004 10:01:01 -0800 (PST)
From: rich turner <rich@storix.com>
Message-Id: <1099678572.3681.88.camel@rich>
Mime-Version: 1.0
Date: Fri, 05 Nov 2004 10:16:13 -0800
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unable to create physical volume
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

i am using 4 etherdrives that are block devices and present in the /dev
directory as:
brw-rw----  1 root root 152,  0 Nov  5 16:34 /dev/etherd/e0.0
brw-rw----  1 root root 152, 16 Nov  5 16:34 /dev/etherd/e0.1
brw-rw----  1 root root 152, 32 Nov  5 16:34 /dev/etherd/e0.2
brw-rw----  1 root root 152, 48 Nov  5 16:34 /dev/etherd/e0.3

when i try to create a physical volume out of one of them:
[root@redhat proc]# pvcreate /dev/etherd/e0.1
  /dev/etherd/e0.1: Couldn't find device.

when i scan for available disks with "lvmdiskscan" these disks do not
display.

it looks like a filter problem within lvm.conf but i have made some
changes and it doesnt seem to work. these are the lines in my lvm.conf
file that i believe are responsible for finding block devices:
scan = [ "/dev" ]
filter = [ "a/.*/" ] (all other filters are commented out)

not sure if it helps but in /sys/block i can see entries like this:
[root@redhat block]# ls -l /sys/block/etherd\!e0.0/
total 0
-r--r--r--  1 root root 4096 Nov  5 16:35 dev
drwxr-xr-x  3 root root    0 Nov  5 16:35 queue
-r--r--r--  1 root root 4096 Nov  5 16:35 range
-r--r--r--  1 root root 4096 Nov  5 16:35 size
-r--r--r--  1 root root 4096 Nov  5 16:35 stat
