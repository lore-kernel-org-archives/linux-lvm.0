Return-Path: <root@srv.sistina.com>
Date: Fri, 18 May 2001 12:49:03 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [lvm-devel] 1.2 direc
Message-ID: <20010518124903.B24724@sistina.com>
References: <20010517105534.A18295@sistina.com> <200105171715.f4HHFBJO023419@webber.adilger.int>
Mime-Version: 1.0
In-Reply-To: <200105171715.f4HHFBJO023419@webber.adilger.int>; from adilger@turbolinux.com on Thu, May 17, 2001 at 11:15:11AM -0600
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

On Thu, May 17, 2001 at 11:15:11AM -0600, Andreas Dilger wrote:
> Heinz, you write:
> > this mail probably got lost.
> 
> I got it OK, but what is the point in replying?  I think there is too
> much needless checking (for example) inside the LVM user code and you
> don't, and you are in charge of the LVM project.  I don't think more
> mail will make a difference, but here I go anyways.


Andreas,
let me first say that I appreciate your advice and input :)

But you missed my point in stating to your original mail entirely :-(.

The reason why I was wondering was the academic level of your points.

I'ld rather prefer a brief arguement *and* some handy proposals
to change the concept and/or the implementation what to start to address
with this mail and I appreciate it.

In principle I recommend that you (and everybody else who wants to go for
major changes) please come up with concrete proposals on lvm-devel
which directly address these major points:

- what the problem is (like below: "to many checks are done")
- is a fix really needed *because* it buys LVM a major adavntage
- concept of the fix (like your AIX example below)
- software components involved in change (lib modules changed/new, tools
  changed/new etc.)

Then all could participate in the discussuion before an enhancement patch
is created which doesn't get accepted eventually.

> 
> 
> > On Mon, Apr 30, 2001 at 11:03:17AM -0600, Andreas Dilger wrote:
> > > I will have to disagree here.  There are several reasons for this:
> > > - Running any of the LVM user tools with "-d" produces _far_ too much
> > >   output to be useful.  This makes debugging user problems a real chore,
> > 
> > That's the tradeof we need to pay in case we want to have decent tests
> > on actual parameters.
> 
> Yes, but if the library is structured correctly then parameters can all be
> checked, but only checked once.

See above: we don't have any reasonable proposal to restructure the library
           so far; come up with one please
> 
> > >   and basically impossible for the users themselves, because they can't
> > >   easily see where there is a real problem.
> > 
> > Andreas,
> > the -d option output has *never* ment to be used by a regular LVM user!
> > It is ment to create an output for the developers and comparable experts
> > because deep knowledge about the LVM internal concept, the library and the
> > metadata is needed in order to be able to read debug output of such kind.
> 
> But it is too long to look at for even an experienced user.  On my single
> disk laptop (11 partitions), I can get 25k lines during vgscan.  Surely
> this is not useful either.  I reduced it in my LVM code to 2.5k lines for
> the same vgscan just by removing _some_ of the redundant checking.
> 
> > >   A good example of why too
> > >   much output is an issue - until I had my own vgscan problem to debug,
> > >   NOBODY noticed that lvm_dir_cache() didn't work properly, and was
> > >   scanning devices each time it was called.
> > 
> > Let's stay on the ground here!
> > 
> > As we all know, in complex SW systems it is always possible, that things
> > like that are overlooked.
> > This is just an example that I don't have a code coverage tool in place :-(
> 
> Actually, this is a GOOD example of why too much debugging output (and too
> much redundant checking) is a bad thing.  I DON'T say we should simply turn
> off some debugging messages, since that would just hide the fact we are doing
> too many checks.  What I say is that we are doing too much redundant work,
> which in turn produces too much redundant output, and hides other problems
> because you can't do a line-by-line analysis of 25k lines of output.

Must be different tools.
I admit I had some thousand lines but not that many but I can use
shell and friends ;-)).

> 
> > > - Overhead is overhead, no matter how small it seems to be.  When you
> > >   start doing things many times for each disk, it slows things down,
> > >   especially when you start having hundreds of disks.
> > 
> > This is just an academic arguement, because we are talking 
> > about a bunch of additional, likely not noticable *cpu cycles*!
> 
> But nothing in life is free.  It is easy to say CPU cycles are not
> noticable, but if every program acts the same way then we go the
> direction of Microsoft where you need a new computer for each release
> of the software.  I'm not saying we need to remove functionality, but
> I don't think we should do USELESS work when it is clearly not needed.

Same thing: come up with a change concept *and* the argument what it buys
            us beside some likely not measurable CPU overhead.

