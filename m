Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Fri, 5 Jan 2001 15:34:51 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [lvm-devel] Re: [linux-lvm] LVM 0.9 vgscan problem
Message-ID: <20010105153451.B27289@srv.t-online.de>
References: <20010105123820.A1886@gondor.com> <Pine.LNX.4.21.0101050956050.1295-100000@duckman.distro.conectiva>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0101050956050.1295-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Fri, Jan 05, 2001 at 09:57:34AM -0200
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

On Fri, Jan 05, 2001 at 09:57:34AM -0200, Rik van Riel wrote:
> On Fri, 5 Jan 2001, Jan Niehusmann wrote:
> > On Thu, Jan 04, 2001 at 08:01:10PM -0200, Rik van Riel wrote:
> > > But when I type (with the IOP10 tools) the following
> > > all hell breaks loose:
> > > 
> > > # vgextend vg0 /dev/hda5    (the previously removed PV)
> > > 
> > > The oops is below.
> > 
> > This is already known, a fix is in cvs. (But I didn't try it, I
> > just remembered that somebody mentioned it on the mailinglist).
> 
> Then the all-important question:
> 
> Why the hell wasn't this bugfix given to Linus for
> inclusion in the 2.4.0 kernel ?
> 
> IMHO it is nothing but unresponsible to sit on bugfixes
> and not give them back to the maintainers of the main
> source repository (in this case, the kernel tarball).

Rik, nobody was "sitting" on bugfixes.
It just got fixed recently and still needed some testing before
making it into 2.4.0.
As I stated in my other email: Andrea Arcangeli's help to
integrate 0.9 into 2.4.0 brought it in. TTBOMK there was no
previous negotiation about 0.9 inclusion in 2.4.0 with us
before :-(

> 
> LVM folks: please send this patch to Linus, Alan and the
> list asap so we have a chance of a working LVM in 2.4.

We'll do that soon.

> 
> regards,
> 
> Rik
> --
> Virtual memory is like a game you can't win;
> However, without VM there's truly nothing to loose...
> 
> 		http://www.surriel.com/
> http://www.conectiva.com/	http://distro.conectiva.com.br/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
