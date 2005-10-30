Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9UJVnV31685
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 14:31:49 -0500
Received: from mx1.ventigo.net (node2.ventigo.net [194.112.245.132])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9UJVlwH011003
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 14:31:47 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx1.ventigo.net (Postfix) with ESMTP id DDE5829D143
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 20:31:46 +0100 (CET)
Received: from mx1.ventigo.net ([127.0.0.1])
	by localhost (mx1.ventigo.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23105-10 for <linux-lvm@redhat.com>;
	Sun, 30 Oct 2005 20:31:42 +0100 (CET)
Received: from danielhp (N938P031.adsl.highway.telekom.at [62.47.61.63])
	by mx1.ventigo.net (Postfix) with ESMTP id 11FF729D178
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 20:31:42 +0100 (CET)
From: "Daniel Khan" <d.khan@ventigo.com>
Date: Sun, 30 Oct 2005 20:31:41 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20051030193142.11FF729D178@mx1.ventigo.net>
Subject: [linux-lvm] Rescuing  LVM Partition
Reply-To: d.khan@ventigo.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hello,
 
one of my disks went broke and I don't have a backup for everything.
I was using LVM and /dev/vg/home with ReiserFS on it is damaged.
 
Currently I am creating an image of /dev/vg/home using dd_rescue.
 
The only thing I need to know is, if this is supposed to work with a LVM
partition.
Is the dump of /dev/vg/home a normal (pure) ReiserFS image like if I would
dump a regular /dev/hdaX or does it contain some kind of LVM metadata?
Should I better dump the whole LVM partition (/dev/hda3) or is my way of
accessing the vg the way to go?
 
Thanks in advance for your help.

-- 
Daniel Khan
