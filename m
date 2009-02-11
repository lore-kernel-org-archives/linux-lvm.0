Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1B3M3SN030719
	for <linux-lvm@redhat.com>; Tue, 10 Feb 2009 22:22:03 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1B3L7Jt019567
	for <linux-lvm@redhat.com>; Tue, 10 Feb 2009 22:21:07 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LX5eu-00032M-Nh
	for linux-lvm@redhat.com; Wed, 11 Feb 2009 03:21:08 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 03:21:08 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 03:21:08 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Tue, 10 Feb 2009 22:20:59 -0500
Message-ID: <jwv1vu5ek3a.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <20090209173514.GA1244@esri.com> <49906BCA.9070904@redhat.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: Dead device and cleaning up LVM
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

> You don't mention the name of your VG/LV but you should be able to remove
> the active lvm devices with "dmsetup remove", e.g.:

> dmsetup remove $VG-$LV

IIUC you can also use

   lvchange -an /dev/<VG>/<LV>

at leas that's what I do when an LVM volume becomes unavailable
(e.g., because the corresponding USB drive was disconnected).
I guess "vgchange -an" might work as well.


        Stefan
