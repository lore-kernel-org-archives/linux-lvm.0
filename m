Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB4LMUDc000899
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 16:22:31 -0500
Received: from einhorn.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB4LLOQ8028562
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 16:21:25 -0500
Received: from x-berg.in-berlin.de (x-berg.in-berlin.de [217.197.86.33])
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	mB4LLNa4001184
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 22:21:24 +0100
Received: from philipp by x-berg.in-berlin.de with local (Exim 4.69)
	(envelope-from <philipp@ppc.in-berlin.de>) id 1L8LdT-0007Np-QX
	for linux-lvm@redhat.com; Thu, 04 Dec 2008 22:21:23 +0100
Date: Thu, 4 Dec 2008 22:21:23 +0100
From: Philipp Schmidt <philipp@ppc.in-berlin.de>
Message-ID: <20081204212123.GV2700@ppc.in-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
Sender: Philipp Schmidt <philipp@x-berg.in-berlin.de>
Subject: [linux-lvm] Limiting i/o bandwith for pvmove?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I have some problems with an overloaded disk-array. I want to move
some volumes out of it, but the bandwidth pvmove normally takes is too
heigh to remain stable.

Is there a way to limit the bandwidth usage of pvmove, like it is
possible when reconstructing software raid mirris sets?

AVE!
  Philipp Schmidt / phils...

-- 
Lbh unir whfg ivbyngrq gur Qvtvgny Zvyraavhz Pbclevtug Npg ol oernxvat gur
cebgrpgvba bs pbclevtugrq zngrevny.  Vs lbh ner abg n pvgvmra be erfvqrag bs
gur HFN, lbh evfx orvat vzcevfbarq naq uryq jvgubhg onvy sbe hc gb gjb jrrxf
hcba ragel gb gur HFN (c) Copyright 2001 by Hartmann Schaffer (signature only)

:wq
