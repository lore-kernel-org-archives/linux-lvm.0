Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9FKEAV14462
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 16:14:10 -0400
Received: from greebo.hisser.org (postfix@hermes.hisser.org [62.49.72.126])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9FKE82M014926
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 16:14:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by greebo.hisser.org (Postfix) with ESMTP id 66CB5580C
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 21:14:01 +0100 (BST)
Received: from greebo.hisser.org ([127.0.0.1])
	by localhost (greebo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 26286-16 for <linux-lvm@redhat.com>;
	Sat, 15 Oct 2005 21:14:00 +0100 (BST)
Received: from [192.168.100.81] (leela.internal.hisser.org [192.168.100.81])
	by greebo.hisser.org (Postfix) with ESMTP id 4F754580B
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 21:14:00 +0100 (BST)
Message-ID: <43516306.1070907@hisser.org>
Date: Sat, 15 Oct 2005 21:13:58 +0100
From: James Pattinson <jamesp@hisser.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dmraid and pvcreate
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All

Further to my previous email, I've temporarily ditched the adaptec card 
and am experimenting with the motherboard's built in Silicon Image RAID 
controller. Seems to work much better!

I ran dmraid -ay and I can format /dev/mapper/sil_afbgccdfdfcd but can't 
pvcreate it:

crocodile ~ # dmraid -s
*** Active Set
name   : sil_afbgccdfdfcd
size   : 290445824
stride : 256
type   : stripe
status : ok
subsets: 0
devs   : 2
spares : 0
crocodile ~ # pvcreate /dev/mapper/sil_afbgccdfdfcd
  Device /dev/mapper/sil_afbgccdfdfcd not found.

Is there a step I'm missing?

Cheers!

James
