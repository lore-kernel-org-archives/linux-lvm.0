Received: from reti (vpn50-22.rdu.redhat.com [172.16.50.22])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i1DDUQ1a023244
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 13:30:35 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1ArDBK-0001rd-2G
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 09:30:50 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] advice sought on setting up new system
Message-ID: <20040212093049.GA7137@reti>
References: <200402062021.i16KL7m26084@ecstasy.winternet.com> <web-232397902@mail01.infosat.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <web-232397902@mail01.infosat.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 08:30:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Feb 11, 2004 at 11:28:37PM +0200, Dale Gallagher wrote:
> PEs(0-100) for LV /dev/mapper/v0-var-qmail-queue
> PEs (101-1000) for LV /dev/mapper/v0-home-mail
> 
> And then I find at a later stage that my queue is too
> small, so append PEs (1001-1100) to the original LV
> /dev/mapper/v0-var-qmail-queue.

The extent size should be chosen to be a convenient size for the
system administrator.  Typically 4-16M these days; it tends to get
bigger as hard disks grow.  So the extent size is going to be far too
large for you to worry about files being broken across extent
boundaries.  Think about the percentage of ios that will incur this
extra seek that you are concerned about.

- Joe
