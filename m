Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4EHbntN010318
	for <linux-lvm@redhat.com>; Mon, 14 May 2012 13:37:49 -0400
Received: from mermoz.linkfluence.net (mermoz.linkfluence.net [91.121.30.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4EHblbn028634
	for <linux-lvm@redhat.com>; Mon, 14 May 2012 13:37:48 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mermoz.linkfluence.net (Postfix) with ESMTP id 7DBD026B
	for <linux-lvm@redhat.com>; Mon, 14 May 2012 19:37:47 +0200 (CEST)
Received: from mermoz.linkfluence.net ([127.0.0.1])
	by localhost (mermoz.linkfluence.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id P5zGnxZ4a3kJ for <linux-lvm@redhat.com>;
	Mon, 14 May 2012 19:37:46 +0200 (CEST)
Received: from [10.0.0.207] (APuteaux-552-1-73-38.w90-61.abo.wanadoo.fr
	[90.61.180.38])
	by mermoz.linkfluence.net (Postfix) with ESMTPSA id 95C7F139
	for <linux-lvm@redhat.com>; Mon, 14 May 2012 19:37:46 +0200 (CEST)
From: Germain Maurice <gmaurice@linkfluence.net>
Date: Mon, 14 May 2012 19:37:46 +0200
Message-Id: <5A672399-BC00-4545-B203-031056EC4CC2@linkfluence.net>
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Device mapper does not really remove the references to
	removed LV.
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
To: linux-lvm@redhat.com

Hi everybody,

I'm facing to some problems in my virtualization cluster and i need some help to prevent it occurring again.

I know that LVM is not cluster aware and we have to use it with lot of caution.
However, i have a shared LVM storage between 6 nodes. I use KVM hosts.

Two days ago i rebooted my whole cluster in order to get the same LVM metadata and the same dmsetup table over the cluster. That's ok.

"vgck SATA6To" is ok.

Right now, I have a problem when deleting an LV.

On the node where the VM lives, i did the lvremove command (lv name : SATA6To/vm-306-disk-3), i have a good state of LVM :

node5:~# lvdisplay -C | grep -- "-306"
  vm-306-disk-1 SATA6To     -wi-ao  10.00G                                      
  vm-306-disk-2 SATA6To     -wi-ao   5.00G     
node5:~# dmsetup table | grep -- "-306"
SATA6To-vm--306--disk--1: 0 20971520 linear 152:16 2231370112
SATA6To-vm--306--disk--2: 0 10485760 linear 152:16 2252341632
node5:~# ls /dev/SATA6To/vm-306-disk-*
/dev/SATA6To/vm-306-disk-1  /dev/SATA6To/vm-306-disk-2
node5:~# ls /dev/mapper/SATA6To-vm--306--disk--*
/dev/mapper/SATA6To-vm--306--disk--1  /dev/mapper/SATA6To-vm--306--disk--2


If i did a "vgscan or lvscan" on the rest of the cluster, LVM well sees that the LV has been removed, however device-mapper still have devices for it :

node3:~# lvdisplay -C | grep -- "-306"
  vm-306-disk-1 SATA6To     -wi-a-  10.00G                                      
  vm-306-disk-2 SATA6To     -wi-a-   5.00G
node3:~# dmsetup table  | grep -- "-306"
SATA6To-vm--306--disk--1: 0 20971520 linear 152:32 2231370112
SATA6To-vm--306--disk--3: 0 8388608 linear 152:32 2262827392
SATA6To-vm--306--disk--2: 0 10485760 linear 152:32 2252341632
node3:~# ls /dev/SATA6To/vm-306-disk-*
/dev/SATA6To/vm-306-disk-1  /dev/SATA6To/vm-306-disk-2	/dev/SATA6To/vm-306-disk-3
node3:~# ls /dev/mapper/SATA6To-vm--306--disk--*
/dev/mapper/SATA6To-vm--306--disk--1  /dev/mapper/SATA6To-vm--306--disk--3
/dev/mapper/SATA6To-vm--306--disk--2


Any idea how to clear all references to the LV previously removed ?

And by the way, the good way to do the best practices when i change something in LVM and to take it in account in the other nodes ?

Is it advised to disable lvm cache (/etc/lvm/cache/.cache) ?

Thank you for your precious help !
Germain
