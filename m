Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 12:19:34 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [lvm-devel] 1.2 directory heirarchy
Message-ID: <20010502121934.C30791@sistina.com>
References: <20010430155827.B19810@sistina.com> <200104301703.LAA11435@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200104301703.LAA11435@lynx.turbolabs.com>; from adilger@turbolinux.com on Mon, Apr 30, 2001 at 11:03:17AM -0600
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

On Mon, Apr 30, 2001 at 11:03:17AM -0600, Andreas Dilger wrote:
> Heinz writes:
> > On Fri, Apr 27, 2001 at 04:34:43PM -0600, Andreas Dilger wrote:
> > > If I could vent on an LVM pet peeve here...  When we re-organize the
> > > structure of the LVM code, can we ensure that data is verified exactly
> > > _once_?
> > 
> > Sure, this is a resonable recommendation at first glance ;-)
> > 
> > For everybodies information:
> > the reason why Andreas recommends things like this is IMO, that LVM already
> > has plenty of check functions which are called in multiple layers of
> > the sofatware (like in the tools and in the library itself).
> > 
> > For eg. the tool layer which has the need to check the name of a PV
> > handed in on the command line, calls pv_check_name() in order to display an
> > error message in case of a crappy name and exits.
> > 
> > If that PV name is passed into a library routine it will be checked again
> > using pv_check_name() because the function takes care that it gets called
> > with reasonable parameters.
> > 
> > IMO this doesn't imply bad interface abstraction at all.
> > It just addresses different needs of different levels in the LVM software
> > *but* has the tradeof of calling the same check functions multiple times.
> 
> I will have to disagree here.  There are several reasons for this:
> - Running any of the LVM user tools with "-d" produces _far_ too much
>   output to be useful.  This makes debugging user problems a real chore,

That's the tradeof we need to pay in case we want to have decent tests
on actual parameters.

>   and basically impossible for the users themselves, because they can't
>   easily see where there is a real problem.

Andreas,
the -d option output has *never* ment to be used by a regular LVM user!

It is ment to create an output for the developers and comparable experts because
deep knowledge about the LVM internal concept, the library and the metadata
is needed in order to be able to read debug output of such kind.

This for sure includes well experienced users of LVM who have that
knowledge too and therefore will likely know how to handle -d outputs.

>   A good example of why too
>   much output is an issue - until I had my own vgscan problem to debug,
>   NOBODY noticed that lvm_dir_cache() didn't work properly, and was
>   scanning devices each time it was called.

Let's stay on the ground here!

As we all know, in complex SW systems it is always possible, that things
like that are overlooked.
This is just an example that I don't have a code coverage tool in place :-(

That's why as many tests as possible are necessary and appreciated!

> - Overhead is overhead, no matter how small it seems to be.  When you
>   start doing things many times for each disk, it slows things down,
>   especially when you start having hundreds of disks.

This is just an academic arguement, because we are talking 
about a bunch of additional, likely not noticable *cpu cycles*!

The fact that LVM commands run *very* seldom in the average case makes
that even less perceptable.

Even in times of bulk updates it is not a big deal,
because shell scripts and the like delay LVM command starts.

>   This is probably
>   (in conjunction with the lvm_dir_cache() problem) the reason that the
>   lvmtab* files were created - because it is too slow to access each
>   disk dozens of times.

This assumption is completely wrong!

The reason to create the lvmtab* file cache was the Linux slowed down
buffer cache behaviour when grown to its full possible size.

lvmtab* function enable accessing the LVM metadata by one file read rather than
multiple device reads which are much slower in case the buffer cache is
heavily populated.

>   However having data in lvmtab* different from
>   on disk is itself a source of problems.

So you argue here that caching is a problem in itself? (I doubt it ;-)

Caches exist *because* there's higher priority performance reasons
to do it rather than avoiding additional cache code which might be
causing bugs potentially.
That's why LVM has metadata caching implemented (and other commercial
volume managers as well).


> - If you have tools using "internal" liblvm routines (i.e. ones which do
>   not check parameters), this means to me that the library interface is
>   not defined correctly.

Which ones are you refering to here?

The bare boned internal functions are defined in the same file
as the external ones and are flagged as such.

>   There should be well defined interfaces to LVM

Yep, 4 years ago they were well defined IMO :-)

But for sure if more than me start to think about the definition now, they
could be even better defined ;-)

>   (i.e. kernel interface routines, external interface routines, internal
>   routines), and programs should only normally use external routines.

They do.

>   If they do anything else, and it breaks, they get to keep both pieces.

Not the case IMHO.

> 
> > This might be seen as an overhead but we should pay it because the
> > LVM library is in principle designed to be used by different CLIs or GUIs.
> > In this regard the checks need to stay in place in order to recognize bad
> > actual arguments and to return an error code then.
> 
> Yes, but only in _principle_ do other CLIs or GUIs use liblvm.

Correct, didn't claim anything else, did I?

> One reason
> is that too much of the actual interface is inside the command-line commands.

Nope, didn't design it this way.

Maybe you are thinking of a new "super high level API" aka (SHLA), which is
basically wrapping the tools, here?

The tools call a couple of external library functions, check their return codes
in order to be able to display reasonable error messages and return
exit codes to the caller.

If my assumption WRT SHLA is correct, we could change
the tool code accordingly and add those new pvcreate(), lvcreate() etc.
functions to the library.

They needed to return new error codes then which could return status
to new tools in order to enable them to display existing error messages
and return the existing exit codes.

The new tools in turn would be smaller; basically usage() and switch on
new SHLA return code.


> There is not a clear separation of what is part of the "interface" and what
> is "internal" to liblvm.  This is clearly a problem because each CLI tool
> is dependent upon the IOP version, which it should not be.

The only reason is, because tools make direct use of metadata items today.

My above idea based on the assumption of your possible SHLA could address
it because it would wrap metadata in the library completely.

Which solution do you have in mind complaining about liblvm this way?

> 
> > > In between, we should assume that it is correct
> > > otherwise madness will quickly follow.
> > 
> > It depends on your definition of madness :-)
> 
> Well, if you are checking pv_name, vg_name, lv_name in each routine (even
> in cases where we are passed *vg, when do you stop?  Maybe we should call
> vg_check_consistency_with_pv_and_lv() at the start of every function?

You can't do that in every place because needs differ.

Just see my name checking example for this where
vg_check_consistency_with_pv_and_lv() can't be used at that
point, because the structure are not existing so far.
The name is not even stored in the existing structures in case a configuration
change is about to take place with vgextend, vgreduce, lvcreate and the like.

> How
> do you trust _anything_ that is passed as an argument to a function?  Just
> because the name is OK, doesn't mean that any of the other data is OK????

This is ensured by additional checking calls.

My name checking example makes sense in the very place where it takes
place *because* the goal is just to check for that very name to be able
to exit with a clean error message in case the name's wrong.

In other places a check of a structure using ??_check_consistency() functions
will make sense.

> 
> What I'm saying is that the only way to do things safely is to ensure you
> check data _once_ from wherever it is input, and thereafter it _has_ to be
> correct so checking it again will not make it more correct, so is pointless.

The data is checked once at every input.

*But* it is a command line argument being input and checked or
it is a function argument being input and checked.

So it gets checked twice based on completely different needs and
a some cpu cycles are spend on that once in a while.

Keep in mind that even in times of bulk configuration changes,
commands runs get delayed by shell loops or the like.

> 
> Cheers, Andreas
> -- 
> Andreas Dilger                               TurboLabs filesystem development
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
