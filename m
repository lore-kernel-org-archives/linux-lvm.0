Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UE7wJp000611
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 10:07:58 -0400
Received: from bulimba.hst.terra.com.br (bulimba.hst.terra.com.br
	[200.176.10.194])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UE7sOK015544
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 10:07:54 -0400
Received: from domoni.hst.terra.com.br (domoni.hst.terra.com.br
	[200.176.10.16])
	by bulimba.hst.terra.com.br (Postfix) with ESMTP id CA96A130C10E
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 11:07:52 -0300 (BRT)
Received: from [10.0.0.38] (unknown [200.168.58.218])
	(authenticated user minicom024)
	by domoni.hst.terra.com.br (Postfix) with ESMTP id 2A160158813D
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 11:07:51 -0300 (BRT)
Message-ID: <44A530AA.7040506@minicom.com.br>
Date: Fri, 30 Jun 2006 11:09:46 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2 VG's in separated HD's
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

Sup folks!
I put another HD on my box to test with LVM, my primary HD is working 
all with LVM and a VG called vg_root. When I initialize and create a VG 
in the secondary HD, works well, I create a LV, perfectly...but when I 
reboot...donno what happens but the sistem doesnt initialize INIT, and 
send me a BusyBox (Debian).

And then I must mount the root LV, chroot to it and fdisk to erase the 
secondary HD, and reboot. Otherwise it doenst starts INIT.

Does anybody knows what's happening?

Tnx in advance!
