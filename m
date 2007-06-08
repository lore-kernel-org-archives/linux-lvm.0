Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l58FPIX3025335
	for <linux-lvm@redhat.com>; Fri, 8 Jun 2007 11:25:18 -0400
Received: from ureach.com (mail31.ureach.com [63.236.74.67])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l58FOVbc021450
	for <linux-lvm@redhat.com>; Fri, 8 Jun 2007 11:24:31 -0400
Received: from www22.ureach.com (www22.ureach.com [172.16.2.50])
	by ureach.com (8.13.6/8.13.6) with ESMTP id l58FOPCt006649
	for <linux-lvm@redhat.com>; Fri, 8 Jun 2007 11:24:25 -0400
Date: Fri, 8 Jun 2007 11:24:25 -0400
Message-Id: <200706081524.LAA14129@www22.ureach.com>
From: Daniel Matters <matters12@ureach.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvmcreate_initrd problem
Reply-To: matters12@ureach.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

Im having trouble create initrd using lvmcreate_initrd when
mounting root lvm, and /boot ext3 and all other lvm
(usr,var,opt,home) from slack 11dvd

Heres the log:

lvmcreate_initrd 2.6.18

lvmcreate_initrd -- make LVM initial ram disk
/boot/initrd-lvm-2.6.18.gz

lvmcreate_initrd -- finding required shared libraries
lvmcreate_initrd -- stripping shared libraries
cp: cannot stat `(0xffffe000)': No such file or directory
lvmcreate_initrd -- ERROR copying shared library (0xffffe000) go
ram disk


Wondering where is the problem, and what means
cp: cannot stat `(0xffffe000)': No such file or directory ?


________________________________________________
Get your own "800" number
Voicemail, fax, email, and a lot more
http://www.ureach.com/reg/tag
