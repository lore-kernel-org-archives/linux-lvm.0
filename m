Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SDf5V06256
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 09:41:05 -0400
Received: from se1-3-0.cr1.dp.ukrtel.net (se1-3-0.cr1.dp.ukrtel.net
	[195.5.61.161])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SDeqEJ014164
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 09:40:57 -0400
Message-ID: <4311BBDD.3070105@tpway.com>
Date: Sun, 28 Aug 2005 16:27:57 +0300
From: Andrew Kornilov <hiddenman@tpway.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] shared scsi, external storage, vtrack
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

Hi all.

I have two identical servers with CentOS (aka RHEL4.1) and one external 
data storage Vtrak 8110 
(http://www.promise.com/product/product_detail_eng.asp?segment=VTrak&product_id=135) 
which connected by two scsi cables to this servers. I need to setup 
something called "shared scsi" but i haven't any experience with such 
things. My main task is build HA system (Vtrak used for postgresql 
databases). Can anybody help me with docs, HOWTOs and other?
