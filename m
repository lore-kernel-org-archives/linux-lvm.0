Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j120HeO07962
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 19:17:40 -0500
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j120Hcxq002539
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 19:17:38 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id 113F23E8F1
	for <linux-lvm@redhat.com>; Tue,  1 Feb 2005 18:24:55 -0500 (EST)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05526-02 for <linux-lvm@redhat.com>;
	Tue,  1 Feb 2005 18:24:52 -0500 (EST)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 7099C3E8F0
	for <linux-lvm@redhat.com>; Tue,  1 Feb 2005 18:24:52 -0500 (EST)
Message-ID: <42000F5E.7020400@m-cam.com>
Date: Tue, 01 Feb 2005 18:23:10 -0500
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] reducing lv
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

Hi,

I have a very large LV across 4 pv-s (2 disks - /dev/hdb, /dev/hdd + 2 
partitions on different sisks - /dev/hda2, /dev/hdc2).
Is there any way to determine how the data on the lv is stored and 
whether it would be possible to consolidate the data on 1 disk + 2 
partitions (/dev/hdb, /dev/hda2, /dev/hdc2) and replace the other disk 
(/dev/hdd).
I am running Reiserfs.

Thanks for any pointer on how to do this.



Arshavir
