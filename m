Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E11C9179DD
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 04:21:47 +0000 (UTC)
Received: from omr-m008e.mx.aol.com (omr-m008e.mx.aol.com [204.29.186.7])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FCA9C056800
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 04:21:46 +0000 (UTC)
Received: from mtaout-mcc02.mx.aol.com (mtaout-mcc02.mx.aol.com
	[172.26.253.78])
	by omr-m008e.mx.aol.com (Outbound Mail Relay) with ESMTP id
	0BCB1380006A
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 00:21:45 -0400 (EDT)
Received: from [192.168.1.4] (0x5b3139322e3136382e312e345d [47.187.81.180])
	by mtaout-mcc02.mx.aol.com (MUA/Third Party Client Interface) with
	ESMTPA id B3FC138000084
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 00:21:44 -0400 (EDT)
From: Leroy Tennison <leroy.tennison@verizon.net>
Message-ID: <5400c013-1c97-c316-6ab7-4c3e1a55140f@verizon.net>
Date: Tue, 25 Apr 2017 23:21:37 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Proper way to remove a qemu-nbd-mounted volume using lvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I either haven't searched for the right thing or the web doesn't contain 
the answer.

I have used the following to mount an image and now I need to know the 
proper way to reverse the process.

     qemu-nbd -c /dev/nbd0 <qcow2 image using lvm>

     vgscan --cache    (had to use --cache to get the qemu-nbd volume to 
be recognized, lvmetad is running)

     vgchange -ay

     lvdisplay

     mount <selected qemu-nbd related 'LV Path' found from lvdisplay 
above> <mount point>

I made the changes I needed to make and have done the following:

     umount <mount point>

     lvchange -an <all qemu-nbd related 'LV Path's found from lvdisplay 
above>

     vgchange -an <qemu-nbd related volume>

Now what?  How do I get the volume out of the list so I can use 
'qemu-nbd -d /dev/nbd0' to dis-associate the image with /dev/nbd0?  
vgreduce seems to be for volumes which have multiple underlying 
devices.  I started to use vgremove but, when it started prompting for 
confirmation about removing logical volumes, I wasn't sure exactly what 
it was going to do and responded 'no'.

If there is a web reference explaining this specific situation just 
point me to it - I'm not opposed to reading.  Thanks for the help.
