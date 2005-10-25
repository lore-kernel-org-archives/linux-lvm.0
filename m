Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9PGftV02936
	for <linux-lvm@redhat.com>; Tue, 25 Oct 2005 12:41:55 -0400
Received: from mail.datatronics.es ([213.4.125.73])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9PGfn6v005005
	for <linux-lvm@redhat.com>; Tue, 25 Oct 2005 12:41:51 -0400
Received: from jmm (jmm.datatronics.es [10.6.0.6])
	by mail.datatronics.es (DATATRONICS MAIL) with ESMTP id 0441D17C03B
	for <linux-lvm@redhat.com>; Tue, 25 Oct 2005 18:09:46 +0200 (CEST)
Date: Tue, 25 Oct 2005 18:11:32 +0200
From: =?utf-8?Q?Jaime_Mart=C3=ADnez?= <jaime.martinez@datatronics.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opsy7lxii9tusfut@mail.datatronics.es>
Subject: [linux-lvm] Mounting LVM  partitions issue.
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
Content-Type: text/plain; format="flowed"; charset="utf-8"
To: linux-lvm@redhat.com

Hi all,

I'm new with LVM, but i know what a Volume Manager is. ... I have a small 
problem and I need someone help me to solve it (or determine it's 
unsolveable).

I had a machine running redhat, ... with 1 disk and 2 partitions:

/dev/hda1 -> boot partition.
/dev/hda2 -> LVM partition.

I made one change on one /etc/sysconfig ... file. And after rebooting I 
only get kernel pannic. I have started several live cd's (knoppix, ubuntu 
... ) and tryed to mount the LVM partition, so I can undo the changes. But 
I can´t mount it.

No lvm related command retunrs usefull information.

¿Is there any way to rescue a LVM partition?

On normal booting I get the error:

Scanning logical volumes
File descriptor 3 left open
	Reading Physical volumes ....
	Incorrect  metadata area header checksum
Activating logical volumes
File descriptor 3 left open
	Incorrect  metadata area header checksum
	Unable to find volume grou "VolGroup00"
ERROR: /bin/lvm exited abnormally !
Creating root device
Mounting root filesuystem
mount: error 6 mounting ext3
mount: error 2 mounting none
.
.
.
kernel panic - not syncing ...


Any idea about how to recover de disk ??


Thanks a lot.


__________________________________
Jaime Martínez Muñoz
Grupo de Soporte e Integración
de Plataformas y Servicios.
Ingeniero de Soporte.
__________________________________
DATATRONICS,S.A
