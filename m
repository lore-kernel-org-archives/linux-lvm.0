Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Tue, 27 Feb 2001 21:29:53 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] q: BLOCK_SIZE
Message-ID: <20010227212953.A2977@66bassett.freeserve.co.uk>
References: <3A9BF392.2E4C3DA5@tls.msk.ru> <200102272025.f1RKPg727605@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200102272025.f1RKPg727605@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 27, 2001 at 01:25:42PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 27, 2001 at 01:25:42PM -0700, Andreas Dilger wrote:
> Michael writes:
> > Little question that I already posted here a long time ago.
> > What drawbacks can suffer if one changes BLOCK_SIZE in
> > include/linux/lvm.h from 1024 (or 4096 on S/390) to 512?
> 
> On S/390 it would appear that the DASD block devices have a 4096
> byte sector size.  However, on most other systems there is only
> a 512 byte sector size, so I don't see any reason there would
> be problems with BLOCK_SIZE = 512.
> 
> I think Andrea Arcangeli was complaining about this as well.

I checked Andrea's patch into cvs, try and see.

- Joe
