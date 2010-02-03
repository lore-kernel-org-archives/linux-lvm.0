Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o13FG2QO027670
	for <linux-lvm@redhat.com>; Wed, 3 Feb 2010 10:16:02 -0500
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o13FFkdv025630
	for <linux-lvm@redhat.com>; Wed, 3 Feb 2010 10:15:46 -0500
Message-ID: <3f7323257770df3362b491ffeab0bca0.squirrel@bottlehall.co.uk>
Date: Wed, 3 Feb 2010 15:15:38 -0000
From: "Nicholas Robinson" <npr@bottlehall.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] (no subject)
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

I sent this once, but got some strange message back that suggested it
wasn't posted. Apols if it was and you have got this twice!

I did a silly thing: I accepted the default and included a usb-connected
drive in my logical volume group when I installed Fedora recently. I
didn't discover this until I had finished installing everything and got it
set up exactly as I want.

I can't seem to find a way to remove the drive from the volume group, etc.
unless there are sufficient unallocated extents on other drives. There is
only one other drive in the system and it is fully allocated. There is so
much unused space on the drive that it could easily accommodate the usb
drive contents.

Are the only ways to resolve this either to reinstall from scratch or add
a second internal drive?

Thanks

Nick
