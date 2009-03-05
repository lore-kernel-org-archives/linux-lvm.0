Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n25FrRm5001591
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 10:53:27 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.169])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n25FrANj032395
	for <linux-lvm@redhat.com>; Thu, 5 Mar 2009 10:53:11 -0500
Received: by wf-out-1314.google.com with SMTP id 25so4164284wfc.6
	for <linux-lvm@redhat.com>; Thu, 05 Mar 2009 07:53:10 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 5 Mar 2009 21:23:10 +0530
Message-ID: <ffa0f8300903050753q6dc7c47bx6302d31d174a3dec@mail.gmail.com>
From: Tejas Sumant <tejas.sumant@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM partition type
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

Hi there,

I created a physical volume using pvcreate command on /dev/sda. When I
checked the partition entries in MBR for /dev/sda using fdisk observed
that no partitions were displayed.

Why pvcreate doesnt make partition entry with type 8e in MBR? Which
partition entry gets used in case whole disk is made PV?

-- 
Tejas Sumant
