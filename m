Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1LKamK07929
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 15:36:48 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1LKagrs021333
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 15:36:42 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 9261B158DE
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 12:09:57 -0800 (PST)
From: rich turner <rich@storix.com>
Message-Id: <1109018274.4532.14.camel@rich>
Mime-Version: 1.0
Date: Mon, 21 Feb 2005 12:37:54 -0800
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] bootloader questions
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

if i have root(/) on a logical volume, is it required that i have /boot
on a separate filesystem? does /boot have to be a partition?

the boot loaders i need to support are lilo and grub. do the answers to
the above question vary if i use lilo or grub?

thanks for the help
