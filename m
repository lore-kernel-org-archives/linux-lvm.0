Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8DJfur09394
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 15:41:56 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8DJfsrg030656
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 15:41:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id A8C123E8B9
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 15:35:09 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31779-08 for <linux-lvm@redhat.com>;
	Mon, 13 Sep 2004 15:35:07 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 2C8C23E8EA
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 15:35:07 -0400 (EDT)
Message-ID: <4145F7F9.2080307@m-cam.com>
Date: Mon, 13 Sep 2004 15:41:45 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] stripe pair
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
To: LVM <linux-lvm@redhat.com>

Hi,

I have 4 disks that I would like to put into a single volume group, then 
use it to create one big logical volume. I would like the lv to use 
striping. Ideally I would like to stripe across /dev/hda and /dev/hdc, 
and /dev/hdb and /dev/hdd, cause each pair then would be on different 
IDE buses. Is there a way to ensure such a striping pattern? Thanks in 
advance.


Arshavir
