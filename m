Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i88IA1320323
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 14:10:01 -0400
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i88IA0S0006499
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 14:10:00 -0400
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
Message-Id: <1094666996.8570.120.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Date: Wed, 08 Sep 2004 11:09:56 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] stable lvm of over 2 terabytes?
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
To: linux-lvm@redhat.com


I'd like to evaluate a roughly 30 terabyte linux lvm (or md?) setup. 
This is to be done over a number of nbd devices, spread across 5 or more
nbd servers (each of which has a number of RAID cards installed in it).

We prefer out-of-box solutions to patching (although we're capable of
patching - but if the support isn't out-of-box then you end up patching
each time there's a security problem).  We mostly use RHEL 3 at this
point, but would be willing to switch to another distribution to get
stable 30 terabyte lvm (or md?).

Do we need kernel 2.6.x?  Do we need lvm2?  Can we use the in-kernel md
on a 2.6 based distribution?

Are there any distributions that have what we want right out of the
box?  Is anyone -using- such a configuration in production?  This is to
be hooked up to an AIX supercomputer over NFS, and we can't afford much
downtime.

Thanks.

-- 
Dan Stromberg DCS/NACS/UCI <strombrg@dcs.nac.uci.edu>
