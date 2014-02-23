Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1NMaagx014076
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 17:36:36 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1NMaX3b020798
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 17:36:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 2CCC8200421
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 23:36:32 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id GT5dLKya2wpy for <linux-lvm@redhat.com>;
	Sun, 23 Feb 2014 23:36:32 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id CACE920041F
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 23:36:31 +0100 (CET)
Message-ID: <530A77EC.5090900@mglug.de>
Date: Sun, 23 Feb 2014 23:36:28 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unwanted autocreation of /dev/mapper/ entries while
 using parted on lvm devices
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi List,

Im not sure, if the udev-rules of lvm is creating this. Im Using Ubuntu
12.04.4 + lvm git yesterday, compiles with --enable-udev_sync
--enable-udev_rules. Here my testing results:


root@dmicrash\:rules.d# vgcreate myvg /dev/sdc1 /dev/sdd1
  Volume group "myvg" successfully created
root@dmicrash\:rules.d# lvcreate --name test --size 20G myvg
  Logical volume "test" created
root@dmicrash\:rules.d# parted /dev/myvg/test mklabel msdos

root@dmicrash\:rules.d# parted /dev/myvg/test mkpart primary  0% 40%
     
root@dmicrash\:rules.d# ls /dev/mapper/
control  myvg-test  myvg-test1

The device myvg-test1 was created automatically (normally this is done
by kpartx?). I disabled gnome-automounter, didnt help.

I tried to monitor this with udevadm --monitor, but i didnt get
displayed the rule-file who did this.

Any hints?

Tfh!
Oliver
