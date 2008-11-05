Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA51fN5O000560
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 20:41:23 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA51fDCP014197
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 20:41:13 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 30A60130191
	for <linux-lvm@redhat.com>; Tue,  4 Nov 2008 19:41:15 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id 22B5713018C
	for <linux-lvm@redhat.com>; Tue,  4 Nov 2008 19:41:15 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] reading lun snapshots with identical lvm
	informationon them on one machine
Date: Tue, 4 Nov 2008 19:41:12 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C2307F489@excs01.bucoks>
References: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
	<20081105013103.GL14593@agk.fab.redhat.com>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----Original Message-----
From: Alasdair G Kergon
Sent: Tuesday, November 04, 2008 7:31 PM

Making sure you know which are original and which are snapshot, run
pvchange -u on the snapshot ones, then vgchange -u and vgrename.
<snip>

Alasdair
--------------------------

What does the '-u' do on pvchange and vgchange?  I couldn't find it in
the man pages.  Other than that question, I think I understand.  This
will be part of a script, so I will probably have the script create a
temporary config file and then use the --config option with each
command.
 

James Dinkel
Computer Services, Butler County of Kansas
