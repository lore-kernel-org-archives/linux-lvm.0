Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5PLkDCb032441
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 17:46:13 -0400
Received: from sx.f1-outsourcing.eu (ip197-140.ghnet.pl [91.150.197.140])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5PLkAZ5018642
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 17:46:11 -0400
Received: from sx.f1-outsourcing.eu (localhost.localdomain [127.0.0.1])
	by sx.f1-outsourcing.eu (8.13.8/8.13.8) with ESMTP id r5PLk0wf027391
	for <linux-lvm@redhat.com>; Tue, 25 Jun 2013 23:46:00 +0200
Date: Tue, 25 Jun 2013 23:45:59 +0200
From: "Marc Roos" <M.Roos@f1-outsourcing.eu>
Message-ID: <"H00000670003132b.1372196759.sx.f1-outsourcing.eu*"@MHS>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvresize missing 500GB or more
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
To: linux-lvm <linux-lvm@redhat.com>


We have a reshaped a raid5 array from 11TB to 14TB, on top of this we 
have a drbd device that resized to  14994.5 GB, 14994541563904 bytes, 
but after the pvresize I have 


pvdisplay
  --- Physical volume ---
  PV Name               /dev/drbd21
  VG Name               VGstorage21
  PV Size               13.64 TB / not usable 948.00 KB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              3574977
  Free PE               717377
  Allocated PE          2857600


Is it normal to have this much loss?

Thanks in advance,
Marc





- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -. 
F1 Outsourcing Development Sp. z o.o.
Poland 

t:  +48 (0)124466845
f:  +48 (0)124466843
e:  marc@f1-outsourcing.eu
