Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0GB8KO24002
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2005 06:08:20 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0GB8EkJ021424
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2005 06:08:14 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1Cq8GG-0005TP-00
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2005 12:08:08 +0100
Received: from 195.25.40.253 ([195.25.40.253])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2005 12:08:00 +0100
Received: from bonfils by 195.25.40.253 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2005 12:08:00 +0100
From: Bruno Bonfils <bonfils@fimasys.fr>
Date: Sun, 16 Jan 2005 11:30:29 +0100
Message-ID: <87wtudbr96.fsf@mononoke.fimasys.fr>
References: <20050115132055.GA18967@hcsd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Kernel bug with snapshots
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Stephan Austerm=EF=BF=BDhle <au@hcsd.de> writes:

> Hi,
> in the last days I played around with Kernel 2.6.9, LVM2, and multiple
> snapshots of the Logical Volume leading to some system freezes. The
> Volume Group is setup on top of a mirrored device (md). I decided to
> switch to kernel 2.6.11-rc1 with Device Mapper patches 2.6.10-udm1
> (without patch 29) and test again.

I had exactly the same bug with 2.6.10 + dm patch (without the first
ones and the 29th)

Create a 50G volume, a first 10G snapshot, a second one few hours
after. When i tried to lvremove the first snapshot, my kernel crash.

> The lvremove instruction terminated with
> 	Segmentation fault

--=20
Bruno Bonfils
Fimasys
