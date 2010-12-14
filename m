Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBEFxn3B023306
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 10:59:50 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBEFxd8f002944
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 10:59:40 -0500
Received: by qwa26 with SMTP id 26so871116qwa.33
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 07:59:39 -0800 (PST)
MIME-Version: 1.0
From: Paolo Smiraglia <paolo.smiraglia@gmail.com>
Date: Tue, 14 Dec 2010 16:59:19 +0100
Message-ID: <AANLkTi=zsNTng5n6gnEro_Dsb8_m+dszDUgxovRAX+LT@mail.gmail.com>
Subject: [linux-lvm] Shared LVM questions
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi to every ones...


I would to setup a LVM build on top of an iSCSI disk shared between
some nodes which is managed by a Master Node (MN) that sents commands
to other nodes (N1, N2,...) through SSH.

I think the cluster extension is not required because a particular
Logical Volume (LV) is accessed exclusively by one node, and because
LVM metadata cannot be modified at the same time by multiple nodes.

One issue is that once a LV is created by a node it cannot be
activated by another node by executing the command

  $> lvchange -aey vg/lv01

and the LV created is a snapshot. The error displayed is

  Can't change logical volume "lv01"


1. In this scenario is CLVMD required?
2. Is it possible to activate a LV in another node?


Thanks in advance for all replies.


-- 
PAOLO SMIRAGLIA
http://portale.isf.polito.it/paolo-smiraglia
