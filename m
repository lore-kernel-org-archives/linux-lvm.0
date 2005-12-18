Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBIJWg109246
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 14:32:42 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBIJWYI4005430
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 14:32:35 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Eo4FR-0003or-GG
	for linux-lvm@redhat.com; Sun, 18 Dec 2005 20:31:09 +0100
Received: from 82.153.166.94 ([82.153.166.94])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 20:31:09 +0100
Received: from mru by 82.153.166.94 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 20:31:09 +0100
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Sun, 18 Dec 2005 19:30:21 +0000
Message-ID: <yw1xmziyfbjm.fsf@inprovide.com>
References: <Pine.LNX.4.63.0512180645020.20680@skippy.fini.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: LVM corruption on rocketraid 1540 in AMD64 CentOS
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

Christopher Hicks <chicks@chicks.net> writes:

> I've got a pair of RocketRaid 1540's based on the HPT374 chip.  Every
> time I setup an LVM which includes drives on the RR1540 and reboot,
> the LVM becomes corrupt.  I'm able before reboot to read and write
> files to my heart's content, but then I reboot and its toast.  I was
> able to reboot fine with LVM partitions on the same box as long as
> none of the PV's were on the HPT374.  My experiments where on an AMD64
> machine running CentOS 4 and I'm not sure what to try next.  I figured
> trying FC4 on x86 32-bit hardware should be the next step to see if
> its an architecture issue.  Is this a known issue?  Any suggestions
> for why?  Or any suggestions for what to try?  I'd really like to get
> these controllers back in the server they belong in.  :)

FWIW, I've been running LVM on such a controller in an Alpha machine
(64-bit) for several years without a glitch.

-- 
M�ns Rullg�rd
mru@inprovide.com
