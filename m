Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7CEAHa03334
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 10:10:17 -0400
Received: from sbbmail1.sbb.ch (sbbmail1.sbb.ch [193.192.251.19])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7CE9te1018097
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 10:09:55 -0400
Received: from intmail1.sbb.ch (intmail1.sbb.ch [10.104.27.189])
	by sbbmail1.sbb.ch (Switch-3.1.6/Switch-3.1.0) with ESMTP id
	i7CE9agK012796
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 16:09:36 +0200
Received: from gmx.net (i34390.sbb.ch [147.78.17.245])
	by intmail1.sbb.ch (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	i7CE9S6U002816
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 16:09:36 +0200
Message-ID: <411B79CF.905E0C25@gmx.net>
Date: Thu, 12 Aug 2004 16:08:15 +0200
From: Thomas Meller <thomas.meller@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SAN Storage/mirror/lvm
References: <1092071992.3369.48.camel@localhost>
Content-Transfer-Encoding: 7bit
Reply-To: thomas.meller@gmx.net,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Cott Lang wrote:

> On the host, I see 4 SCSI devices, two valid, two invalid - I'm
> guessing this is caused because only one storage processor exports
> a particular LUN, so half the paths are invalid until a storage
> processor fails over.
> 
> sdd - SP A Path 1
> sde - SP B Path 1
> sdf - SP A Path 2
> sdg - SP B Path 2
> 
> I have a LUN currently on SP B, so I can use md multipath configured
> with /dev/sde and /dev/sdg, and that seems to work.
> 
> However, two things:
> 
> 1) How do I set this up to handle a failover to SP A?
> 2) Multipath only seems to work in failover mode, is there a way to
> load balance across the two paths?
> 
> Anyone have any hints?  :)

Hello Cott,

your questions and the phenomena you see are likely to be specific to your hardware. I tried
Emulex and QLogic HBA and found very different behaviour.

Multipathing is handled by the storage systems differently from dumb disks. Load balancing
over several physical paths is therefore a complicated task. Most vendors do not really
support it. Some systems suffer from a Host switching paths. Unless you do not use a
supported (read: expensive) Software you should keep your hands off.

Even failover has a 'mechanical' quality: you can hear the door's angles squiek when it
happens.
I found my clusters diving after teardown of a storage's HBA.

Failover while switching the physical path, i.e. switching the HBA takes at least 45 second
on a (tuned) qlogic. Meanwhile the whole computer freezes. The driver seems to switch off
interrupts or something.

Have fun finding your solution.

Thomas
