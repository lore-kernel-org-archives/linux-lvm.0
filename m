Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012260752.eBQ7qea25647@webber.adilger.net>
In-Reply-To: <20001226001600.A24447@caldera.de> "from Christoph Hellwig at Dec
 26, 2000 00:16:00 am"
Date: Tue, 26 Dec 2000 00:52:40 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] Re: [lvm-devel] [PATCH] IOPv6 support for Linux 2.4.0-test13-pre4 (LVM
 0.9)
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
To: lvm-devel@sistina.com
Cc: linux-lvm@sistina.com

Christoph Hellwig writes:
> this patch (against Linux 2.4.0-test13-pre4 + my both previous patches),
> implements a IOPv6 compatiblity layer for LVM 0.9.  This is done by doing
> structure conversion in copy_{pv,vg,lv}_{from,to}_user routines that replace
> copy_{from,to}_user calls in lvm.c.

First of all, I'm not 100% convinced that it is possible to use the
IOPv6 user tools with an IOPv10 kernel.  Surely there is _something_ that
the kernel is expecting that the older tools don't handle?  Otherwise,
why would the IOP version have changed?  Even so, I think doing the
compatibility in the kernel is the wrong place - the compatibility bloat
should be in the user-space library.

I'd rather the compatibility layer was in liblvm (user space) and
that the 0.9 user tools could optionally work with an IOPv6 kernel.
This would require that users always have the latest tools (which
is always the case), but that they could upgrade the tools _before_
upgrading the kernel.

Actually, I have no idea yet how hard it is to handle multiple IOP versions
from a single liblvm, but I think the "wrapper" method is pretty flexible
for a lot less work - it allows us to handle multiple IOP versions at the
same time, and also lets you delete older IOP support when you no longer
need it.

Cheers, Andreas

PS - yes I hate it when I complain about work that someone else has done
     when I'm not quite ready to do a better job myself.
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
