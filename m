Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i83JEQ321843
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 15:14:26 -0400
Received: from m4s07.vlinux.de (m4s07.vlinux.de [83.151.27.105])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i83JEFG7031795
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 15:14:20 -0400
Received: from pd9529ec3.dip.t-dialin.net ([217.82.158.195]
	helo=lothlorien.homelinux.net)
	by m4s07.vlinux.de with asmtp (Exim 3.35 #1 (Debian))
	id 1C3JWG-0007nF-00
	for <linux-lvm@redhat.com>; Fri, 03 Sep 2004 21:14:44 +0200
Received: from helge (helo=localhost)
	by lothlorien.homelinux.net with local-esmtp (Exim 3.35 #1 (Debian))
	id 1C3JVm-0000Sb-00
	for <linux-lvm@redhat.com>; Fri, 03 Sep 2004 21:14:14 +0200
Date: Fri, 3 Sep 2004 21:14:14 +0200 (CEST)
From: Helge Bahmann <hcb@chaoticmind.net>
Subject: Re: [linux-lvm] "broken" snapshot volume -- how to remove?
In-Reply-To: <20040903185214.GR6264@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.44.0409032110230.30515-100000@lothlorien.homelinux.net>
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

Hello!

On Fri, 3 Sep 2004 Alasdair G Kergon wrote:

> On Fri, Sep 03, 2004 at 08:21:59PM +0200, Helge Bahmann wrote:
> > I *have* to bring the vg into a consistent state and I urgently need to
> > drop the snapshot volume -- is there any tool to manipulate lvm purely in
> > userspace that can simply delete the snapshot volume?
>
> LVM2 userspace tools would do this:
>   Source code from http://sources.redhat.com/lvm2/
>   To stop them talking to the kernel:
>     configure --disable-devmapper
>   before compiling.

hm... the documentation does not clearly state that it does handle lvm1
meta-data correctly, but I assume it does?

> And of course you must deactivate all your LVs before using
> them (ie vgchange -an).

certainly

Thanks for your help so far!
-- 
Helge Bahmann <hcb@chaoticmind.net>                     /| \__
The past: Smart users in front of dumb terminals       /_|____\
                                                     _/\ |   __)
$ ./configure                                        \\ \|__/__|
checking whether build environment is sane... yes     \\/___/ |
checking for AIX... no (we already did this)            |
