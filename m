Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1E27f121766
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 21:07:41 -0500
Received: from hotmail.com (bay16-f3.bay16.hotmail.com [65.54.186.53])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1E27cil007531
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 21:07:39 -0500
Message-ID: <BAY16-F36DFB68DEB9FEEC103CE5AF060@phx.gbl>
From: "Alexey Shinkin" <alexshinkin@hotmail.com>
Date: Tue, 14 Feb 2006 07:19:04 +0600
Mime-Version: 1.0
Subject: [linux-lvm] lvm2 on amd64 - bug ?
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all !

Found an interesting thing on 2xOpteron box , running RHAS 4
( Linux rhas4 2.6.9-11.ELsmp #1 SMP Fri May 20 18:25:30 EDT 2005 x86_64 
x86_64 x86_64 GNU/Linux )

versions :
  LVM version:     2.02.02 (2006-02-07)
  Library version: 1.02.03 (2006-02-08)
  Driver version:  4.4.0

but observed with older versions of devmapper/lvm2 too .

The thing is - vgdisplay shows MAX LV = 0 and MAX PV = 0 , while there is
1 VG and several LVs on the box :

--- Volume group ---
  VG Name               testvg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  10
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               70.91 GB
  PE Size               4.00 MB
  Total PE              18154
  Alloc PE / Size       268 / 1.05 GB
  Free  PE / Size       17886 / 69.87 GB
  VG UUID               XN5GVp-TyOX-nY8Y-Zrr4-l056-dGrM-KgbO3Q

Looks  like a bug  ?

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
