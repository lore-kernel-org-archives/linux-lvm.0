Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 11:29:48 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] some comments on the LVM source
Message-ID: <20010502112948.B30791@sistina.com>
References: <3AEDEFDB.6EB1AF8@gnu.org>
Mime-Version: 1.0
In-Reply-To: <3AEDEFDB.6EB1AF8@gnu.org>; from clausen@gnu.org on Tue, May 01, 2001 at 09:06:03AM +1000
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

Andrew,

thanks for providing your work results.

A general recommendation:
please provide a patch and a shorter explanation on what you want to
do change with it and why.


On Tue, May 01, 2001 at 09:06:03AM +1000, Andrew Clausen wrote:
> Hi,
> 
> I'm mainly looking at the userspace stuff here, because
> that's what I'm interested in ;-)
> 
> Comments:
> * liblvm.h is one monster file.  It would be nice to separate
> it up into smaller pieces.  Say, one (or more!) files for
> VG stuff, etc.

Yep, makes sense.

We are about to split the library up into a directory hirarchy and
therefor infividual .h files are likely anyway.

> 
> * the .c files are in one directory.  They should be split
> into subdirectories... makes it easier to find stuff

See above.

> 
> * lots of monster functions.  Monster functions are harder to
> understand and maintain.

That's not true.
It was designed exactly the other way.

The only functions which are "bigger" than 100 lines netto are:

- pv_release_pe()
- vg_setup_for_extend()
- vg_read_with_pv_and_lv()
- pv_read_all_pv()
- vg_cfgrestore()
- pv_read_all_pv_of_vg()
- lv_setup_for_extend()
- vg_setup_for_split()
- lv_setup_for_create()
- lvm_error()
- vg_cfgbackup()
- pv_move_pe()
- pv_move_pes()

Please remember: there are about *200* functions in the library.

> 
> I'll have a look at one function for you, so I can go a bit
> more in depth:
> 
> lvm_add_dir_cache() in LVM/0.9.1_beta7/tools/lib/lvm_dir_cache.c
> 
> The function is about 50 lines, which is on the large side.

50 lines == large function?

> 
> It is doing things on two layers of abstraction:
> 	* high layer: calling high level things like 
> 	lvm_dir_cache_hit(),
> 	* lower layer: reallocating memory for the cache,
> 	updating lower level variables, etc.
> It is usually a bad thing to do things.

Why?
The code is small already.

Anyway: I'm open for cleaner solutions and appreciate them.

Could you provide a patch against LVM 0.9.1 Beta 7
in order to ease integration?

> The fact that the
> function is also fairly large should have lead to a decision
> to split it up, by putting the lower level stuff into (static)
> helper functions.
> 
> The 4 layers of nesting also gives you a hint that you're
> handling too many levels of abstraction ;-)

That's an individual opinion on an individual scale ;-)

> 
> IMHO, the function should be roughly 10 lines, and the
> lower level code taken out into helper functions.
> 
> Also, you have an inconsistent interface to lvm_dir_cache().
> Most of the functions related to the lvm_dir_cache() are
> named lvm_dir_cache_XXX(), but you have lvm_add_dir_cache().

You've found a tiny notion bit.

> 
> Also, some functions ask for a "dircache" parameter, and others
> just use the global variable (since there is exactly one
> cache anyway).
> 
> Make up your mind!  In my example "cleaned version", I
> chose to use the global variables.  I guess it doesn't
> make a big difference (some ppl would argue global
> variables evil blah blah blah...)
> 
> So, something along the lines of:
> 
> static int _dir_cache_init_entry (dir_cache_t *entry,
> 				  char *dev_name) {
> 	struct stat stat_b;
> 
> 	if (stat (dev_name, &stat_b) == -1)
> 		return FALSE;
> 	if (lvm_check_dev (&stat_b, TRUE) == FALSE)
> 		return FALSE;
> 
> 	entry->dev_name = strdup (dev_name);
> 	if (!entry->dev_name) {
> 		fprintf (stderr, "malloc error in %s [line %d]\n",
>                          __FILE__, __LINE__);
> 		return FALSE;
> 	}
> 	entry->st_rdev = stat_b.st_rdev;
> 	entry->st_mode = stat_b.st_mode;
> 	return TRUE;
> }
> 
> static int _dir_cache_set_size (int size) {
> 	dir_cache_t	*dir_cache_sav = dir_cache;
> 
> 	dir_cache = realloc (dir_cache,
> 			     size * sizeof (dir_cache_t));
> 	if (dir_cache) {
> 		cache_size = size;
> 		return TRUE;
> 	} else {
> 		fprintf (stderr, "realloc error in %s [line %d]\n",
>                          __FILE__, __LINE__);
> 		return FALSE;
> 	}
> }
> 
> static int _dir_cache_set_entry (int num, dir_cache_t *entry) {
> 	memcpy (&dir_cache [num], entry, sizeof (dir_cache_t));
> 	return TRUE;
> }
> 
> static int _dir_cache_append (dir_cache_t *entry) {
> 	if (_dir_cache_set_size (cache_size + 1) == FALSE)
> 		return FALSE;
> 	return _dir_cache_set_entry (cache_size - 1, entry);
> }
> 
> int lvm_dir_cache_add (char *dev_name) {
> 	dir_cache_t	entry;
> 
> 	if (_dir_cache_init_entry (&entry, dev_name) == FALSE)
> 		return FALSE;
> 	if (lvm_dir_cache_hit (entry.st_rdev) == FALSE)
> 		return _dir_cache_append (&entry);
> 	return TRUE;
> }
> 
> /* below: need to change the lvm_dir_cache_hit() interface */
> 
> Obviously, a lot of this is personal preference.  But, I think
> the code here is much easier to understand, because each function
> operates on exactly one level of abstraction, and the style
> is consistent (we never pass around the dir_cache and cache_size
> variables... they are global).
> 
> Further things to improve;
> * more error handling could be added (why does stat fail?
> etc.)
> * common error handling - you probably want to have a more
> convienient how to report errors than fprintf (stderr, ...).
> You might be interested in the exception system in libparted
> (it's very very small ;-)
> * function entry / exit messages could be done with macros:
> 
> #define ENTER_FUNCTION \
> 	debug_enter (__FUNCTION__ "() -- ENTERING\n");
> #define LEAVE_FUNCTION(ret) \
> 	do {	\
> 		debug_leave (__FUNCTION__	\
> 			     "() -- LEAVING with ret: %d\n", ret); \
> 		return ret;	\
> 	} while (0);
> 
> /dev/clausen
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
