Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB730Ar15385
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:00:10 -0500
Received: from desire.voip.primustel.com (_postfix@[208.219.5.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB7304um030250
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 22:00:04 -0500
Received: from cain (benway.cv.telegroup.com [10.40.41.175])
	by desire.voip.primustel.com (Postfix) with ESMTP id 1F3A611C7F
	for <linux-lvm@redhat.com>; Tue,  7 Dec 2004 02:31:09 +0000 (UTC)
From: Aran Cox <acox@ia.primustel.com>
Date: Mon, 06 Dec 2004 20:31:08 -0600
Message-Id: <1102386668.5390.6.camel@cain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] wicked pvmove/ivtv driver interaction
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

It seems like any attempt to run pvmove while the ivtv (ivtv.sf.net)
driver is recording a program causes the ivtv driver to flake out and
spew these messages:
Dec  6 18:57:13 cain kernel: ivtv: ENC IRQ OVERFLOW: #11772 Stealing a
Buffer, 256 currently allocated


I am running kernel-2.6.9-1.667 on FC3.  pvmove never returns to the
shell but it does seem to complete.  The system is so messed up after
this that I can't reboot it normally, I had to hit the reset switch.

This is just a warning, I guess.  pvmove and ivtv don't mix for me,
YMMV.  I tried it with ivtv loaded but not actively recording a program
and everything completed just fine.

-- 
Aran Cox <acox@ia.primustel.com>
