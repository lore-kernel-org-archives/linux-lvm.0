Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n66ILT95003768
	for <linux-lvm@redhat.com>; Mon, 6 Jul 2009 14:21:29 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n66ILEpl016364
	for <linux-lvm@redhat.com>; Mon, 6 Jul 2009 14:21:15 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1MNsoQ-00059O-7p
	for linux-lvm@redhat.com; Mon, 06 Jul 2009 20:21:10 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1MNso6-0000h3-Rl
	for linux-lvm@redhat.com; Mon, 06 Jul 2009 20:20:50 +0200
Message-ID: <4A524089.2040602@whgl.uni-frankfurt.de>
Date: Mon, 06 Jul 2009 20:20:57 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Status Codes?
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

Hi list,

I am working on some sort of init script and came across a problem. I 
cannot seem to find any feasible way, to determine either:
If new inactive VGs became available
or if lvm did set up new VGs (and LVs inside those VGs).

Maybe I am overlooking something, but I cannot seem to find any solution.

Let me explain further:
Let's assume I have a disk (or disks) with several LVs. now imagine some 
of those build some md device and on top of that we'll have more VGs and 
LVMs (If that really makes sense is another question though).
If I have a list of md raid volumes I expect to come up, I can try to 
set those up and get exit codes, which represent either a failure or a 
success, I can somewhat determine, if there are still more raid volumes 
that are expected to become available and try setting those up at a 
later time. Something like this doesn't seem to be possible with lvm 
right now.
The script is for an initramfs and the idea is basicly to 'iterate' over 
and over again, until no new crypt mappings, lvms and md raids can be 
setup (The idea behind this is to make it robust against how users stack 
dm devices over each other (dmcrypt on lvms, lvms on dmcrypt etc. etc.)

I'd really appreciate, if someone could give me a hint. I am somewhat 
limited to busybox whilst that script is runnig+static lvm,cryptsetup 
and mdadm.

Thanks in advance for any advice

Reagards

-Sven
