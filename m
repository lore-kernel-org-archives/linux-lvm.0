Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104301703.LAA11435@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Re: [lvm-devel] 1.2 directory heirarchy
Date: Mon, 30 Apr 2001 11:03:17 -0600 (MDT)
In-Reply-To: <20010430155827.B19810@sistina.com> from "Heinz J. Mauelshagen" at Apr 30, 2001 03:58:27 PM
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz writes:
> On Fri, Apr 27, 2001 at 04:34:43PM -0600, Andreas Dilger wrote:
> > If I could vent on an LVM pet peeve here...  When we re-organize the
> > structure of the LVM code, can we ensure that data is verified exactly
> > _once_?
> 
> Sure, this is a resonable recommendation at first glance ;-)
> 
> For everybodies information:
> the reason why Andreas recommends things like this is IMO, that LVM already
> has plenty of check functions which are called in multiple layers of
> the sofatware (like in the tools and in the library itself).
> 
> For eg. the tool layer which has the need to check the name of a PV
> handed in on the command line, calls pv_check_name() in order to display an
> error message in case of a crappy name and exits.
> 
> If that PV name is passed into a library routine it will be checked again
> using pv_check_name() because the function takes care that it gets called
> with reasonable parameters.
> 
> IMO this doesn't imply bad interface abstraction at all.
> It just addresses different needs of different levels in the LVM software
> *but* has the tradeof of calling the same check functions multiple times.

I will have to disagree here.  There are several reasons for this:
- Running any of the LVM user tools with "-d" produces _far_ too much
  output to be useful.  This makes debugging user problems a real chore,
  and basically impossible for the users themselves, because they can't
  easily see where there is a real problem.  A good example of why too
  much output is an issue - until I had my own vgscan problem to debug,
  NOBODY noticed that lvm_dir_cache() didn't work properly, and was
  scanning devices each time it was called.
- Overhead is overhead, no matter how small it seems to be.  When you
  start doing things many times for each disk, it slows things down,
  especially when you start having hundreds of disks.  This is probably
  (in conjunction with the lvm_dir_cache() problem) the reason that the
  lvmtab* files were created - because it is too slow to access each
  disk dozens of times.  However having data in lvmtab* different from
  on disk is itself a source of problems.
- If you have tools using "internal" liblvm routines (i.e. ones which do
  not check parameters), this means to me that the library interface is
  not defined correctly.  There should be well defined interfaces to LVM
  (i.e. kernel interface routines, external interface routines, internal
  routines), and programs should only normally use external routines.
  If they do anything else, and it breaks, they get to keep both pieces.

> This might be seen as an overhead but we should pay it because the
> LVM library is in principle designed to be used by different CLIs or GUIs.
> In this regard the checks need to stay in place in order to recognize bad
> actual arguments and to return an error code then.

Yes, but only in _principle_ do other CLIs or GUIs use liblvm.  One reason
is that too much of the actual interface is inside the command-line commands.
There is not a clear separation of what is part of the "interface" and what
is "internal" to liblvm.  This is clearly a problem because each CLI tool
is dependent upon the IOP version, which it should not be.

> > In between, we should assume that it is correct
> > otherwise madness will quickly follow.
> 
> It depends on your definition of madness :-)

Well, if you are checking pv_name, vg_name, lv_name in each routine (even
in cases where we are passed *vg, when do you stop?  Maybe we should call
vg_check_consistency_with_pv_and_lv() at the start of every function?  How
do you trust _anything_ that is passed as an argument to a function?  Just
because the name is OK, doesn't mean that any of the other data is OK????

What I'm saying is that the only way to do things safely is to ensure you
check data _once_ from wherever it is input, and thereafter it _has_ to be
correct so checking it again will not make it more correct, so is pointless.

Cheers, Andreas
-- 
Andreas Dilger                               TurboLabs filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
