Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2CK55127562
	for <linux-lvm@redhat.com>; Sun, 12 Mar 2006 15:05:05 -0500
Received: from perdition2.onetel.net.uk (perdition2.onetel.net.uk
	[212.67.120.105])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k2CK4xh5030036
	for <linux-lvm@redhat.com>; Sun, 12 Mar 2006 15:05:00 -0500
Date: Sun, 12 Mar 2006 20:04:05 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Message-ID: <20060312200405.GC8421@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] simultaneous use of different versions of lvm
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have another question (hopefully the last): I have different OS
running on the same machine, so they use the same VG/LV. (E. g. they
both mount the same /home being an LV.)

old OS: SuSE 7.2, kernel 2.4.4, lvm 1.0.1-rc2
new OS: SuSE 9.2, kernel 2.6.8, lvm 2.00.25

Everything is in lvm1-format. It seems to work. Are there any pitfalls I
ought to be aware of? Can I modify VG/LV from both OS's or would it be
better if I used one consistently to modify VG/LV?

A further complication is this: The old OS suffers from the 128GiB
(134GB) problem for accessing hard disks. What would happen, if I
created a VG on a PV which lies completely above the 128GiB limit? It
would obviously only be accessable from the new OS. But would it work? 
(I reckon yes, because the old OS wouldn't see any of it.)

And what if the PV was partly below and partly above the 128GiB limit?
The old OS would see part of it and then do what?

(Yes, I am aware that by using several VG, I lose some of the flexibility
of lvm. But I think I gain some safety for my data.)

Thanks for your help!

Gunther
