Return-Path: <thornber@btconnect.com>
Date: Wed, 18 Jul 2001 09:16:39 +0100
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010718091639.B382@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL> <20010717174008.A1000@btconnect.com> <20010717122318.A20564@d3.front>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010717122318.A20564@d3.front>; from ralph@oro.net on Tue, Jul 17, 2001 at 12:23:18PM -0700
From: Joe Thornber <thornber@btconnect.com>
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

On Tue, Jul 17, 2001 at 12:23:18PM -0700, Ralph Jennings wrote:
> On Tue, Jul 17, 2001 at 05:40:08PM +0100, Joe Thornber wrote:
> [snip]
> >    Here there's one % that we can't get rid of (we could also do chunk = 
> >    sector - (pe_size * index)), for the simple fact that the number of
> >    stripes is not a power of 2, so we can't replace with shifts and masks.
> > 
> >    I just had a chat with one of the EVMS guys, EVMS *does* have this
> >    exact same problem.
> > 
> >    Should we restrict stripes sets to powers of 2 ?
> [snip]
> 
> Why not just make a mod function?
> 
> Preceeding code not tested, but should work?
> It's been a while since I wrote C code.
> 
> BTW, what is a u64 (unsigned 64bit integer) in C called?
> Is there any uniform cross platform way to say it (like
> u64 perhaps)?

long long ?

> 
> u64 mod_64(u64 number, u64 modNum) {
>     while (number > modNum) {
>         number -= modNum;
>     }
>     return number;
> }

I'd like to see the flames if I put this into the driver :) The map
function is called on every io block to an LVM device, it needs to be
quick !  Since we know modNum is smallish, certainly less than 2^32,
and 'number' is 64 bit we could be running around your loop a few
times :)

On a more serious note this function should be provided by the
compiler, since it supports the 64 bit type.  I guess it is normally
implemented in a function that gets linked automatically - it would still
be good to get rid of it.

- Joe
