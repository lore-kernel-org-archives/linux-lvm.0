Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LA3Rp26106
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 06:03:27 -0400
Received: from beijing.raidtec.cn ([61.242.91.103])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LA3OMc004544
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 06:03:26 -0400
Received: from sina.com (unknown [192.168.123.184])
	by beijing.raidtec.cn (Postfix) with ESMTP id 2A46234E06
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 17:55:22 +0800 (CST)
Message-ID: <408646E5.4010701@sina.com>
Date: Wed, 21 Apr 2004 18:03:17 +0800
From: more <more0401@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM_LOCK problem?
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

Hi, LVM guys,

 

Now I am using LVM1.03 in Linux 2.4 kernel. One day I run lvcreate and 
lvextend at the same time and the two programs dead locked. When I read 
the source and I find each program such as lvcreate and lvextend does 
not verify the return value of LVM_LOCK. I guess this causes the dead 
locked problem, is my guess right? Can anyone give me suggestion to 
avoid such dead lock case?

 

 

Regards,

more
