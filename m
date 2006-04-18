Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3IFCaU0027546
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 11:12:36 -0400
Received: from virt.isg.si (virt.isg.si [213.157.224.197])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3IFCOLU005980
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 11:12:30 -0400
Received: from localhost (gosak [127.0.0.1])
	by virt.isg.si (Postfix) with ESMTP id 79A60C12EA
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 17:12:23 +0200 (CEST)
Received: from virt.isg.si ([127.0.0.1])
	by localhost (virt.isg.si [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 15659-12 for <linux-lvm@redhat.com>;
	Tue, 18 Apr 2006 17:12:22 +0200 (CEST)
Received: from [10.30.0.234] (fwCluster.isg.si [213.157.224.200])
	by virt.isg.si (Postfix) with ESMTP id ADCF9A3DBD
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 17:12:22 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Transfer-Encoding: 7bit
Message-Id: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>
From: Martin Gombac <martin@isg.si>
Date: Tue, 18 Apr 2006 17:12:21 +0200
Subject: [linux-lvm] physical volume smaller than partition?
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hi there.

i just did pvcreate on this partition:
sda4	Primary	Linux LVM 	298067.70MB=291.08..GB (from cfdisk)

like this:
levinja ~ # pvcreate /dev/sda4
   Physical volume "/dev/sda4" successfully created

then i took a look at it's size:
levinja ~ # pvdisplay
   --- NEW Physical volume ---
   PV Name               /dev/sda4
   VG Name
   PV Size               277.60 GB
   Allocatable           NO
   PE Size (KByte)       0
   Total PE              0
   Free PE               0
   Allocated PE          0
   PV UUID               Sek0cg-xmPI-xQml-9JE1-19VQ-Ht8I-P4PSEk

and noticed 277.60 GB != 291.08..GB. So my question is where did the  
rest of disk space went to?

Thanx for reply.
Martin
