Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0JMCGO01152
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 17:12:16 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0JMCESe014296
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 17:12:15 -0500
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CrO3d-0002RO-00
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 23:12:09 +0100
Received: from c163195.adsl.hansenet.de ([213.39.163.195])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 23:12:08 +0100
Received: from jens-lvm by c163195.adsl.hansenet.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 23:12:08 +0100
From: Jens Benecke <jens-lvm@spamfreemail.de>
Date: Wed, 19 Jan 2005 19:49:34 +0100
Message-ID: <csm9ti$j5g$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] LVM2 (SuSE 9.2): I/O errors on disk,
	use dd_rescue or pvmove?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello,

I have a VG for /home across three harddisks. Now one of them is
experiencing problems (I/O errors). I'll get a replacement soon but
obviously I'd like to rescue as much data as possible.

What would be my best bet? Free 250G off /home, then try pvmove to move the
data off that harddisk, or wait for the replacement disk, and then boot
some mini-Linux without LVM support, and using dd_rescue to clone the whole
disk?

Thank you!


-- 
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf�cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g�nstiger Traffic
.
Please DO NOT CC: me, I read the lists and newsgroups I post in!
