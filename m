Received: from reti (vpn50-3.rdu.redhat.com [172.16.50.3])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i1CKUXcD025393
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 20:30:34 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1ArNGQ-0003NH-Ug
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 20:16:46 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
Message-ID: <20040212201646.GC1898@reti>
References: <20040212100955.3b79511c.kilpatds@oppositelock.org> <402BBAEF.8000508@comedia.it> <402BC89E.6020606@backtobasicsmgmt.com> <402BDCAB.5060202@comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402BDCAB.5060202@comedia.it>
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
Date: Thu Feb 12 15:30:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 12, 2004 at 09:06:03PM +0100, Luca Berra wrote:
> this won't help if the device is not yet opened by md
> i posted a patch to this list that checks for an md superblock.
> i am pushing for consideration of this approach.

One of the problems with LVM1 was that there was far too much hard
coded behaviour such as this.

- Joe