> 
> There are still paths in the (stock LVM) code where we do O(n^3) sorting
> and such for PVs.  If you have 2, 3, or 10 PVs that is not noticable.
> If you have 250 PVs (as with big systems I worked on), then it is bad.

Accepted.

> 
> > >   This is probably (in conjunction with the lvm_dir_cache() problem)
> > >   the reason that the lvmtab* files were created - because it is too
> > >   slow to access each disk dozens of times.
> > 
> > This assumption is completely wrong!
> > 
> > The reason to create the lvmtab* file cache was the Linux slowed down
> > buffer cache behaviour when grown to its full possible size.
> > 
> > lvmtab* function enable accessing the LVM metadata by one file read rather
> > than multiple device reads which are much slower in case the buffer cache is
> > heavily populated.
> 
> But the reason it was slow to do direct device reads was because we were
> reading data 50x when it would be OK to only read it once - we probably
> read each PV 5x for each partition on the system.

Wrong.

We did never read data more than once from a PV because the second "read"
dame from a cache anyway!


> The reason the lvmtab*
> file cache is bad is because it opens the possibility that user tools see
> something different than what is on disk, maybe leading to corruption.

As already stated and the arguement won't become better :-(

Caches are there for performance *but* have coherency problems which need to
be addressed.

> 
> IMHO, this one reason why people can have working LVM configs, reboot and
> vgscan now fails to work - what WAS in lvmtab* was fine, but what is on
> the disk is not.
> 

If you can prove that a cache flaw causes what you say: let's fix it.
Can you?

> > > - If you have tools using "internal" liblvm routines (i.e. ones which do
> > >   not check parameters), this means to me that the library interface is
> > >   not defined correctly.
> > 
> > Which ones are you refering to here?
> 
> It is not currently clear which functions are be internal, and which
> ones are not.  That is itself a problem.

It might be just a problem in the doc that you are refering too???
IMHO it is extremly easy to find all functions *not* being called from
the tool level directly.

A ten minutes shell hack shows 53 internal functions out of 196:

pe_copy_to_disk vg_copy_to_disk vg_deactivate vg_read_from_pv
vg_setup_pointers_for_snapshots vg_status_get_count vg_status_get_namelist
pe_lock pe_unlock pv_change_all_pv_of_vg pv_change_all_pv_for_lv_of_vg
pv_check_active_in_all_vg pv_check_free pv_check_free_contiguous
pv_check_number pv_check_volume pv_copy_to_disk pv_flush 
pv_get_index_by_kdev_t pv_get_kdev_t_by_number pv_read_already_red 
pv_read_all_pe_of_vg pv_release_pe pv_reserve_pe pv_show_short 
pv_status_all_pv_of_vg pv_write_uuidlist pv_write_pe pv_write_with_pe
lv_check_consistency_all_lv lv_copy_to_disk lv_count_pe 
lv_get_index_by_kdev_t lv_get_index_by_number lv_get_le_on_pv 
lv_get_name lv_le_remap lv_read_byindex lv_read_all_lv 
lv_snapshot_use_rate lv_status_byindex lv_status_all_lv_of_vg 
lv_write_all_lv lvm_debug lvm_debug_enter lvm_debug_leave 
system_id_check_imported lvm_check_chars lvm_check_special 
lvm_create_uuid lvm_dir_cache_find lvm_tab_read lvm_tab_write

