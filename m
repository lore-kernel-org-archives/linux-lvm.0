Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QLHOCN024258
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 17:17:24 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QLHB0H025386
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 17:17:12 -0400
Received: from d01relay01.pok.ibm.com (d01relay01.pok.ibm.com [9.56.227.233])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9QLCsva029390
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 17:12:54 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay01.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9QLHBbt071326
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 17:17:11 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9QBI2id030487
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 07:18:03 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9QBI2rF030463
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 07:18:02 -0400
Date: Mon, 26 Oct 2009 14:17:10 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive
Message-ID: <20091026211710.GA29404@us.ibm.com>
References: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
	<20091026161005.GB23405@us.ibm.com>
	<1256589236.27439.2.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256589236.27439.2.camel@elm.bottlehall.co.uk>
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

Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> Help!
> 
> I did the pvremove command and everything seemed fine. I carried on
> working on the first question and tried to do the pvmove
> 
> Immediately the machine hung and when I try to reboot, it finds the boot
> partition and begins the boot, but then hangs with a blank screen and
> top-left cursor. Occasionally, I can stop it with some messages about
> dm-1 and logical block 0 to 8 missing.

Culprit seems to be pvmove. Get a liveCD and try to activate the VG and
see if you can mount the LV. You can read of the LVM metadata from the
disk partitions (PVs). This is really sad and you need lot more LVM
expertise to fix things.
 
> I wonder if the pvremove over-wrote something important on the other
> partition as it had an incorrect view of the size of the sda1?

Even if pvremove tries to write something beyond /dev/sda1's size, the
write would fail. It can't do anything other than writing to /dev/sda1.
In other words, it can't mess with /dev/sda2.
