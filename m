Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7TFLm329641
	for <linux-lvm@redhat.com>; Sun, 29 Aug 2004 11:21:48 -0400
Received: from mail1.speakeasy.net (mail1.speakeasy.net [216.254.0.201])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7TFLffq026999
	for <linux-lvm@redhat.com>; Sun, 29 Aug 2004 11:21:41 -0400
Received: from dsl081-147-030.chi1.dsl.speakeasy.net (HELO
	mozart.theboulets.net) (spboulet@[64.81.147.30])
	(envelope-sender <stephen@theboulets.net>)
	by mail1.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 29 Aug 2004 15:21:40 -0000
From: Stephen Boulet <stephen@theboulets.net>
Date: Sun, 29 Aug 2004 10:21:39 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200408291021.39989.stephen@theboulets.net>
Subject: [linux-lvm] lvm2 striping same as lvm2 volume on kernel raid?
Reply-To: stephen@theboulets.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I'd like to add a couple of disks to a raid-0 array and use lvm2.

Are the results very similar if I do software raid-0 and put lvm2 on top of 
that vs. if I do striping via lvm2?

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"
