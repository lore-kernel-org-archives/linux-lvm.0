Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8T6INr12932
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 02:18:23 -0400
Received: from geeksite.geeksite.org (ibz.geeksite.org [63.227.242.54])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8T6IM0p020682
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 02:18:23 -0400
Received: from localhost (unknown [127.0.0.1])
	by geeksite.geeksite.org (Postfix) with ESMTP id 9A6AB131598
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 00:21:52 -0600 (MDT)
Received: from geeksite.geeksite.org ([127.0.0.1])
	by localhost (geeksite [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 10738-04 for <linux-lvm@redhat.com>;
	Wed, 29 Sep 2004 00:21:49 -0600 (MDT)
Received: from [192.168.0.4] (xscott.theserrs.net [63.227.243.149])
	by geeksite.geeksite.org (Postfix) with ESMTP id 6A99E118803
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 00:21:49 -0600 (MDT)
Message-ID: <415A53B4.60001@theserrs.net>
Date: Wed, 29 Sep 2004 00:18:28 -0600
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove unable to move extents to multiple smaller pvs
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

I'm trying to use pvmove to shuffle things around.  I have a pv with 
22375 extents which I would like to remove from the system.  I've added 
two (2) pvs with 11194 extents each.  I get an error message:

Insufficient contiguous allocatable extents (11194) for logical volume 
pvmove0: 22375 required
Allocation for temporary pvmove LV

Now before you say, don't make it contiguous... It seems that it isn't 
already.

# lvchange --contiguous n /dev/data_vg/data_lv
Allocation policy of logical volume "data_lv" is already not contiguous

Is this normal?  Do I really need all that contiguous space on 1 pv?

Thanks in advance,
Scott Serr
