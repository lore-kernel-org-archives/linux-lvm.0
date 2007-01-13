Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0DGbjGJ024613
	for <linux-lvm@redhat.com>; Sat, 13 Jan 2007 11:37:45 -0500
From: Turbo Fredriksson <turbo@bayour.com>
Date: Sat, 13 Jan 2007 17:39:09 +0100
Message-ID: <87hcuu9902.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
Subject: [linux-lvm] Can't pvcreate /dev/sda
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
To: linux-lvm@sistina.com

This is very weird!

----- s n i p -----
root@pegasos:~# pvscan
  PV /dev/hdb   VG MovieShare   lvm2 [74.53 GB / 74.53 GB free]
  PV /dev/sdb                   lvm2 [372.61 GB]
  Total: 2 [447.14 GB] / in use: 1 [74.53 GB] / in no VG: 1 [372.61 GB]
root@pegasos:~# pvcreate /dev/sda
  Physical volume "/dev/sda" successfully created
root@pegasos:~# pvscan
  PV /dev/hdb   VG MovieShare   lvm2 [74.53 GB / 74.53 GB free]
  PV /dev/sdb                   lvm2 [372.61 GB]
  Total: 2 [447.14 GB] / in use: 1 [74.53 GB] / in no VG: 1 [372.61 GB]
----- s n i p -----

Any ideas?
