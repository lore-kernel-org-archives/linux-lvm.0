Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9G00Br29081
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 20:00:11 -0400
Received: from cloud.atmos.ucla.edu (cloud.atmos.ucla.edu [128.97.77.46])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9G0053t028197
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 20:00:05 -0400
Message-ID: <41706483.8080409@gmx.net>
Date: Fri, 15 Oct 2004 17:00:03 -0700
From: langelino <langelino@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Missing volume group device
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

Hi,
I like to change the size of one of my logical volumes but the volume
group device is missing:

[root]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vg01" using metadata type lvm2
[root]# lvscan
  ACTIVE            '/dev/vg01/slow' [242.77 GB] inherit
  ACTIVE            '/dev/vg01/usr' [3.91 GB] inherit
  ACTIVE            '/dev/vg01/home' [5.86 GB] inherit
  ACTIVE            '/dev/vg01/tmp' [1000.00 MB] inherit

But:

[root]# ls -l /dev/vg*
ls: /dev/vg*: No such file or directory

I am running Mandrake 10.1:

[root]# uname -a
Linux xxx.xxx.xxx 2.6.8.1-10mdk #1 Wed Sep 8 17:00:52 CEST 2004 i686
Intel(R) Pentium(R) 4 CPU 2.40GHz unknown GNU/Linux


Any hints what to do?

Matt
