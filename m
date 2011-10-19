Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9JAjKhs001820
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 06:45:20 -0400
Received: from mx-out.ocsa-data.net (mx-out.ocsa-data.net [194.36.166.37])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JAjJec023331
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 06:45:19 -0400
Received: from [192.168.111.12] (helo=webmail.ocsa-data.net)
	by mx-out.ocsa-data.net with esmtpa (Exim - FreeBSD Rulez)
	id 1RGTeA-000JCj-8A
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 12:45:18 +0200
Message-ID: <6198ad06f8735602ebb56546ec3469b6.squirrel@webmail.ocsa-data.net>
Date: Wed, 19 Oct 2011 12:45:18 +0200
From: "Yann Droneaud" <yann@droneaud.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM blocks discard for remove commands
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

Hi,

Does lvremove, vgremove, pvremove issue discard (eg. TRIM) commands
in order to release LE/PE/metadata blocks from the underlying devices (SSD) ?

If LVM don't do it now, is it a planned feature ?

Meanwhile, which methods can be used to discard/TRIM blocks when removing
a LV, or a VG, or PV, without wiping the complete underlying device.

Something to feed hdparm --trim-sector-ranges once the LV, VG or PV is
removed for example ?

Regards

-- 
Yann Droneaud
