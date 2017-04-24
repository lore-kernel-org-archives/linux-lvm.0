Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A59237F46F
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 16:06:12 +0000 (UTC)
Received: from viruswall.wits.ac.za (viruswall.wits.ac.za [146.141.15.4])
	by mx1.redhat.com (Postfix) with ESMTP id AD1F070727
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 16:06:05 +0000 (UTC)
Received: from [127.0.0.1] (helo=imss.wits.ac.za)
	by viruswall.wits.ac.za with esmtp (Exim 4.63)
	(envelope-from <Scott.Hazelhurst@wits.ac.za>) id 1d2gV0-0000c1-Nt
	for linux-lvm@redhat.com; Mon, 24 Apr 2017 18:06:02 +0200
Received: from imss.wits.ac.za (localhost.localdomain [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9502B67CD2D
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 18:06:02 +0200 (SAST)
Received: from Coltus.ds.WITS.AC.ZA (coltus.ds.wits.ac.za [146.141.11.222])
	by imss.wits.ac.za (Postfix) with ESMTP id 8A11567CD25
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2017 18:06:02 +0200 (SAST)
From: Scott Hazelhurst <Scott.Hazelhurst@wits.ac.za>
Date: Mon, 24 Apr 2017 16:06:01 +0000
Message-ID: <05C1533E-0A09-405E-977B-E0FC40D88A59@wits.ac.za>
Content-Language: en-US
Content-ID: <9143D67B04D25845BF6D8E3034C829CE@wits.ac.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] VG won't activate -- dm problem
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
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


Dear all 

I did an upgrade of my Ubuntu 16.04.2 system and when I rebooted my key volume group won’t activate properly. If I do a pvs, vgs, or lvs all the volumes appear good but dmsetup doesn’t show any information

For example I do this and I see the volume (VM70POOL is the VG I am interested in)

  >vgs

  VG        #PV #LV #SN Attr   VSize VFree 
  VM70POOL    1  11   0 wz--n- 1.82t  1.08t
  ubuntu-vg   2   2   0 wz--n- 3.64t 48.19g

and
root@vmhost:/var/log# lvdisplay /dev/VM70POOL/health-root-1610 
  --- Logical volume ---
  LV Path                /dev/VM70POOL/health-root-1610
  LV Name                health-root-1610
  VG Name                VM70POOL
  LV UUID                jVkRfy-tQ6M-D9RM-xcvO-NxGX-24RY-jQv1r1
  LV Write Access        read/write
  LV Creation host, time vmhost, 2016-11-16 10:10:58 +0200
  LV Status              NOT available
  LV Size                64.00 GiB
  Current LE             16384
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto


But I can’t activate the volume — I get 

root@vmhost:/var/log# vgchange -ay VM70POOL 
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  device-mapper: reload ioctl on (252:6) failed: Device or resource busy
  0 logical volume(s) in volume group "VM70POOL" now active

and in kern.log we have  "kernel: [ 3819.113149] device-mapper: table: 252:6: linear: Device lookup failed"

Indeed there is no /dev/dm-6 or above

and dmsetup ls shows no sign of the volume
root@vmhost:/var/log#  dmsetup ls --tree -o device
ubuntu--vg-swap_1 (252:5)
 └─ (8:5)
ubuntu--vg-root (252:4)
 ├─ubuntu--vg-root_rimage_1 (252:3)
 │  └─ (8:21)
 ├─ubuntu--vg-root_rmeta_1 (252:2)
 │  └─ (8:21)
 ├─ubuntu--vg-root_rimage_0 (252:1)
 │  └─ (8:5)
 └─ubuntu--vg-root_rmeta_0 (252:0)
    └─ (8:5)



For the record 
root@vmhost:/var/log#root@vmhost:/var/log# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               VM70POOL
  PV Size               1.82 TiB / not usable 1.09 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              476932
  Free PE               284420
  Allocated PE          192512
  PV UUID               X2Pzgr-nqNp-ri8n-HoT6-Zs7y-e7FC-sNURM6




smartmon shows no problem with the disk though I realize that doesn’t necessarily mean anything


FWIW, in one posting I found that someone with a similar problem had there was a suggestion to do vgscan —mknodes
This had no effect.

I have rebooted the machine too 

Any suggestions gratefully received?

Many thanks

Scott






<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:100%;"> 
<tr>
<td align="left" style="text-align:justify;"><font face="arial,sans-serif" size="1" color="#999999"><span style="font-size:11px;">This communication is intended for the addressee only. It is confidential. If you have received this communication in error, please notify us immediately and destroy the original message. You may not copy or disseminate this communication without the permission of the University. Only authorised signatories are competent to enter into agreements on behalf of the University and recipients are thus advised that the content of this message may not be legally binding on the University and may contain the personal views and opinions of the author, which are not necessarily the views and opinions of The University of the Witwatersrand, Johannesburg. All agreements between the University and outsiders are subject to South African Law unless the University agrees in writing to the contrary. </span></font></td>
</tr>
</table
