Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8REE1r08744
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 10:14:01 -0400
Message-ID: <20040927141349.70317.qmail@web40622.mail.yahoo.com>
Date: Mon, 27 Sep 2004 07:13:49 -0700 (PDT)
From: Mr Joe Zagar <jrzagar@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Urgent LVM recovery question...
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: zagar@arlut.utexas.edu, mebrown@arlut.utexas.edu

RedHat 9 2.4.20-31.9

I have a volume group on /dev/sda1 that isn't being
recognized at boot time.  I tried doing a

  vgcfgrestore -n vg00 /dev/sda1

but it replied that there was no physical volume
information on /dev/sda1.

The hardware raid array says there are no physical
problems with any of the disks, so it's not a disk
failure...

Is it safe to do a "pvcreate /dev/sda1" on disks that
contain data?




		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 
