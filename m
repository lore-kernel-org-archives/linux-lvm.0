Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99EBF424D
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2018 09:04:33 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F316B356FF
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2018 09:04:30 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id AAA215A762
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2018 10:04:29 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Mar 2018 10:04:29 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
Message-ID: <229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Gang He schreef op 23-03-2018 9:30:

> 6) attach disk2 to VM2(tb0307-nd2), the vg on VM2 looks abnormal.
> tb0307-nd2:~ # pvs
>   WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not
> found or rejected by a filter.
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg2 lvm2 a--  20.00g 20.00g
>   /dev/vdd   vg1 lvm2 a--  20.00g 20.00g
>   [unknown]  vg1 lvm2 a-m  20.00g 20.00g

This is normal because /dev/vdd contains metadata for vg1 which includes 
now missing disk /dev/vdc      .... as the PV is no longer the same.




> tb0307-nd2:~ # vgs
>   WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not
> found or rejected by a filter.
>   VG  #PV #LV #SN Attr   VSize  VFree
>   vg1   2   0   0 wz-pn- 39.99g 39.99g
>   vg2   1   0   0 wz--n- 20.00g 20.00g

This is normal because you haven't removed /dev/vdc from vg1 on 
/dev/vdd, since it was detached while you operated on its vg.


> 7) reboot VM2, the result looks worse (vdc disk belongs to two vg).
> tb0307-nd2:/mnt/shared # pvs
>   PV         VG  Fmt  Attr PSize  PFree
>   /dev/vdc   vg1 lvm2 a--  20.00g     0
>   /dev/vdc   vg2 lvm2 a--  20.00g 10.00g
>   /dev/vdd   vg1 lvm2 a--  20.00g  9.99g

When you removed vdd when it was not attached, the VG1 metadata on vdd 
was not altered. The metadata resides on both disks, so you had 
inconsistent metadata between both disks because you operated on the 
shared volume group while one device was missing.

You also did not recreate PV on /dev/vdc so it has the same UUID as when 
it was part of VG1, this is why VG1 when VDD is booted will still try to 
include /dev/vdc because it was never removed from the volume group on 
VDD.

So the state of affairs is:

/dev/vdc contains volume group info for VG2 and includes only /dev/vdc

/dev/vdd contains volume group info for VG1, and includes both /dev/vdc 
and /dev/vdd by UUID for its PV, however, it is a bug that it should 
include /dev/vdc even though the VG UUID is now different (and the name 
as well).

Regardless, from vdd's perspective /dev/vdc is still part of VG1.
