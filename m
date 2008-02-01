Received: from [172.16.45.118] (dhcp-118.brisbane.redhat.com [172.16.45.118])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	m115dseb010687
	for <linux-lvm@redhat.com>; Fri, 1 Feb 2008 15:39:55 +1000
Message-ID: <47A2B0C5.6010809@gmail.com>
Date: Fri, 01 Feb 2008 15:40:21 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limits?
References: <479DAD35.1080209@cesca.es>
	<479E2BEF.1090703@cesca.es>	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<479E698C.10204@cesca.es>
In-Reply-To: <479E698C.10204@cesca.es>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jordi Prats wrote:
> Hi,
> I'm the system administrator of PADICAT (http://www.padi.cat). It
> collects Catalan (http://en.wikipedia.org/wiki/Catalonia) web sites to
> provide permanent access to them (http://www.padi.cat/en/quees.php).
> It's equivalent to Internet Archive (http://www.archive.org) but for a
> particular culture.
> 
> Our software developers require us to have one large file system,
> actually a single directory, with all this historically-classified web
> sites on a gziped file.
> 
> I'm currently studying lustre and other HPC-related file systems to get
> this large file system, but by now I have ext3 as our file system. Next
> Monday I'm planning to extend it to 3TB o 4TB, so I'm currently
> researching for restrictions because during next month I'll have between
> 3TB to 4TB more to add: so, it will become a 8TB file system.
> 
> Last time I fsck my 2'1TB file system I spend about 2 hours. Anyway, I'm
> also curious about the maximums :P

The man page for vgcreate talks a little bit about limits:

"If the volume group metadata uses lvm1 format, extents can vary in size 
from 8KB to 16GB and there is a limit of 65534 extents in each logical 
volume. The default of 4 MB leads to a maximum logical volume size of 
around 256GB.
If the volume group metadata uses lvm2 format those restrictions do not 
apply, but having a large number of extents will slow down the tools but 
have no impact on I/O performance to the logical volume."

In short, you're more likely to reach filesystem limits before LVM's. 
EXT3 has a theoretical limit of 32 TB, but 32 GB its not practical. 
Creating an EXT3 filesystem larger than 8 TB is umm, brave - as you have 
noticed the tools (eg. fsck) do not scale well w/ EXT3.

GFS or XFS (or others) may be more suitable, but it depends on your 
requirements.

--Dave
