Received: from [10.34.32.13] (mazyland.englab.brq.redhat.com [10.34.32.13])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l6C8JjR8020633
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 10:19:45 +0200
Message-ID: <4695E421.4040106@redhat.com>
Date: Thu, 12 Jul 2007 10:19:45 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove fails with "Failure parsing mirror status
	fraction: 1 core"
References: <Pine.LNX.4.62.0707120828240.22959@aski.hut.fi>
In-Reply-To: <Pine.LNX.4.62.0707120828240.22959@aski.hut.fi>
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



Vesa-Pekka Palmu wrote:
> I'm trying to move data away from a raid1 array in a volume group to a 
> raid5 array and pvmove fails with error "Failure parsing mirror status 
> fraction: 1 core".
> 
> Any ideas?
> 
> Info:
> Kernel 2.6.22.1 Core 2 SMP

Hi,
there is bug in status string - and pvmove use it for monitoring, 
unfotunatelly the fix is not in 2.6.22 stable tree yet...
(kernel 2.6.21 is ok)

Patch is here
http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-raid1-fix-status.patch


Milan
--
mbroz@redhat.com
