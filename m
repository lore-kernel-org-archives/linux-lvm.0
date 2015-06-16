Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5GEUA6m025679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2015 10:30:11 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 2FAF2372502
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2015 14:30:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Z4rsK-0002CG-0V
	for linux-lvm@redhat.com; Tue, 16 Jun 2015 16:30:04 +0200
Received: from server.vandervlis.nl ([82.95.148.152])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2015 16:30:03 +0200
Received: from paul by server.vandervlis.nl with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2015 16:30:03 +0200
From: Paul van der Vlis <paul@vandervlis.nl>
Date: Tue, 16 Jun 2015 16:27:50 +0200
Message-ID: <mlpbp6$nlo$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Boot problems
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
To: linux-lvm@redhat.com

Hello,

I boot my virtal machines from LVM and one of them has boot problems.

Sometimes it boots fine, but 3 out of 4 times I see systemd messages
about start jobs. After some timeouts I see:

(1 of 2) A start job is running for Activation of LV... 9s / no limit)

Because everything is on LVM I think the problem is the activation of LVM.

I have 2 more virtual machines made from the same image, so very
identical. But they don't have problems. The libivirt, grub, and LVM
configuration is identical.

It are KVM/Qemu virtual machines with qcow2 images.
The host is Debian7, so a bit old. The guests are Debian8.

Any ideas how to debug this problem?

With regards,
Paul van der Vlis.


-- 
Paul van der Vlis Linux systeembeheer Groningen
https://www.vandervlis.nl/
