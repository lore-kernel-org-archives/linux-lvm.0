Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i53GtDbI027723
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 17:55:13 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BVvUn-0002xy-Io
	for linux-lvm@redhat.com; Thu, 03 Jun 2004 17:55:13 +0100
Date: Thu, 3 Jun 2004 17:55:13 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] PV resizing
Message-ID: <20040603165513.GU6302@agk.surrey.redhat.com>
References: <82hdttvdgn.fsf@eloise.tuxfamily.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82hdttvdgn.fsf@eloise.tuxfamily.net>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jun 02, 2004 at 11:48:08PM +0200, Yann Droneaud wrote:
> Can i resize (grow) this partition so that the PV become bigger, 
> and new space will be available to the VG the PV is currently inside.
 
> To summary, will the PV/VG take account of the new partition size ?
> I would know about LVM 1 and LVM 2.
 
Instead of fiddling with pvresizing, can you create a new partition 
using the extra space and add it to the VG using vgextend?

Alasdair
-- 
agk@redhat.com
