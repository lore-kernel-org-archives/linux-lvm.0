Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r17B1TXT031541
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 06:01:29 -0500
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r17B1Pnk031486
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 06:01:27 -0500
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 595804C8128
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2013 12:01:22 +0100 (CET)
Date: Thu, 7 Feb 2013 12:01:21 +0100 (CET)
From: georges.giralt@free.fr
Message-ID: <586596874.331036957.1360234881236.JavaMail.root@zimbra39-e7.priv.proxad.net>
In-Reply-To: <CAMugGiGoVAKVTXHrcTwLOkiGCOF_iK5BsGKPo-5bHhXiC-f4tg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] =?utf-8?q?Re=C2=A0=3A__create_physical_partition_from?=
 =?utf-8?q?_logical_partition?=
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello !
I suppose you do not want to loose any data ?
If yes, I'll give only steps to follow and not detailed instructions in order for you to study and understand what you are doing and not break anything. 
Actually, given the picture shown, the volume group uses only the second partition of the physical disk (sda2) not the whole disk. But this is not relevant. 
At first, you have to calculate how many PE left free you have. Decide what number you will keep free for future Centos extension. 
Then, reduce the volume group size by the amount you can free (Number of PE x PE size)
If this is successful, Check that the now unallocated PE are at the end of sda2. 
Then reduce the size of the sda2 partition, freeing space for a new partition. 
Then create a new partition onto which you could install the new OS... 

Hope this helps. 
----- Mail d'origine -----
De: fakhreddine HABIB <fakhreddine2006@gmail.com>
À: linux-lvm@redhat.com
Envoyé: Wed, 06 Feb 2013 18:10:15 +0100 (CET)
Objet: [linux-lvm] create physical partition from logical partition

Hi,

   I nead please your help to create a physical partition from a logical
partition.

   I present my problem : I have the configuration (attached pic) of the
partitions.

   I use the centos system. The problem that my group volume "vg_rega" use
the whole of the physical disk. I want to install Ubuntu system with centos
(dual boot), but i need a physical partition to do that. How can'i convert
the " Unused Space " logical partition to physical partition to install
Ubuntu.

  Thank you.

F.H