The 143 external functions are:
pe_copy_from_disk vg_cfgbackup vg_cfgrestore vg_check_active 
vg_check_exist vg_check_exist_all_vg vg_check_dir vg_check_name 
vg_check_consistency vg_check_consistency_with_pv_and_lv 
vg_check_online_all_pv vg_check_pe_size vg_check_active_all_vg 
vg_copy_from_disk vg_create vg_create_dir_and_group 
vg_create_dir_and_group_and_nodes vg_free vg_name_of_lv vg_remove 
vg_rename vg_read vg_read_with_pv_and_lv vg_remove_dir_and_group_and_nodes
vg_set_extendable vg_clear_extendable vg_setup_for_create 
vg_setup_for_extend vg_setup_for_merge vg_setup_for_reduce 
vg_setup_for_split vg_show vg_show_colon vg_show_with_pv_and_lv vg_write 
vg_write_with_pv_and_lv vg_status vg_status_with_pv_and_lv pv_change 
pv_check_active pv_check_in_vg pv_check_new pv_check_consistency 
pv_check_consistency_all_pv pv_check_name pv_check_part pv_copy_from_disk 
pv_find_all_pv_names pv_create_kdev_t pv_create_name_from_kdev_t pv_find_vg 
pv_get_index_by_name pv_get_size pv_get_size pv_move_pes pv_move_pe pv_read 
pv_read_pe pv_read_all_pv pv_read_all_pv_of_vg pv_read_uuidlist 
pv_setup_for_create pv_show pv_show_colon pv_show_all_pv_of_vg 
pv_show_all_pv_of_vg_short pv_show_pe pv_show_pe_text pv_status pv_write 
pv_write_all_pv_of_vg pv_name); lv_change_vgname lv_change_read_ahead 
lv_check_active lv_check_on_pv lv_check_contiguous lv_check_consistency 
lv_check_exist lv_check_name lv_check_stripesize lv_copy_from_disk 
lv_create_name lv_create_node lv_get_index_by_minor lv_get_index_by_name 
lv_init_COW_table lv_number_from_name_in_vg lv_read lv_read_COW_table 
lv_read_with_pe lv_release lv_rename lv_setup_for_create 
lv_setup_for_extend lv_setup_for_reduce lv_setup_COW_table_for_create lv_show 
lv_show_colon lv_show_all_lv_of_vg lv_show_current_pe lv_show_current_pe_text 
lv_status_byname lv_write lv_write_all_pv lvm_show_size basename system_id_set 
system_id_set_exported system_id_set_imported system_id_check_exported 
lvm_check_dev lvm_check_devfs lvm_check_extended_partition 
lvm_check_kernel_lvmtab_consistency lvm_check_partitioned_dev 
lvm_check_whole_disk_dev lvm_check_number lvm_check_uuid lvm_show_uuid 
lvm_dir_cache lvm_dont_interrupt lvm_get_col_numbers lvm_get_iop_version 
lvm_init lvm_interrupt lvm_lock lvm_partition_count lvm_error 
lvm_remove_recursive lvm_show_filetype lvm_unlock lvm_tab_create 
lvm_tab_get_free_vg_number lvm_tab_lv_check_exist lvm_tab_lv_read_by_name 
lvm_tab_vg_insert lvm_tab_vg_read_with_pv_and_lv lvm_tab_vg_read 
lvm_tab_vg_remove lvm_tab_vg_check_exist lvm_tab_get_free_blk_dev 
lvm_tab_vg_check_exist_all_vg 


> 
> > The bare boned internal functions are defined in the same file
> > as the external ones and are flagged as such.
> 
> I'm not talking about static functions inside of a single source file.

Sure.

> Internal functions (what ever is decided to be internal) should NOT be
> defined in the same header file as external functions.

Ok.
Can be easily changed based on the above lists.

> That doesn't mean
> they are inaccessible to user-space, but rather when people use them,
> they know they are internal (subject to change, no parameter checking, etc).
> 
> There should be a class of (high level) functions which are exposed to an
> application, and they have parameter checking.  These are the only ones
> exposed to the user/application (even the LVM user tools).  They do not
> allocate any data structs, they do not have access to the internals of the
> data structs.  They are completely independent of the on-disk LVM format,
> IOP version, in-memory struct format, etc.
> 
> There is another class of functions which interface with the kernel, that
> do not have parameter checking, but depend on kernel IOP version (i.e.
> the data struct format that the kernel is using).  There should be a class
> of functions that read data from the disks that validate the data, and
> depend on the data layout on disk.  There may be another class of functions
> which are internal and glue the whole thing together.
> 
> > > There is not a clear separation of what is part of the "interface" and
> > > what is "internal" to liblvm.  This is clearly a problem because each
> > > CLI tool is dependent upon the IOP version, which it should not be.
> > 
> > The only reason is, because tools make direct use of metadata items today.
> > 
> > My above idea based on the assumption of your possible SHLA could address
> > it because it would wrap metadata in the library completely.
> > 
> > Which solution do you have in mind complaining about liblvm this way?
> 
> Several possibilities exist without resorting to only having SHLA commands.
> You can define functions inside the library which do allocation of structs
> for the user code, and routines to access those structs to get information
> The user code never accesses the data structs directly.

