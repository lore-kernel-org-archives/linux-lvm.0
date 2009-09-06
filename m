Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n86GMOQ6026086
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 12:22:24 -0400
Received: from mail-fx0-f221.google.com (mail-fx0-f221.google.com
	[209.85.220.221])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n86GMDrX007509
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 12:22:14 -0400
Received: by fxm21 with SMTP id 21so1572748fxm.3
	for <linux-lvm@redhat.com>; Sun, 06 Sep 2009 09:22:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <36341C0C45B7054AA3F17AB74ED869EB1248D3C9@CDC-EXMBP3.ciber.cbr.inc>
References: <f4f537b50909030627i9117a53lbef23eddeb3a87e6@mail.gmail.com> 
	<36341C0C45B7054AA3F17AB74ED869EB1248D3C9@CDC-EXMBP3.ciber.cbr.inc>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Sun, 6 Sep 2009 11:21:53 -0500
Message-ID: <f4f537b50909060921u1f8d91eby7e7d013ac7967375@mail.gmail.com>
Subject: Re: [linux-lvm] vg availability during boot
Content-Transfer-Encoding: 8bit
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

> Did you rebuild initrd? During boot, initrd uses staticly linked modules to load what otherwise would be kernel modules. It does, if LVM is enabled, do a vgchange -y a as part of that process. Since LVM is part of the default initrd, it may be the drivers for your SAN that you need to get in place - remember to include the high-end Ethernet drivers too that your NAS (I presume?) uses.


Thank you, this seems to be exactly it, the new initrd does not have
correct qlogic modules.

-Eugene
