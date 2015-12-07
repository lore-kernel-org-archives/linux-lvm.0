Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB7K5DuB029276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Dec 2015 15:05:13 -0500
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.105])
	by mx1.redhat.com (Postfix) with ESMTPS id 983F08E25E
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 20:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 8B904142294
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:09 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eTLAcI4EAOB5 for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 21:05:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 51D951422E0
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:07 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sB5o2Rbfnq5F for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 21:05:07 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 6EA2614233E
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 6753B101027
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:04 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gO_QZXH_6uQ4 for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 21:05:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id B8C14101022
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:03 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QLSFM4fa7f-G for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 21:05:03 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 900BB100898
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 21:05:03 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
References: <02c701d13102$e0027c90$a00775b0$@helmholtz-muenchen.de>
In-Reply-To: <02c701d13102$e0027c90$a00775b0$@helmholtz-muenchen.de>
Date: Mon, 7 Dec 2015 21:05:03 +0100 (CET)
Message-ID: <000b01d1312a$8f8105c0$ae831140$@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: de
Subject: Re: [linux-lvm] backup with snapshots - some principal questions
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Bernd wrote:
> Hi,
> 
> i have several servers running different Linux distributions.
> Our computing center provides a network-based backup solution
> (Legato/EMC), which saves the disks every night. But when the servers
> run, this backup is of course not consistent.
> The servers are running a lvm configuration (/ on lv and /boot on a
> physical partition).
> My idea is to create a snapshot and mount it before the network backup
> comes. When this is stored, my backup is consistent. I can configure the
> networker client in such a manner that the "live" lv is not saved, just
the
> snapshot so that the server is not saved twice.
> My questions:
> Before I create a new snapshot, I'd like to remove the old one. Is there
> something I have to take care of or can I just delete it using lvremove
?
> No merging or s.th. like that before ?
> What is if I'd like to apply the snapshot ? Which command do I have to
> use for rolling back the system to a snapshot ?
> 
> Thanks.
> 
> 

Hi,

i'm testing currently. This is my script:

cd
logger Skript snapshot.sh starts
date > /var/log/snapshot.log
test -e /mnt/sn_root/etc && umount /mnt/sn_root >> /var/log/snapshot.log
2>&1
/sbin/lvremove -f /dev/vg1/sn_root >> /var/log/snapshot.log 2>&1
/sbin/lvcreate -L 9G -n sn_root -s /dev/vg1/lv_root >>
/var/log/snapshot.log 2>&1
test -e /mnt/sn_root && mount /dev/vg1/sn_root /mnt/sn_root >>
/var/log/snapshot.log 2>&1
logger < /var/log/snapshot.log
logger Skript snapshot.sh finished

I get this in /var/log/messages:

Dec  7 20:59:00 vm53200-12 root: Skript snapshot.sh starts
Dec  7 20:59:01 vm53200-12 /usr/sbin/cron[28428]: (root) CMD
(/usr/sbin/logwatch --service dmeventd)
Dec  7 20:59:01 vm53200-12 lvm[13903]: No longer monitoring snapshot
vg1-sn_root
Dec  7 20:59:05 vm53200-12 lvm[13903]: Monitoring snapshot vg1-sn_root
Dec  7 20:59:06 vm53200-12 kernel: [1043986.343038] kjournald starting.
Commit interval 15 seconds
Dec  7 20:59:06 vm53200-12 kernel: [1043986.343196] EXT3-fs (dm-1): using
internal journal
Dec  7 20:59:06 vm53200-12 kernel: [1043986.402634] ext3_orphan_cleanup:
deleting unreferenced inode 157171
Dec  7 20:59:06 vm53200-12 kernel: [1043986.435634] ext3_orphan_cleanup:
deleting unreferenced inode 156958
Dec  7 20:59:06 vm53200-12 kernel: [1043986.705218] ext3_orphan_cleanup:
deleting unreferenced inode 157169
Dec  7 20:59:06 vm53200-12 kernel: [1043986.744313] ext3_orphan_cleanup:
deleting unreferenced inode 157168
Dec  7 20:59:07 vm53200-12 kernel: [1043987.299663] ext3_orphan_cleanup:
deleting unreferenced inode 156949

...

Dec  7 20:59:07 vm53200-12 kernel: [1043987.956167] ext3_orphan_cleanup:
deleting unreferenced inode 157126
Dec  7 20:59:07 vm53200-12 kernel: [1043987.962637] ext3_orphan_cleanup:
deleting unreferenced inode 157125
Dec  7 20:59:07 vm53200-12 kernel: [1043987.969118] ext3_orphan_cleanup:
deleting unreferenced inode 157091
Dec  7 20:59:07 vm53200-12 kernel: [1043987.976513] ext3_orphan_cleanup:
deleting unreferenced inode 156520
Dec  7 20:59:07 vm53200-12 kernel: [1043987.976534] ext3_orphan_cleanup:
deleting unreferenced inode 156518
Dec  7 20:59:08 vm53200-12 kernel: [1043988.018951] ext3_orphan_cleanup:
deleting unreferenced inode 563237
Dec  7 20:59:08 vm53200-12 kernel: [1043988.040367] EXT3-fs (dm-1): 68
orphan inodes deleted
Dec  7 20:59:08 vm53200-12 kernel: [1043988.040369] EXT3-fs (dm-1):
recovery complete
Dec  7 20:59:08 vm53200-12 logger: Mon Dec  7 20:59:00 CET 2015
Dec  7 20:59:08 vm53200-12 logger:   Logical volume "sn_root" successfully
removed
Dec  7 20:59:08 vm53200-12 logger:   Logical volume "sn_root" created
Dec  7 20:59:08 vm53200-12 root: Skript snapshot.sh finished

What does the message " ext3_orphan_cleanup: deleting unreferenced inode
xxxxxx" means ?
And it appears always when the script runs.


Bernd








   

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