That oberhead seems to be payed in order to achive that seperation :-(

> 
> For _example_:
> int lvm_pv_check(char *pv_name) verifies if a PV can be created on pv_name.
> pv_t *lvm_pv_create(char *pv_name) initializes a PV and returns a pointer to it.
> pv_t *lvm_pv_read(char *pv_name) reads existing PV data, returns pointer.
> vg_t *lvm_vg_create(char *vg_name, pv_t **, ...) creates a new VG, return ptr.
> vg_t *lvm_vg_read(vg_t *) reads existing VG data, returns pointer.
> int lvm_vg_pv_list(vg_t *, pv_t **) to return a list of PVs in a VG
> int lvm_vg_lv_list(vg_t *, lv_t **) to return a list of LVs in a VG
> int lvm_lv_le_list(lv_t *, le_t **) to return a list of LEs in a LV
> int lvm_lv_le_add(vg_t *, lv_t *, int num) to add 'num' LEs to a LV
> etc.
> 
> None of the _user_ code is ever allocating or accessing vg_t, pv_t, lv_t
> directly.  It does not matter if the IOP version changes, or the size of
> the structs change, because they never access them directly (that can be
> enforced by declaring vg_t, lv_t, pv_t, etc as opaque data types).

True.

> 
> In this example, lvm_vg_create() checks vg_name, but not each pv_t (except
> that pv_t != NULL), because it knows that pv_t was correct when it was
> created.  Likewise, lvm_vg_lv_list() does not check vg_t.  In lvm_lv_le_add()
> we only need to check that 'num' is smaller than the number of free (and
> possibly contiguous) LEs in the VG.
> 
> There would be another set of routines internally which manipulate the
> structs directly, but most applications (and hopefully not even the LVM
> user tools) will ever need to use these, because that ties you to internal
> structure layout, kernel interface, etc.
> 
> This isn't to say we don't need a low-level program (accessing internal
> functions) which allows an expert user to fix their broken VG, but if the
> high-level functions are designed correctly then the LVM user tools should
> not need to use anything else.
> 
> > > Well, if you are checking pv_name, vg_name, lv_name in each routine (even
> > > in cases where we are passed *vg, when do you stop?  Maybe we should call
> > > vg_check_consistency_with_pv_and_lv() at the start of every function?
> > 
> > You can't do that in every place because needs differ.
> > 
> > Just see my name checking example for this where
> > vg_check_consistency_with_pv_and_lv() can't be used at that
> > point, because the structure are not existing so far.
> > The name is not even stored in the existing structures in case a
> > configuration change is about to take place with vgextend, vgreduce,
> > lvcreate and the like.
> > 
> > > How do you trust _anything_ that is passed as an argument to a function?
> > > Just because the name is OK, it doesn't mean that the other data is OK????
> > 
> > This is ensured by additional checking calls.
> > 
> > My name checking example makes sense in the very place where it takes
> > place *because* the goal is just to check for that very name to be able
> > to exit with a clean error message in case the name's wrong.
> > 
> > In other places a check of a structure using ??_check_consistency()
> > functions will make sense.
> 
> You missed the point entirely.  I was being sarcastic in suggesting that we
> should call *_check_consistency() at the start of each function.  What I
> really mean is that if the data is checked ONCE when it is input, then it
> should be valid everywhere else as well.  Checking it 100 times does not make
> it more or less valid.  Checking it 1000 times does not change it.  Only one
> check is needed, and if that is done then it is enough.  Otherwise, you
> have the equivalent of:
> 
> do { vg_check_consistency_with_pv_and_lv() } while (1)

You want to stay sarcastic? ;-)

They were never checked that often as you know.

> 
> > > What I'm saying is that the only way to do things safely is to ensure you
> > > check data _once_ from wherever it is input, and thereafter it _has_ to be
> > > correct so checking it again will not make it more correct, so is pointless.
> > 
> > The data is checked once at every input.
> 
> No, the data is checked once at every input, and also once at the start of
> a function, in the middle of a function, at the start of each sub-function...

I already argued on different level needs:

User inout needs to be checked but the library function is decined to check
its input because it is called in a different context again for validity.

Do we have a concept to address both needs?

> 
> > Keep in mind that even in times of bulk configuration changes,
> > commands runs get delayed by shell loops or the like.
> 
> I don't (necessarily*) disagree that we need to check the input each time
> within a given program, but not multiple times within the same executable.

As mentioned: what about checking user input to reject invalid entries
              right away *and* make sure that functions are called with valid
              parameters?

> If execution speed can affect the outcome of a program, then the locking
> is broken, and nothing else.
> 
> (*) AIX has LVM set up as follows:  all of the high-level commands mkvg,
>     mklv, mkpv, etc are actually shell scripts that do parameter validation
>     and call small executables (not for use by users) that do the actual
>     work, but do not check any of their parameters to avoid re-checking
>     valid data each time the executable is run internal to a single "command".
>     It is up to the calling program to ensure the parameters are correct.

This is IMHO a contradiction to the point you made, that you don't like to
access structure members in the commands. If we eant to check an invalid
name of a pv or lv for eg. in the command, we need to call a check function
with that member. Another option would be to have a pile of new functions
with opaque parameter.

>     
>     In some cases it was very convenient to be able to use the low-level
>     (private) executables to do things like mirror a single PP, while the
>     "user" commands only allow you to mirror a whole LV.  For Linux LVM
>     where we have the library and source code that _might_ not be as big
>     a deal, since you could always write your own code to do what you want
>     (even if it would mean using the "internal" LVM routines, if there ever
>     are such a thing).
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
