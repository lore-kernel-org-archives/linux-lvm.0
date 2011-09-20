Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8K8BAV4011022
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 04:11:10 -0400
Received: from mail1.dur1.host-h.net (mail1.dur1.host-h.net [196.7.18.227])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8K8B4g4027301
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2011 04:11:05 -0400
Received: from [196.7.147.49] (helo=[192.168.1.86])
	by mail1.dur1.host-h.net with esmtpa (Exim 4.72)
	(envelope-from <brentgclarklist@gmail.com>) id 1R5vPx-00007q-Ow
	for linux-lvm@redhat.com; Tue, 20 Sep 2011 10:11:02 +0200
Message-ID: <4E784A95.8060709@gmail.com>
Date: Tue, 20 Sep 2011 10:11:01 +0200
From: Brent Clark <brentgclarklist@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Debian 64bit get a "Volume vg0 not found" message
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hiya

Im wondering if someone could help share some light or a particular problem im struggling with.

Here where I work, we make use of pxe to boot and install our servers (32 bit), Im now trying to build a 64bit. On boot, after grub, the kernel loads and it leads to a message of

Volume vg0 not found.

And then just defaults to busybox.

I mounted, and chrooted, and from all that I can see ... all looks good (checked /etc/fstab and in grub.cfg I see 'insmod lvm').
I cant see what I may and am missing.

If someone would be so kind as to help and share some pointers it would be appreciated.

Kind Regards
Brent Clark
