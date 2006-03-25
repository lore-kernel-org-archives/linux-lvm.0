Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2PJAUdY014583
	for <linux-lvm@redhat.com>; Sat, 25 Mar 2006 14:10:30 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2PJATX2004250
	for <linux-lvm@redhat.com>; Sat, 25 Mar 2006 14:10:29 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1FNE9P-0000ZZ-Eq
	for linux-lvm@redhat.com; Sat, 25 Mar 2006 20:10:15 +0100
Received: from p54971fcb.dip0.t-ipconnect.de ([84.151.31.203])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 25 Mar 2006 20:10:15 +0100
Received: from claus by p54971fcb.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 25 Mar 2006 20:10:15 +0100
From: =?ISO-8859-1?Q?Claus_F=E4rber?= <claus@faerber.muc.de>
Date: Sat, 25 Mar 2006 18:31:41 +0100
Message-ID: <e03uq2$aa1$1@sea.gmane.org>
References: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
	<20060307190636.GA12504@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060307190636.GA12504@percy.comedia.it>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Boot Mgr support for '/boot' on LVM2 volumes ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Luca Berra schrieb:
> this is correct, the lv for /boot is to be linear and contiguus, it is
> user responsability to ensure this.

What about adding a "boot" flag to LVs? It set, it could have the 
following effect:

. Tools will ensure that the LV remains linear and contiguus and at the 
beginning of a PV.
. (Later) the LV is mirrored into every PV marked "bootable".

With these features, an OS could be booted from any disk. With mirroring 
(RAID-on-LVM) you could boot a system even if your primary disk fails.

Claus
