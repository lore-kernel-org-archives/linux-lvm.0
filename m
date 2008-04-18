Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3IETWYm003628
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 10:29:32 -0400
Received: from tietoe03.tietoenator.com (datnt07.tieto.com [194.110.47.24])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3IET8IK008754
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 10:29:08 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 18 Apr 2008 16:29:06 +0200
Message-ID: <FFD83F5BFE8FFB43BFD05446E63D90AC127614DC@maserati.eu.tieto.com>
From: <Anders.Strandberg@tietoenator.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lvm backup/restore
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

Hi,

I have scenario where I have defined a PV and a VG covering a whole
physical disk. I have defined two logical volumes in this VG and used
them for installing Xen guest domains. Due to some initial problems I
need to start over again, which means a I have to scratch the whole disk
to erase all partition information and create  new PV,VG and LV:s.  I
would like to be able to restore the data from the LV:s to the new disk
and run the Xen guests as before.

Is there a way of backing up the LV:s and restore them to the disk
without losing any information?


Thanks,
Anders
