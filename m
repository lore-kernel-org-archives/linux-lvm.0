Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82DlD320935
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:47:13 -0400
Received: from mail1.speakeasy.net (mail1.speakeasy.net [216.254.0.201])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i82Dl69n004634
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:47:07 -0400
Received: from dsl081-147-030.chi1.dsl.speakeasy.net (HELO
	mozart.theboulets.net) (spboulet@[64.81.147.30])
	(envelope-sender <stephen@theboulets.net>)
	by mail1.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Sep 2004 13:47:06 -0000
From: Stephen Boulet <stephen@theboulets.net>
Date: Thu, 2 Sep 2004 08:47:05 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409020847.05627.stephen@theboulets.net>
Subject: [linux-lvm] Fedora core 2 issues
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

Does fedora core 2 have issues installing on lvm2 partitions where the 
physical volumes are on extended (not primary) partitions?

I tried and it said that the size of my logical volumes were greater than that 
of the volume group containing it.

'df' showed the correct sizes when these logical volumes were mounted.

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"
