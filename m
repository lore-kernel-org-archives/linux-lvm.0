Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LGA9p23270
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:10:09 -0400
Received: from mailgate2.Cadence.COM (mailgate2.Cadence.COM [158.140.2.31])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LGA8Mc006440
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 12:10:08 -0400
Received: from mailhub.Cadence.COM (mailhub.Cadence.COM [158.140.128.33])
	by mailgate2.Cadence.COM (8.9.3/8.9.3) with ESMTP id JAA27935
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 09:10:07 -0700 (PDT)
Received: from d158140025182.Cadence.COM (localhost [127.0.0.1])
	by mailhub.Cadence.COM (8.12.8/8.8.5) with ESMTP id i3LG9bdp027139
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 09:09:37 -0700 (PDT)
Subject: Re: [linux-lvm] LVM and multiple HBA ports
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
References: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
Message-Id: <1082564234.5805.536.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Date: Wed, 21 Apr 2004 09:17:14 -0700
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
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

Is this a multipathed device?  I first create an MD device of a
particular lun like this:
mdadm -C -f -l mp -n 1 -x 1 /dev/md0 /dev/sd<x> /dev/sd<y>

where x is channel A of the device and y is channel B.

You can then verify it by:
mdadm --detail /dev/md0

Does this help?

On Wed, 2004-04-21 at 09:04, Dan Bar Dov wrote:
> I have a problem using two (or more) ports connected to the same storage.
> 
> Linux does not identify that the two LUNs it discovers is actually the same.
> When I create a PV all is well. 
> The PV gets created and is ACTIVE. However, through the other port, the PV
> is also discovered, but is marked INACTIVE in the LVM database.
> 
> When I try to create a VG using the active path, LVM scans all PVs in order.
> If it finds the INACTIVE instance first, the VG creation fails.
> 
> I'm using LVM 1.0.3, please let mw know if such a situation (connecting
> storage through multiple ports) is handled better in another version, or
> suggest how to overcome the problem.
> 
> Thanks,
> Dan
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
