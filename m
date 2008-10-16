Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9G9AGbS002214
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 05:10:16 -0400
Received: from mtaout7.012.net.il (mtaout7.012.net.il [84.95.2.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9G99mVs008405
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 05:09:48 -0400
Received: from ip6-localhost ([77.125.145.193]) by i-mtaout7.012.net.il
	(HyperSendmail v2007.08) with ESMTPA id
	<0K8T00I6WQUC4PD0@i-mtaout7.012.net.il> for
	linux-lvm@redhat.com; Thu, 16 Oct 2008 11:11:01 +0200 (IST)
Received: from localhost ([127.0.0.1] helo=dovidhalevi.homelinux.net)	by
	ip6-localhost with esmtp (Exim 4.69)	(envelope-from
	<d_baron@012.net.il>)	id 1KqOrV-0003cN-Kv	for
	linux-lvm@redhat.com; Thu, 16 Oct 2008 11:09:41 +0200
Date: Thu, 16 Oct 2008 11:09:35 +0200
From: David Baron <d_baron@012.net.il>
Message-id: <200810161109.37242.d_baron@012.net.il>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] New to LVM
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

Looks very good, but have a few questions before setting up that disk:

1. Realttime patch kernels -- use with these, io performance hit for audio 
work?

2. LV for /? LV_ROOT--Ok to do this? Avoid it? OK if device mapper compiled in 
kernel (I do not use an initrd)?

3. Changes to /etc/fstab look straightforward. Changes to lilo.conf (yes, 
there are those of us who have not switched to grub)?

4. If I leave / as regular partition, how big should this be (containing /lib, 
/bin, /sbin, /etc, etc.)? Boot on this or separate or does it matter?

5. I will create all this on by hdd, copy everything into the fileystems from 
my current hdb and then move the hdd to the hdb slot. Docs say this is OK (and 
imply that I could even try it out booting from the old hdb  /boot). True?
