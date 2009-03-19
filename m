Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2JGDRUC015619
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:13:28 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2JGDA4X005757
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:13:11 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LkKrk-0000nJ-HF
	for linux-lvm@redhat.com; Thu, 19 Mar 2009 16:13:08 +0000
Received: from 69-196-134-79.dsl.teksavvy.com ([69.196.134.79])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 16:13:08 +0000
Received: from monnier by 69-196-134-79.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 16:13:08 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Thu, 19 Mar 2009 12:13:01 -0400
Message-ID: <jwveiwt3347.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: liblvm IOCTL/sysfs interface
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

> I  would like to know if there is any means currently to know the complete
> geometry of a LVM volume.
> e.g, If a volume has 3 PV(targets).
> So, we should be able to extract some information like.
> Name of Volume.
> Name of Volume Group.
> Name, Range and size for each of the Physical devices involved.
[...]
> We do maintain these informations inside the kernel, We should atleast
> have an ioctl or sysfs based interface to extract
> these information.

Actually, IIUC only part of this info is kept in the kernel.
Intuitively, I'd expect that only the set of LVs, along with their size
(and mapping to physical blocks) is kept in the kernel, whereas all the
names are not, and neither are the volume groups.


        Stefan
