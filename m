Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0I2xN103298
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 21:59:23 -0500
Received: from mail.frii.com (phobos02.frii.net [216.17.128.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0I2xK0F015253
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 21:59:21 -0500
Received: from dad (host206-57.lpbroadband.net [66.54.206.57])
	by mail.frii.com (FRII) with ESMTP id 62C43A397D
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 19:59:15 -0700 (MST)
From: "Bret Mckee" <bretm@boneheads.us>
Date: Tue, 17 Jan 2006 19:59:11 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20060118025915.62C43A397D@mail.frii.com>
Subject: [linux-lvm] LVM Performance effects?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have set up a file server with LVM on top of RAID 5, and seem to be
having LVM related performance issue.

Interesting details:
-Processor:  Intel(R) Pentium(R) 4 CPU 2.80GHz with hyperthreading
-disks - 4 X Seagate 300 GB
  - 2 are SATA, connected to MB SATA connectors
  - 2 are PATA, connected to Promise add in card
- OS is centos 4.2
- uname -a -> Linux localhost.localdomain 2.6.9-22.ELsmp #1 SMP Sat
Oct 8 19:11:43 CDT 2005 i686 i686 i386 GNU/Linux
- all perf numbers obtained using time dd, and were ran 3 times.  Run
to run variance was within 1 second/run
- raid chunk size is 256k, file system block size is 4k, mke2fs was
done with stripe=64

I ran three tests, one to the raid device, one to the lvm device, one
through the file system.

raid device: 118.2 MB/s
lvm device: 49.43 MB/s
file system: 40.83 MB/s

I don't understand the LVM performance effect - I thougt LVM was a
pretty straight forward block remapper with negligible performance
impact. I'm stunned by the 58% performance penalty.

Any thoughts?  Any more data that would be helpful?

Thanks in advance,

Bret
---------------------

[root@localhost test]# time dd if=/dev/md1 of=/dev/null bs=1M
count=4096       
4096+0 records in
4096+0 records out

real    0m34.634s
user    0m0.021s
sys     0m13.467s


[root@localhost test]# time dd if=/dev/raid/mirror2 of=/dev/null bs=1M
count=4096
4096+0 records in
4096+0 records out

real    1m22.863s
user    0m0.021s
sys     0m14.384s

[root@localhost test]# time dd if=testfile of=/dev/null bs=1M
count=4096       
4096+0 records in
4096+0 records out

real    1m40.310s
user    0m0.020s
sys     0m9.996s
