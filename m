From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818142912.GA14977@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817231415.GA4328@gondor.com> <20030818151229.B29420@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030818151229.B29420@uk.sistina.com>
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
Date: Mon Aug 18 09:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 03:12:29PM +0100, Alasdair G Kergon wrote:
> On Mon, Aug 18, 2003 at 01:14:15AM +0200, Jan Niehusmann wrote:
> > I noticed the WCHAN fields in my ps output were not very useful, because
> > they pointed to a module and were not decoded.
> 
> Does your System.map file correspond to the running kernel?
> [See ps man page / strace to check where it's getting that file from]

Sure it is :-)
(I use debian make-kpkg to build a kernel .deb, which makes sure that
the right System.map file gets installed together with the kernel)

But it doesn't contain symbols which get defined by modules. And
even /proc/ksymoops only contains exported symbols, which daemon()
from dm-daemon.c is not. So I looked at the next exported symbol
(dm_daemon_start), took the difference between these two addresses,
and went back the number of bytes in objdump --disassemble, and compared
that to the sourcecode to find the actual positions.

Even though I don't know x86 assembly too well, it was not difficult to
match assembly instructions to C source code, as the source at this
position is quite low-level.

Jan
