Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAT1Cw66032566
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 20:12:58 -0500
Received: from mail7.sea5.speakeasy.net (mail7.sea5.speakeasy.net
	[69.17.117.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAT1CY2p021492
	for <linux-lvm@redhat.com>; Tue, 28 Nov 2006 20:12:34 -0500
Received: from unknown (HELO zago.boston.ximian.com) (federico@[130.57.22.201])
	(envelope-sender <flucifredi@acm.org>)
	by mail7.sea5.speakeasy.net (qmail-ldap-1.03) with RC4-MD5 encrypted
	SMTP for <linux-lvm@redhat.com>; 29 Nov 2006 01:12:28 -0000
From: Federico Lucifredi <flucifredi@acm.org>
Date: Wed, 29 Nov 2006 01:12:27 +0000
Message-Id: <1164762747.11838.4.camel@zago.boston.ximian.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] phisical resize
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
To: linux-lvm@redhat.com

Hello All,
 I have installed an fc4 box with LVM2 and softraid. Very nice, but I
also noticed that physical extent resizing is marked as not implemented
yet (pvresize). Now, I just looked at  the man pages in the repository,
and there is a page for pvresize (yay!). When was this implemented
(released version?) and, if you happen to know, did it make it into
fc6 ?

 Thanks -Federico

PS: please keep my address in CC, I am not currently subscribed to the
list.

-- 

_________________________________________
-- "'Problem' is a bleak word for challenge" - Richard Fish
(Federico L. Lucifredi) - http://www.lucifredi.com
