Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105171715.f4HHFBJO023419@webber.adilger.int>
In-Reply-To: <20010517105534.A18295@sistina.com> "from Heinz J. Mauelshagen at
 May 17, 2001 10:55:34 am"
Date: Thu, 17 May 2001 11:15:11 -0600 (MDT)
MIME-Version: 1.0
Subject: [linux-lvm] Re: [lvm-devel] 1.2 direc
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

Heinz, you write:
> this mail probably got lost.

I got it OK, but what is the point in replying?  I think there is too
much needless checking (for example) inside the LVM user code and you
don't, and you are in charge of the LVM project.  I don't think more
mail will make a difference, but here I go anyways.


> On Mon, Apr 30, 2001 at 11:03:17AM -0600, Andreas Dilger wrote:
> > I will have to disagree here.  There are several reasons for this:
> > - Running any of the LVM user tools with "-d" produces _far_ too much
> >   output to be useful.  This makes debugging user problems a real chore,
> 
> That's the tradeof we need to pay in case we want to have decent tests
> on actual parameters.

Yes, but if the library is structured correctly then parameters can all be
checked, but only checked once.

> >   and basically impossible for the users themselves, because they can't
> >   easily see where there is a real problem.
> 
> Andreas,
> the -d option output has *never* ment to be used by a regular LVM user!
> It is ment to create an output for the developers and comparable experts
> because deep knowledge about the LVM internal concept, the library and the
> metadata is needed in order to be able to read debug output of such kind.

But it is too long to look at for even an experienced user.  On my single
disk laptop (11 partitions), I can get 25k lines during vgscan.  Surely
this is not useful either.  I reduced it in my LVM code to 2.5k lines for
the same vgscan just by removing _some_ of the redundant checking.

> >   A good example of why too
> >   much output is an issue - until I had my own vgscan problem to debug,
> >   NOBODY noticed that lvm_dir_cache() didn't work properly, and was
> >   scanning devices each time it was called.
> 
> Let's stay on the ground here!
> 
> As we all know, in complex SW systems it is always possible, that things
> like that are overlooked.
> This is just an example that I don't have a code coverage tool in place :-(

Actually, this is a GOOD example of why too much debugging output (and too
much redundant checking) is a bad thing.  I DON'T say we should simply turn
off some debugging messages, since that would just hide the fact we are doing
too many checks.  What I say is that we are doing too much redundant work,
which in turn produces too much redundant output, and hides other problems
because you can't do a line-by-line analysis of 25k lines of output.

> > - Overhead is overhead, no matter how small it seems to be.  When you
> >   start doing things many times for each disk, it slows things down,
> >   especially when you start having hundreds of disks.
> 
> This is just an academic arguement, because we are talking 
> about a bunch of additional, likely not noticable *cpu cycles*!

But nothing in life is free.  It is easy to say CPU cycles are not
noticable, but if every program acts the same way then we go the
direction of Microsoft where you need a new computer for each release
of the software.  I'm not saying we need to remove functionality, but
I don't think we should do USELESS work when it is clearly not needed.

There are still paths in the (stock LVM) code where we do O(n^3) sorting
and such for PVs.  If you have 2, 3, or 10 PVs that is not noticable.
If you have 250 PVs (as with big systems I worked on), then it is bad.

> >   This is probably (in conjunction with the lvm_dir_cache() problem)
> >   the reason that the lvmtab* files were created - because it is too
> >   slow to access each disk dozens of times.
> 
> This assumption is completely wrong!
> 
> The reason to create the lvmtab* file cache was the Linux slowed down
> buffer cache behaviour when grown to its full possible size.
> 
> lvmtab* function enable accessing the LVM metadata by one file read rather
> than multiple device reads which are much slower in case the buffer cache is
> heavily populated.

But the reason it was slow to do direct device reads was because we were
reading data 50x when it would be OK to only read it once - we probably
read each PV 5x for each partition on the system.  The reason the lvmtab*
file cache is bad is because it opens the possibility that user tools see
something different than what is on disk, maybe leading to corruption.

IMHO, this one reason why people can have working LVM configs, reboot and
vgscan now fails to work - what WAS in lvmtab* was fine, but what is on
the disk is not.

> > - If you have tools using "internal" liblvm routines (i.e. ones which do
> >   not check parameters), this means to me that the library interface is
> >   not defined correctly.
> 
> Which ones are you refering to here?

It is not currently clear which functions are be internal, and which
ones are not.  That is itself a problem.

> The bare boned internal functions are defined in the same file
> as the external ones and are flagged as such.

I'm not talking about static functions inside of a single source file.
Internal functions (what ever is decided to be internal) should NOT be
defined in the same header file as external functions.  That doesn't mean
they are inaccessible to user-space, but rather when people use them,
they know they are internal (subject to change, no parameter checking, etc).

There should be a class of (high level) functions which are exposed to an
application, and they have parameter checking.  These are the only ones
exposed to the user/application (even the LVM user tools).  They do not
allocate any data structs, they do not have access to the internals of the
data structs.  They are completely independent of the on-disk LVM format,
IOP version, in-memory struct format, etc.

There is another class of functions which interface with the kernel, that
do not have parameter checking, but depend on kernel IOP version (i.e.
the data struct format that the kernel is using).  There should be a class
of functions that read data from the disks that validate the data, and
depend on the data layout on disk.  There may be another class of functions
which are internal and glue the whole thing together.

