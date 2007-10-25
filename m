Received: from [10.32.4.15] (vpn-4-15.str.redhat.com [10.32.4.15])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l9PLSeWS002315
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 23:28:41 +0200
Message-ID: <47210A6B.6090104@redhat.com>
Date: Thu, 25 Oct 2007 23:28:11 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM snapshot limits
References: <200710251447.43405.skruger@backcountry.com>
In-Reply-To: <200710251447.43405.skruger@backcountry.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Shaun Kruger wrote:
> I'm trying to create 45 LVM snapshots on one of my dev machines.  I have about 
> 7TB of disk to work with, but I keep having wierd issues.  I can't seem to 
> make more than 30 snapshots.  At about 15-20 snapshots they stop being 
> created reliably and as I get to 30 snapshots I stop getting snapshots and 
> start getting COW table sized logical volumes that are in no way snapshots.  
> Some of these snapshots cause kernel panics on RHEL 5 when I try to remove 
> them.

Hi,
both problems are already known and will be fixed in RHEL 5.1 release.
(See Red Hat Bugzilla bugs 211516 and 211525).
(Upstream kernel is already fixed.)

Anyway, multiple snapshots from the same origin can cause considerable 
performance decrease (there is no shared area for snapshots in current
implementation, so write to origin will cause new writes to every snapshot
copy-on-write area).

Milan
--
mbroz@redhat.com
