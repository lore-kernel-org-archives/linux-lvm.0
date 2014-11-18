Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAIGSB0N030428
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 11:28:11 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAIGS8BB024698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 11:28:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 57FBC20067F
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 17:28:07 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id exhBeqXVuTJ7 for <linux-lvm@redhat.com>;
	Tue, 18 Nov 2014 17:28:07 +0100 (CET)
Received: from [192.168.178.100] (p50896859.dip0.t-ipconnect.de
	[80.137.104.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 05E00200596
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 17:28:06 +0100 (CET)
Message-ID: <546B7395.3020305@mglug.de>
Date: Tue, 18 Nov 2014 17:28:05 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mixed ssd/disk szenario question: moving lv from ssd
	->disk?
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

Hi list,

I have an vg over multiple disks (ssd and standard disks) and a big
thinpool-volume inside. From thin thinpool i create a lot of snaps
(>200), which are normally explizit placed on the ssd (i can select the
pv-path on lvcreate).

Now, after a time some of these snaps i dont need on the fast device and
want to mv them to a slow pv (standard disk) as a kind of backup.

Ist it possible to "move" a lv from the ssd to a disk, if both devices
are part of my vg?

Tfh!
Oliver
