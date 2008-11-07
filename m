Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA7KHEn6002080
	for <linux-lvm@redhat.com>; Fri, 7 Nov 2008 15:17:14 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA7KH3Dd027247
	for <linux-lvm@redhat.com>; Fri, 7 Nov 2008 15:17:03 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id B09B3130065
	for <linux-lvm@redhat.com>; Fri,  7 Nov 2008 14:17:01 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id A0C6A13005D
	for <linux-lvm@redhat.com>; Fri,  7 Nov 2008 14:17:01 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] reading lun snapshots with identical lvm
	informationon them on one machine
Date: Fri, 7 Nov 2008 14:17:00 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C2307F48B@excs01.bucoks>
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
pvchange -u
on the snapshot ones, then vgchange -u and vgrename.

Use a filter in lvm.conf (env var LVM_SYSTEM_DIR to use different one if
this is
an automated process, not a one-off) or with --config on each command so
only
the snapshot devices are visible.

Alasdair
_______________________________________________


I made a copy of /etc/lvm/lvm.conf to /tmp-lvm.conf, changed the filter
line to this:

Filter = [ "a|/dev/sdf|", "a|/dev/sdg|", "a|/dev/sdh|", "a|/dev/sdi|",
"r|.*|"  ]

(sdf, sdg, sdh, and sdi are all snapshot devices of the vg)

And then I ran "sudo /usr/sbin/pvchange --config /tmp-lvm.conf -u
/dev/sdf1" but I get this error:

  Parse error at byte 14 (line 1): unexpected token
  Failed to set overridden configuration entries.
  Run `pvchange --help' for more information.

Am I maybe using the --config option wrong?

James
