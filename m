Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB23dnr05768
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 22:39:49 -0500
Received: from elm2a.cns.ohiou.edu (tornado.cns.ohiou.edu [132.235.51.185])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB23dmME016515
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 22:39:48 -0500
Date: Wed, 01 Dec 2004 22:39:36 -0500
From: Tim Hibbard <hibbard@ohio.edu>
Message-ID: <1101958776.41ae8e789ded6@elm2a.cns.ohiou.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and umount strangeness
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
To: linux-lvm@redhat.com

I am having a weird problem and do not know if it is an LVM or umount problem. 
I have an lvm volume on /dev/lvm/disks which mount to /home.  When I try to
umount the /dev/lvm/disks I get an error.  However umount /home works fine.

I try to do a umount /dev/lvm/disks I get a message "umount: /dev/lvm/disks: not
mounted" (even though it is).  I would normally have no problem with "umount
/home" except this is the redhat cluster software which always tries to do
umount /dev/lvm/disks resulting in a failure.

Kernel linux-2.4.27
mount-2.11z

Thanks in advance

Tim Hibbard
