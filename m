Return-Path: <markv@wave.co.nz>
Date: Fri, 6 Jul 2001 12:47:41 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <20010706124739.D4022@mail.wave.co.nz>
References: <Pine.LNX.4.33.0106171519240.14970-200000@moon.dice.hu> <20010618095533.A32072@sistina.com> <20010629140922.B32501@mail.wave.co.nz> <20010703131338.A23563@sistina.com> <20010704124620.B7376@mail.wave.co.nz> <20010705070055.A15869@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010705070055.A15869@sistina.com>; from AJ Lewis on Thu, Jul 05, 2001 at 07:00:55AM -0500
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
To: AJ Lewis <lewis@sistina.com>
Cc: linux-lvm@sistina.com

On Thu, Jul 05, 2001 at 07:00:55AM -0500, AJ Lewis wrote:
> On Wed, Jul 04, 2001 at 12:46:20PM +1200, Mark van Walraven wrote:
> > I don't know about 1.0, but 0.9.1_beta6 built a liblvm-10.so but no
> > liblvm-10.a.
> 
> Yeah, the latest CVS now builds liblvm-10.a instead of just liblvm.a (That
> was an oversight on my part :( )

Ah.

> > Liblvm.a could not be reduced - the reduction tool was expecting to
> > find a "PIC archive library" containing "individual shared objects"
> > with .os suffixes.
> 
> Hmm...interesting.  Which reduction tool is this?  I haven't dealt with this
> before, but it definitely would be worth supporting.

mklibs.sh, originally by Marcus Brinkmann.

http://cvs.debian.org/cgi-bin/viewcvs.cgi/~checkout~/boot-floppies/scripts/rootdisk/mklibs.sh

The last one I tried was revision 1.17, but it the lastest looks ok.

Very effective on glibc:

-rw-r--r--    1 root     root       887712 Mar 26 10:35 /lib/libc-2.1.3.so
-rw-r--r--    1 root     root       369964 Mar 28 23:11 libc-2.1.3.so

This was a big help in getting a 2.4 kernel and an initrd with the needed
LVM files onto a 1.44MB floppy!

Regards,

Mark.
