Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6MIQOaF021873
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 14:26:25 -0400
Received: from postman.dscd.de (postman.dscd.de [212.12.108.56])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6MIQM3a028521
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 14:26:22 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by postman.dscd.de (Postfix) with ESMTP id EA2CDB4053
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 20:26:19 +0200 (CEST)
Received: from postman.dscd.de ([127.0.0.1])
	by localhost (nimrod.dscd.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02101-08 for <linux-lvm@redhat.com>;
	Fri, 22 Jul 2011 20:26:19 +0200 (CEST)
Received: from nimrod.dscd.de (nimrod.dscd.de [212.12.108.56])
	by postman.dscd.de (Postfix) with ESMTP id 6907BB4052
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 20:26:19 +0200 (CEST)
Message-ID: <59730.213.157.4.156.1311359179.squirrel@nimrod.dscd.de>
In-Reply-To: <02292FBD45CF4C40AA7104EA7B291B70028E37F4CF@mxb-zv04.LVRINTERN.LVR.DE>
References: <02292FBD45CF4C40AA7104EA7B291B70028E37F4CF@mxb-zv04.LVRINTERN.LVR.DE>
Date: Fri, 22 Jul 2011 20:26:19 +0200 (CEST)
From: "Alexander Dalloz" <ad+lists@uni-x.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM Alignement
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> Hey all,
>
> i have a question about Lun / Partition alignment.
> If I use LVM in a Linux guest OS on a VMFS Datastore i can align my
> Partitions with mbralign.
> But the tool failes if I will try to use it on a LVM only VDisk. For
> example the second Disk of this guest OS.
>
> Did I need to align the second disk or did LVM take care of alignment ? I
> just mean a single VDisk with a single LVM VG.
>
> Greetings
>
> Lukas Matecki

By default LVM uses an offset of 192k, see:

# vgs -o +pe_start
  VG         #PV #LV #SN Attr   VSize VFree 1st PE
  VolGroup00   1   1   0 wz--n- 8,78G    0  192,00K

Alexander
