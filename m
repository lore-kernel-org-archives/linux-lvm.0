Return-Path: <thornber@btconnect.com>
Date: Fri, 18 May 2001 18:07:05 +0100
Subject: Re: [linux-lvm] Re: [lvm-devel] 1.2 direc
Message-ID: <20010518180704.A1318@66bassett.freeserve.co.uk>
References: <20010517105534.A18295@sistina.com> <200105171715.f4HHFBJO023419@webber.adilger.int> <20010518124903.B24724@sistina.com> <20010518165240.5B6A8183F3@skuld.wk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010518165240.5B6A8183F3@skuld.wk>; from chewie@wookimus.net on Fri, May 18, 2001 at 11:52:40AM -0500
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

Chad,

Thanks for the info, I'll definitely have a look.

- Joe

On Fri, May 18, 2001 at 11:52:40AM -0500, Chad C. Walstrom wrote:
> Regarding debugging output, I just recently spent some time playing
> with GNU Nana, a library for assertion checking and logging in GNU
> C/C++.  It has some very interesting and useful features:
> 
>    GNU Nana is a free library providing improved support for assertion
>    checking (as in assert.h) and logging (printf style debugging) in GNU
>    C and C++. It provides support for some of the ideas of Eiffel, VDM, Z
>    and Anna in GNU C/C++. GNU Nana was developed by Phil Maker.
>    
>    For full documentation, see [1]the Nana manual. or the online manual
>    available at [2]www.gnu.org/manual/nana/index.html.
>    
>     Features
>     
>      * Space/time efficient, at least compared to assert.h. For example
>        assert(i >= 0) uses 53 bytes on the x86, while Nana uses either 10
>        bytes or 1.
>      * Support for predicate calculus (``for all,'' ``exists,'' and so
>        on) is provided using both C style for loops and C++ STL iterators
>        over container classes.
>      * Assertions can refer to saved state; for exaple, the return value
>        of a sort function can be checked against the arguments on
>        function entry.
>      * Logging messages can be redirected to a variety of destinations
>        including files, processes (for automated testing or
>        visualisation) or circular buffers in core.
>      * Assertions about time can be made in a simple manner.
>      * Lists of invariant checking or printing functions can be created
>        which can then be called to check internal consistency or display
>        state.
>      * All of the features can be selectively enabled or disabled at both
>        compile and run time.
> 
> Not mentioned in this list is that the logging and assertion calls can
> be made either in native C or entirely in gdb commands.  It's very
> slick, and I plan on incorporating it in any C or C++ coding projects
> I work on.
> 
> Anyway, this may afford you some more flexibility in how you use
> debugging messages, assertion checking, etc.  Hope this info is
> helpful.
> 
> --
> Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
> http://www.wookimus.net/                            | s.k.a. gunnarr
> Key fingerprint = B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
