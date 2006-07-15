Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6F1IvdG008300
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 21:18:57 -0400
Received: from www.fermi.mo.it (istemoj0.customer.nettuno.it [130.186.251.51])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6F1Ir4s022657
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 21:18:54 -0400
Received: from www.fermi.mo.it (localhost.localdomain [127.0.0.1])
	by www.fermi.mo.it (8.12.11/8.12.11) with ESMTP id k6F1PBnb008865
	for <linux-lvm@redhat.com>; Sat, 15 Jul 2006 03:25:12 +0200
Message-ID: <4610.82.54.230.73.1152926709.squirrel@www.fermi.mo.it>
Date: Sat, 15 Jul 2006 03:25:09 +0200 (CEST)
From: "Paolo Santinelli" <p.santinelli@fermi.mo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm volumes not available on boot, after kernel update
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

I installed a Redhat enterprise AS 4 Update 3, kernel 2.6.9-34.ELsmp. on a
Tyan Thunder K8SE with a dual core AMD opteron and a 3ware 9550SX SATA
RAID controller.
I build a 4 disk RAID 5 with the root partition (/) build on
/dev/mapper/VolGroup00-LogVol00.

At the end of installation process All appear running OK, also after the
first reboot all run fine.

After the automatic update from RedHat network, with  new kernel:
2.6.9-34.0.2.ELsmp at boot time the system hangup with these messages:

...
..
  No volume groups found
  Unable to find volume group �VolGroup00�
...
...
...
Kernel panic ...

Can anyone  help  me ?


Thanks in advance

Paolo Santinelli
