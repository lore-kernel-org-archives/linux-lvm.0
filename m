Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1PExQ105949
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 09:59:26 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1PExPE4012388
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 09:59:26 -0500
Received: by nproxy.gmail.com with SMTP id m18so8151nfc
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 06:59:25 -0800 (PST)
Message-ID: <1d4c059f0602250659u54eeaa7bldce33e389430b1d6@mail.gmail.com>
Date: Sat, 25 Feb 2006 09:59:25 -0500
From: "Joel Gwynn" <joelman@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM drive changed from USB to Firewire
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

I have an old Dell gx300 with a Maxtor one-touch partitioned using LVM
When I first installed Ubuntu (Breezy Badger), it was detected on usb
and set up very nicely, thank you very much. But I decided that usb
1.0 is way too slow, so I bought a firewire card, which was also
detected very nicely.

The problem is that the drive is not found at boot anymore, and an
error is raised because it can't be mounted. But if I do a vgscan,
then a vgchage -ay, then mount -a, all is well and my volumes are
mounted.

How do I tell LVM to look at the firewire card instead of the usb controller?

TIA
Joel
