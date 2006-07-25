Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6PM4MAR013728
	for <linux-lvm@redhat.com>; Tue, 25 Jul 2006 18:04:22 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6PM4EVm025235
	for <linux-lvm@redhat.com>; Tue, 25 Jul 2006 18:04:15 -0400
Received: from soda (office.linbit [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 958EF2CDC60D
	for <linux-lvm@redhat.com>; Wed, 26 Jul 2006 00:04:09 +0200 (CEST)
Date: Wed, 26 Jul 2006 00:04:10 +0200
From: linux-lvm@linbit.com
Subject: Re: [linux-lvm] fc4 lvm2 snapshot problem
Message-ID: <20060725220410.GE4633@soda.linbit>
References: <8e3c40600607250434p6ab2936er3986b6e9a4da4e29@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e3c40600607250434p6ab2936er3986b6e9a4da4e29@mail.gmail.com>
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
To: linux-lvm@redhat.com

/ 2006-07-25 13:34:02 +0200
\ Dennis Ortsen:
...
> However when I shoot down udevd (udev-071-0.FC4.3) I can create as many snapshot
> devices as I like. Until the udevd daemon has been respawned. Then it all stops
> working (the creation of snapshot volumes). When I disable udev in
> /etc/rc.sysinit (place comments before start_udev and udevsend) and reboot, I
> can create snapshot volumes a dozen of times without problems. Until I manually
> start udevd. Then the fun is over. When I kill udevd again, I can continue
> creating snapshot volumes. Both servers (the one that works and the one that
> doesn't) have the exact same versions of the kernel, lvm2,
> device-mapper and udev.
> 
> My best guess is udev that is messing about. I don't know whether I can safely
> disable udev on a production server. But more importantly: what can I
> do to get this properly fixed? Am I missing an important update? Are
> there any known conflicts with other packages or third party software
> (such as roxen)? Is there anyone who has similar problems?

maybe its the same problem?
excerpt from my /etc/udev/udev.rules:

# device mapper creates its own device nodes, so ignore these
#lge: see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=343671
#KERNEL=="dm-[0-9]*",           NAME=""
KERNEL=="dm-[0-9]*",            OPTIONS+="ignore_device"
KERNEL=="device-mapper",        NAME="mapper/control"

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
