Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4J8B2vl020050
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 04:11:02 -0400
Received: from gruber.hi.inet (31.Red-213-96-98.staticIP.rima-tde.net
	[213.96.98.31])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m4J8AbLI003729
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 04:10:38 -0400
Message-ID: <483135CF.1080809@gfi-info.com>
Date: Mon, 19 May 2008 10:09:51 +0200
From: =?ISO-8859-1?Q?Raquel_Real_L=F3pez?= <rreal@gfi-info.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Kernel panic - not syncing: No init found. Try passing
 init= option to,kernel
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


Hello!

I have got  a RedHat 3 Update 6 system. The system has a hard disk It's 
partitioned like:
/dev/sda1 /boot Linux
/dev/sda2 LVM
    /dev/disk1Vol/rootvol /
    /dev/disk1Vol/export /export
    /dev/disk1Vol/softw /softw

The system was booted and it didn't start again.
The message was:
vgscan  ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "disk1Vol" from physical volume

And then:

Kernel panic - not syncing: No init found. Try passing init= option to
kernel.

If I boot with a rescue disk and I type "lvdisplay", LV UUID is 
"000000-00....".

How can I recover the system?

Thanks in advance
I
