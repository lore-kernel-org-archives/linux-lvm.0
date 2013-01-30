Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0U8smQ6030176
	for <linux-lvm@redhat.com>; Wed, 30 Jan 2013 03:54:48 -0500
Received: from mail.evoip.gr (evoip.static.otenet.gr [85.72.60.216])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0U8sjd1024846
	for <linux-lvm@redhat.com>; Wed, 30 Jan 2013 03:54:46 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.evoip.gr (Postfix) with ESMTP id 52ABB6B49D1
	for <linux-lvm@redhat.com>; Wed, 30 Jan 2013 10:43:51 +0200 (EET)
Received: from mail.evoip.gr ([127.0.0.1])
	by localhost (mail.evoip.gr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMoAvUE+bV1q for <linux-lvm@redhat.com>;
	Wed, 30 Jan 2013 10:43:46 +0200 (EET)
Received: from mail.evoip.gr (mail.evoip.gr [192.168.178.100])
	by mail.evoip.gr (Postfix) with ESMTP id 716666B4972
	for <linux-lvm@redhat.com>; Wed, 30 Jan 2013 10:43:46 +0200 (EET)
Date: Wed, 30 Jan 2013 10:43:46 +0200 (EET)
From: mixalis cossenas <mixalis@evoip.gr>
Message-ID: <395414939.172.1359535426366.JavaMail.root@mail.evoip.gr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] open count 1 blocking me from removing unused lv..
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

good day sirs,

i am using SLES sp1 on an IBM system z mainframe (s390 arch with DASD disks)
and i am facing the following problem...

i have one VG with 2 LVs ,the data from second lv was moved elsewere and i want
to remove the lv and free up the DASD disks BUT i have a problem...

when the data was moved ALL related daemons/programs writing/reading files on this lv
should be closed...but they werent.. :(

using lsof i found some apps accessing the old lv and they were killed,
also checking /proc/locks revealed programs that were closed...

tried to remove the lv by using lvremove but failed ,dmsetup -c info shows:

Name                Maj Min Stat Open Targ Event  UUID
system-home         253   0 L--w    1    1      0 LVM-QNFhmaviXPV05YkWno62o7zaEqaM3OMgcp1bhHr4HNLEaMskAgBUGkGAqeHwnXMV

open count is 1 and i cant find who/which keeps it open...

lsof  shows nothing....
cat /proc/locks | grep fd:00 shows nothing...

tried to remove it by using

lvremove system-home

dmsetup remove system-home

dmsetup --force remove system-home

nothing....

any ideas (i am trying to avoid reboot) on how can i find what is keeping my lv open...?

regards

Michael Cossenas.
