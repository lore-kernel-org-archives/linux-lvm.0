Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7PJP7305733
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 15:25:07 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7PJP27w019759
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 15:25:02 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id AB8A33E8EE
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 15:19:37 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04614-07 for <linux-lvm@redhat.com>;
	Wed, 25 Aug 2004 15:19:36 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id E89E83E8B9
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2004 15:19:35 -0400 (EDT)
Message-ID: <412CE781.9000409@m-cam.com>
Date: Wed, 25 Aug 2004 15:24:49 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] partition strategy
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

Hi,

This is my first post, so please bear with me.

I have 2 free disk areas 230G and 231G. I hoping to take advantage of 
RAID-0.

Is it better to create 3 partitions 2 x230G + 1G - create a striped LV 
over the first 2, then add the third to the volume group, then extend 
the LV over to the new 1G extension (since LVM2 allows extending striped 
lv-s). And if so, does the non-striped area get used as a last resort 
(after the striped area is completely full)?

OR

Is it better to create 2 paritions 230G and 231G, put both in a vg, 
create a striped lv and lvm will take care of striping to the 230G mark, 
then writing linearly afterwards.

TIA for any advice.



Best,

Arshavir
