Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2RMuji4006223
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 17:56:45 -0500
Received: from ms-smtp-03.nyroc.rr.com (ms-smtp-03.nyroc.rr.com [24.24.2.57])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2RMuX5p020396
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 17:56:34 -0500
Received: from dancampbell.org (cpe-24-195-214-80.nycap.res.rr.com
	[24.195.214.80])
	by ms-smtp-03.nyroc.rr.com (8.13.4/8.13.4) with ESMTP id k2RMuWp0003101
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 17:56:33 -0500 (EST)
Message-ID: <44286D9D.405@the-rusty-nail.com>
Date: Mon, 27 Mar 2006 17:56:29 -0500
From: Dan <lvm@the-rusty-nail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 with disks greater than 2TB
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

I have 24 - 500GB drives raided such that 11 drives + 1 hot spare per 
raid to get 4.54TB times 2.  I want to use LVM2 to make this into one 
~9TB disk, but when I create the partitions and do a df -h they show up 
as about 560GB each instead of 4.5TB each.  I do an fdisk -l and they 
show up correctly.  I am using Slackware 10.0.  I have device-mapper and 
LVM2 correctly installed.  I am obviously hitting a 2TB limit from what 
I have read, but does anyone know if it is possible to even do what I 
want?  If so, any suggestions on what I need to install to get this to 
work?  I am running the 2.6.15.4 kernel.  Thanks
