Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8I9N64a002788
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2008 05:23:06 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m8I9N58e015717
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2008 05:23:06 -0400
Message-ID: <48D21DB9.6040804@redhat.com>
Date: Thu, 18 Sep 2008 10:22:01 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to start duplicate VG with new name and UUID?
References: <20080917194243.GA11502@nexus.edgeofthenet.org>
In-Reply-To: <20080917194243.GA11502@nexus.edgeofthenet.org>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Richard Michael wrote:
> Hello list,
> 
> I'm using FC7 2.6.23.12-52.fc7 and LVM2 lvm2-2.02.24-1.fc7.
> 
> I have a RAID1 mdadm software array containing a VG.  Half the array has
> been removed from the system and now returned and I want data from the
> old half, before it is resync'd back into the array.

See:

http://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html

And the reply from Alasdair which improves a couple of the steps.

Regards,
Bryn.