> > There is not a clear separation of what is part of the "interface" and
> > what is "internal" to liblvm.  This is clearly a problem because each
> > CLI tool is dependent upon the IOP version, which it should not be.
> 
> The only reason is, because tools make direct use of metadata items today.
> 
> My above idea based on the assumption of your possible SHLA could address
> it because it would wrap metadata in the library completely.
> 
> Which solution do you have in mind complaining about liblvm this way?

Several possibilities exist without resorting to only having SHLA commands.
You can define functions inside the library which do allocation of structs
for the user code, and routines to access those structs to get information
The user code never accesses the data structs directly.

For _example_:
int lvm_pv_check(char *pv_name) verifies if a PV can be created on pv_name.
pv_t *lvm_pv_create(char *pv_name) initializes a PV and returns a pointer to it.
pv_t *lvm_pv_read(char *pv_name) reads existing PV data, returns pointer.
vg_t *lvm_vg_create(char *vg_name, pv_t **, ...) creates a new VG, return ptr.
vg_t *lvm_vg_read(vg_t *) reads existing VG data, returns pointer.
int lvm_vg_pv_list(vg_t *, pv_t **) to return a list of PVs in a VG
int lvm_vg_lv_list(vg_t *, lv_t **) to return a list of LVs in a VG
int lvm_lv_le_list(lv_t *, le_t **) to return a list of LEs in a LV
int lvm_lv_le_add(vg_t *, lv_t *, int num) to add 'num' LEs to a LV
etc.

None of the _user_ code is ever allocating or accessing vg_t, pv_t, lv_t
directly.  It does not matter if the IOP version changes, or the size of
the structs change, because they never access them directly (that can be
enforced by declaring vg_t, lv_t, pv_t, etc as opaque data types).

In this example, lvm_vg_create() checks vg_name, but not each pv_t (except
that pv_t != NULL), because it knows that pv_t was correct when it was
created.  Likewise, lvm_vg_lv_list() does not check vg_t.  In lvm_lv_le_add()
we only need to check that 'num' is smaller than the number of free (and
possibly contiguous) LEs in the VG.

There would be another set of routines internally which manipulate the
structs directly, but most applications (and hopefully not even the LVM
user tools) will ever need to use these, because that ties you to internal
structure layout, kernel interface, etc.

This isn't to say we don't need a low-level program (accessing internal
functions) which allows an expert user to fix their broken VG, but if the
high-level functions are designed correctly then the LVM user tools should
not need to use anything else.

> > Well, if you are checking pv_name, vg_name, lv_name in each routine (even
> > in cases where we are passed *vg, when do you stop?  Maybe we should call
> > vg_check_consistency_with_pv_and_lv() at the start of every function?
> 
> You can't do that in every place because needs differ.
> 
> Just see my name checking example for this where
> vg_check_consistency_with_pv_and_lv() can't be used at that
> point, because the structure are not existing so far.
> The name is not even stored in the existing structures in case a
> configuration change is about to take place with vgextend, vgreduce,
> lvcreate and the like.
> 
> > How do you trust _anything_ that is passed as an argument to a function?
> > Just because the name is OK, it doesn't mean that the other data is OK????
> 
> This is ensured by additional checking calls.
> 
> My name checking example makes sense in the very place where it takes
> place *because* the goal is just to check for that very name to be able
> to exit with a clean error message in case the name's wrong.
> 
> In other places a check of a structure using ??_check_consistency()
> functions will make sense.

You missed the point entirely.  I was being sarcastic in suggesting that we
should call *_check_consistency() at the start of each function.  What I
really mean is that if the data is checked ONCE when it is input, then it
should be valid everywhere else as well.  Checking it 100 times does not make
it more or less valid.  Checking it 1000 times does not change it.  Only one
check is needed, and if that is done then it is enough.  Otherwise, you
have the equivalent of:

do { vg_check_consistency_with_pv_and_lv() } while (1)

> > What I'm saying is that the only way to do things safely is to ensure you
> > check data _once_ from wherever it is input, and thereafter it _has_ to be
> > correct so checking it again will not make it more correct, so is pointless.
> 
> The data is checked once at every input.

No, the data is checked once at every input, and also once at the start of
a function, in the middle of a function, at the start of each sub-function...

> Keep in mind that even in times of bulk configuration changes,
> commands runs get delayed by shell loops or the like.

I don't (necessarily*) disagree that we need to check the input each time
within a given program, but not multiple times within the same executable.
If execution speed can affect the outcome of a program, then the locking
is broken, and nothing else.

(*) AIX has LVM set up as follows:  all of the high-level commands mkvg,
    mklv, mkpv, etc are actually shell scripts that do parameter validation
    and call small executables (not for use by users) that do the actual
    work, but do not check any of their parameters to avoid re-checking
    valid data each time the executable is run internal to a single "command".
    It is up to the calling program to ensure the parameters are correct.
    
    In some cases it was very convenient to be able to use the low-level
    (private) executables to do things like mirror a single PP, while the
    "user" commands only allow you to mirror a whole LV.  For Linux LVM
    where we have the library and source code that _might_ not be as big
    a deal, since you could always write your own code to do what you want
    (even if it would mean using the "internal" LVM routines, if there ever
    are such a thing).
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
