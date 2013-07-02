Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r62HRp7r025392
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 13:27:52 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62HRnE1010315
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 13:27:50 -0400
From: =?iso-8859-1?Q?Christian_Schr=F6der?= <cs@deriva.de>
Date: Tue, 2 Jul 2013 19:27:46 +0200
Message-ID: <039e01ce7749$7874c6c0$695e5440$@deriva.de>
MIME-Version: 1.0
Content-Language: de
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Is cLVM necessary when accessing different logical
	volumes on a shared iSCSI target?
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
To: linux-lvm@redhat.com

Hi list!
I have an iSCSI server (using LIO) which provides one LUN. Two client
machines each connect this same LUN. From the client's perspective, let's
say it shows up as device /dev/sda. I have then in one client created a
partition /dev/sda1 with type 8e (LVM). The partition immediately shows up
in the other client.
After that, I have created a physical LVM volume (pvcreate /dev/sda1) and a
volume group (vgcreate shared /dev/sda1). Note that I have not enabled
cluster mode for this volume group. Again, both the physical volume and the
volume group are immediately visible to the other client.
When I create in one client a logical volume in this volume group, it is
visible to the other client, but it is unavailable. This works in both
directions, i.e. I can create a logical volume in one client or the other,
and it is always visible, but unavailable to the other client.
So far, everything seems to work fine. Now my question is: Is this setup
sufficient or do I need cLVM? I have tried to install cLVM, but had some
problems, because I do not have (and probably do not need?) a cluster
manager.
Could anybody explain when cLVM is needed in general and if it is necessary
for me?

Kind regards,
Christian

------------------------------------------------------------
Deriva GmbH Financial IT and Consulting
Christian Schr�der
Gesch�ftsf�hrer
Hans-B�ckler-Stra�e 2 | D-37079 G�ttingen
Tel: +49 (0)551 489 500-42
Fax: +49 (0)551 489 500-91
http://www.deriva.de

Amtsgericht G�ttingen | HRB 3240
Gesch�ftsf�hrer: Dirk Baule, Christian Schr�der
