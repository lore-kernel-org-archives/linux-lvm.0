From: Frank Benkstein <benkstein@math.tu-dresden.de>
Subject: Re: [linux-lvm] LVM and devfs
Message-Id: <20031216012013.680bec2f.benkstein@math.tu-dresden.de>
In-Reply-To: <20031215224841.GA7977@percy.comedia.it>
References: <20031215194252.GA30671@percy.comedia.it>
	<20031215195720.84933.qmail@web13505.mail.yahoo.com>
	<20031215224841.GA7977@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Dec 15 18:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi.

On Mon, 15 Dec 2003 23:48:41 +0100
Luca Berra <bluca@comedia.it> wrote:

> On Mon, Dec 15, 2003 at 11:57:20AM -0800, Stuart Felenstein wrote:
> >   I  think  you may be off here.  It was RedHat9 that gave me the
> >   option of using LVM.
> 
> i said _devfs_ is not supported,
> _lvm_ is.
> 
> >   I've  gone  to  the  2.4.23 kernel with devfs and lvm support.  I
> >   know there  is alot or a good amount of controvery around devfs
> >   but I think I'll ride it out and see how it works for me.
> >
> lvm1 tools do have a problem with switching from devfs to non-devfs,
> and vice-versa since they use /proc/partitions to find pvs, and do
> write the pv name in the metadata. (read the list archives for the
> gory details)
> 
> L.
> 
> 

I use lvm1+devfs on a few (Gentoo, 2.4.23) systems and I had no problems
so far. I even switched the drives around, e.g. making primary master
secondary slave and so on, and to my suprise it just worked as if I
didn't do anything. So I don't understand why there are troubles moving
from lvm1 with devfs to lvm without devfs. I even used KNOPPIX in one of
the systems, which has devfs disabled AFAIK, and still had no problems
getting access on my data besides doing manual "vgscan ; vgchange -a
y" and mounting.

Just my 0,02 Euro.

Greetings

Frank Benkstein.
