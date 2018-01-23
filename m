Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4658BA9B
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2018 17:34:51 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D4BE81DE4
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2018 17:34:48 +0000 (UTC)
Received: from shell (shell1.dds.nl [83.96.147.101])
	by smtp2.signet.nl (Postfix) with ESMTPS id C4D6640C1AA2
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2018 18:34:45 +0100 (CET)
Date: Tue, 23 Jan 2018 18:34:45 +0100 (CET)
From: Xen <list@xenhideout.nl>
Message-ID: <alpine.LRH.2.21.1801231822270.25@localhost>
MIME-Version: 1.0
Subject: [linux-lvm] pvscan hung in LVM 160
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a small question if I may ask.

I upgraded one of my systems to LVM 160, I know that's still rather old.

During boot, pvscan hangs, I don't know if this is because udev is 
terminated.

The pvscan --background never completes.

If I remove --background, pvscan instantly exits with code 3.

Consequently, none of my volumes are activated save what comes down to the 
root device, because it is activated explicitly, this is Ubuntu Xenial 
basically.

The thing only started happening when I upgraded LVM to a newer version.

Though pvscan exits with 3, at least my system doesn't take 6 minutes to 
boot now.

My only question is: was this a known bug in 160 and has this since been 
fixed, and if so, in what version?

Some people on Arch investigated this bug when 160 was current (around 
2014) and for them the bug was caused by udev exiting before pvscan could 
finish.

The basic boot delays are caused by udevadm settle calls.

Regards.
