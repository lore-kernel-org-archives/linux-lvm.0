Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9K808t2032427
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 04:00:08 -0400
Received: from mail.nethinks.com (mail.nethinks.com [212.218.64.57])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9K806nA022214
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 04:00:07 -0400
Received: from [172.16.3.16] (fw-fd-nat-235.nethinks.com [212.218.65.235] (may
	be forged))
	by mail.nethinks.com (8.13.6/8.12.10/) with ESMTP id k9K7sLff009792
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 09:54:21 +0200
Message-ID: <45388202.7070305@nethinks.com>
Date: Fri, 20 Oct 2006 10:00:02 +0200
From: Thomas Marmetschke <thomas.marmetschke@nethinks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Question about Physical volume
Reply-To: tom@nethinks.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,

is it possible to extend a phyiscal volume?

I have a strange problem, i resized the /dev/sda4 partion (8e Linux LVM)
from 130GB to 220GB. so far so good.

But with pvdisplay i still get the 130Gb Partion :

 pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda4
  VG Name               msa
  PV Size               130,98 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              33530
  Free PE               6394
  Allocated PE          27136
  PV UUID               TnggaW-0rIL-JaRp-JiwR-ZRlP-JJ83-LOjHfg

Can i do something like a Rescan? that the Information will be updated.
The big problem is that on this server a productive data so i can=EF=BF=BDt
remove any partions.

thx!

-tom
