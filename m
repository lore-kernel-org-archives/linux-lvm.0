Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2UCHvj31896
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 07:17:57 -0500
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.25])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2UCHt1X029620
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 07:17:55 -0500
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with ESMTP id <20040330121754.ZDKP15612.pegasus@kudu.siol.net>
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 14:17:54 +0200
Received: from vector ([193.77.156.30]) by kudu.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with SMTP id <20040330121753.LEBY5652.kudu@vector>
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 14:17:53 +0200
Message-ID: <002201c41651$12d53060$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
References: <001301c4164d$14b733a0$0400a8c0@vector>
Subject: Re: [linux-lvm] Removing an Old disk (LVM HOW-TO)
Date: Tue, 30 Mar 2004 14:18:12 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Additional question:

Can a PV be removed from the VG without executing pvmove
before (bruteforce remove if you will) ? What would I have to
do if I wanted to remove it (e2fsadm?, lvreduce? ...) ?

---------
Perplexer

----- Original Message ----- 
From: "Perplexer" <perplexer@thz.net>
To: <linux-lvm@redhat.com>
Sent: Tuesday, March 30, 2004 1:49 PM
Subject: [linux-lvm] Removing an Old disk (LVM HOW-TO)


> There is a section describing how to remove and old disk
> from LVM at http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html
> but nothing is said about reducing LV before this is done.
> 
> Must a LV be reduced using e2fsadm before any attempt to remove a PV
> is made in order to prevent data loss ?
> 
> ---------
> Perplexer
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
