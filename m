Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i84LJ3305187
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2004 17:19:03 -0400
Received: from m4s07.vlinux.de (m4s07.vlinux.de [83.151.27.105])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i84LJ2S0009829
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2004 17:19:02 -0400
Received: from pd9529808.dip.t-dialin.net ([217.82.152.8]
	helo=lothlorien.homelinux.net)
	by m4s07.vlinux.de with asmtp (Exim 3.35 #1 (Debian))
	id 1C3hva-0007Pn-00
	for <linux-lvm@redhat.com>; Sat, 04 Sep 2004 23:18:30 +0200
Received: from helge (helo=localhost)
	by lothlorien.homelinux.net with local-esmtp (Exim 3.35 #1 (Debian))
	id 1C3hv2-0007FU-00
	for <linux-lvm@redhat.com>; Sat, 04 Sep 2004 23:17:56 +0200
Date: Sat, 4 Sep 2004 23:17:56 +0200 (CEST)
From: Helge Bahmann <hcb@chaoticmind.net>
Subject: Thanks! [Re: [linux-lvm] "broken" snapshot volume -- how to remove?]
In-Reply-To: <20040903185748.GS6264@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.44.0409042240200.30515-100000@lothlorien.homelinux.net>
MIME-Version: 1.0
Sender: Helge Bahmann <hcb@chaoticmind.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> And to run the lvm2 tools from where you compiled them,
> prefix each command with 'lvm' (in the tools directory).
> e.g. 'lvm vgscan'
>      'lvm lvdisplay'
>      'lvm lvremove vg1/snap1'
>
> Alasdair

Thank you for your help! It worked as you did describe.

I still have the backups in case someone wants to find out what went wrong
in the first place, but I guess no one is too interested in lvm1
anymore...

Best regards
-- 
Helge Bahmann <hcb@chaoticmind.net>                     /| \__
The past: Smart users in front of dumb terminals       /_|____\
                                                     _/\ |   __)
$ ./configure                                        \\ \|__/__|
checking whether build environment is sane... yes     \\/___/ |
checking for AIX... no (we already did this)            |
