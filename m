Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAAG7r9g020593
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 11:07:53 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAAG7gWF022304
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 11:07:42 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id EF7B013014A
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 10:07:44 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id E1997130121
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 10:07:44 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] reading lun snapshots with identical lvminformationon
	them on one machine
Date: Mon, 10 Nov 2008 10:07:41 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C232C93@excs01.bucoks>
References: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks><20081105013103.GL14593@agk.fab.redhat.com>
	<8D07631D47C3CB4F867AD7BCF07D5C2307F48B@excs01.bucoks>
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

I'm getting closer, but still having an issue.  When I run this command:

sudo /usr/sbin/pvchange --config 'devices { filter = [ "a|/dev/sdf|",
"a|/dev/sdg|", "a|/dev/sdh|", "a|/dev/sdi|", "r|.*|"  ] }' -u /dev/sdf1

I get this error:

  Volume group containing /dev/sdf1 has active logical volumes
  0 physical volumes changed / 1 physical volume not changed
 
Sdf1-sdi1 are on SAN snapshots.  Is there something I have to do to
force the new uuid or to make pvchange see that these are not actually
active?
 

James Dinkel
