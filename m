Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56G8gO29184
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:08:42 -0400
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j56G8Wdg007345
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:08:36 -0400
Received: from rich (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 1995A158ED
	for <linux-lvm@redhat.com>; Mon,  6 Jun 2005 09:02:15 -0700 (PDT)
From: rich turner <rich@storix.com>
Date: Mon, 06 Jun 2005 09:13:14 -0700
Message-Id: <1118074394.4482.2.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] grub and lvm
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
To: LVM general discussion and development <linux-lvm@redhat.com>

i have a volume group built on a physical volume that is the
disk /dev/hdb. when i write the grub bootloader to that disk, it appears
that the bootloader overwrites part or all of the lvm data on that disk,
essentially wiping out my volume group. does anyone know if that is
normal or if lvm and grub indeed share the same place on the disk?
