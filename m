Message-Id: <199908240744.JAA09505@pcrz64.HRZ.Uni-Marburg.DE>
Subject: Re: [linux-lvm] LVM and Debian 
In-reply-to: ahzz's message of Mon, 23 Aug 1999 09:12:44 -0500.
	     <19990823091244.D23814@yamato.terrabox.com> 
From: "Thomas Gebhardt" <gebhardt@HRZ.Uni-Marburg.DE>
Mime-Version: 1.0
Date: Tue, 24 Aug 1999 09:44:02 +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

> > I haven't actually compiled the tools under debian myself.  Debian does
> > not have /usr/include/linux matching up with the kernel release, so any
> > patches you might do to the kernel won't show up.
> >=20
> 
> 	Actualy you are supposed to symlink /usr/include/linux to /usr/src/linux/i=
> nclude/linux. I'm told by the head honchos at Debian that this method has b=
> een semi-officialy endorsed as the proper method instead of installing the =
> .h files in /usr/include/linux. If you do it this way you find all the patc=
> hes include files as well.

here is the rationale of the /usr/include/linux vs.
/usr/src/linux/include/linux issue.
(sorry, I don't have any reference to this, so I have to include
 all the text here)
Basically the kernel headers match the kernel. The /usr/include headers
match the program development tools. This allows to separate
kernel and libc development.

Here is the story:

-------------------------------------------------------------------

 The headers were included in libc5-dev after a rash of very
 buggy alpha kernel releases (1.3.7* or something like that) that
 proceeded to break compilations, etc.  Kernel versions are changed
 far more rapidly than libc is, and there are higer chances that
 people install a custom kernel than they install custom libc.

	libc6 includes it's own version of /usr/include/linux and
 friends form the beginning (that is, this is no longer a Debian only
 feature, the upstream version has moved to this scheme as well).

>> "Linus" == Linus Torvalds said on Wed, 22 Jan 1997:

Linus> The kernel headers used to make sense exporting to user space,
Linus> but the user space thing has grown so much that it's really not
Linus> practical any more. The problem with Debian is just that they
Linus> are different, not that they are doing anything wrong. That
Linus> leads to differences between the distributions, and that in
Linus> turn obviously can result in subtle problems.

Linus> As of glibc, the kernel headers will really be _kernel_
Linus> headers, and user level includes are user level
Linus> includes. Matthias Ulrich did that partly because I've asked
Linus> him to, but mainly just because it is no longer possible to try
Linus> to synchronize the libc and the kernel the way it used to
Linus> be. The symlinks have been a bad idea for at least a year now,
Linus> and the problem is just how to get rid of them
Linus> gracefully. Personally, I'm counting on glibc, which we are
Linus> already using on alpha.

Linus> Just to give you some idea of exactly why the includes really
Linus> can't be handled by simple symlinks: the main problem is
Linus> version skew. Lots of people want to upgrade their library
Linus> without affecting the kernel, and probably even more people
Linus> want to be able to upgrade their kernel without affecting their
Linus> compilation environment. Right now doing that has been
Linus> extremely fragile.

Linus> Just to give _one_ example of why the symlinks are bad: NR_OPEN
Linus> and "fd_set". I have had no end of problems making NR_OPEN
Linus> larger in the kernel, exactly _because_ of the damn
Linus> sym-links. If I just make NR_OPEN larger (the right thing to
Linus> do), the problem is that people with old libraries will now
Linus> compile against a header file that doesn't match the library
Linus> any more. And when the library internally uses another NR_OPEN
Linus> than the new program does, "interesting" things happen.

Linus> In contrast, with separate header files, this doesn't make any
Linus> difference.  If I change NR_OPEN in the kernel, the compilation
Linus> environment won't notice UNTIL the library and associated
Linus> header files are changed: thus the user will contine to compile
Linus> with the old values, but because we'll still be binary
Linus> compatible, the worst thing that happens is that new programs
Linus> won't take advantage of new features unless the developer has
Linus> upgraded his library. Compare that to breaking subtly.

Linus> NR_OPEN is just _one_ example, and actually it's one of the
Linus> easier ones to handle (because the only thing that really makes
Linus> much of a difference when it comes to NR_OPEN is the fd_set
Linus> size - but it certainly bit some people). Another major problem
Linus> is name-space pollution: the POSIX/ANSI/XOpen rules are not
Linus> only complex, but they are actually contradictory too. And the
Linus> kernel header files really can't reasonably support all of the
Linus> intricacies very cleanly.

Linus> One specific example of why we want separate header files for
Linus> libraries and kernel is offered by glibc: Matthias wanted to
Linus> have a "sigset_t" that will suffice for the future when the
Linus> POSIX.1b realtime signals are implemented. But at the same time
Linus> he obviously wants to be able to support programmin on
Linus> Linux-2.0 and the current 2.1 that do not have that support.

Linus> The _only_ reasonably clean way to handle these kinds of
Linus> problems is to have separate header files: user programs see a
Linus> larger sigset_t, and then the library interaction with the
Linus> kernel doesn't necessarily use all of the bits, for
Linus> example. Then later, when the kernel support is actually there,
Linus> it's just a matter of getting a new shared library, and voila,
Linus> all the realtime signals work.

Linus> The symlink approach simply wouldn't work for the above: that
Linus> would have required everybody who uses the library to have a
Linus> recent enough kernel that whatever magic all the above entails
Linus> would be available in the kernel header files. But not only
Linus> don't I want to pollute the kernel header files with user level
Linus> decisions, it's actually possible that somebody wants to run
Linus> glibc on a 1.2.x kernel, for example. We _definitely_ do not
Linus> want him to get a 32-bit sigset_t just because he is happy with
Linus> an old kernel.

Linus> Anyway, this email got longer than intended, but I just wanted
Linus> to make clear that the symlinks will eventually be going away
Linus> even in non-Debian distributions. Debian just happened to do it
Linus> first - probably because Debian seems to be more interested in
Linus> technical reasons than any old traditions. And technically, the
Linus> symlinks really aren't very good.

Linus> The _only_ reason for the symlinks is to immediately give
Linus> access to new features in the kernel when those happen. New
Linus> ioctl numbers etc etc. That was an overriding concern early on:
Linus> the kernel interfaces expanded so rapidly even in "normal"
Linus> areas that having the synchronization that symlinks offered was
Linus> a good thing.

Linus> However, the kernel interfaces aren't really supposed to change
Linus> all that quickly any more, and more importantly: the technical
Linus> users know how to fix things any way they want, so if they want
Linus> a new ioctl number to show up they can actually edit the header
Linus> files themselves, for example. But having separation is good
Linus> for the non-technical user, because there are less surprises
Linus> and package dependencies.

Linus> Anyway, something like the patch that David suggested will
Linus> certainly go in, although I suspect I'll wait for it to become
Linus> "standard" and the glibc first real release to take place.


        Add to that the fact that few programs really need the more
 volatile elements of the header files (that is, things that really
 change from kernel version to kernel version), [before you reject
 this, consider: programs compiled on one kernel version usually work
 on other kernels].

        So, it makes sense that a set of headers be provided from a
 known good kernel version, and that is sufficient for compiling most
 programs, (it also makes the compile time environments for programs
 on debian machines a well known one, easing the process of dealing
 with problem reports), the few programs that really depend on cutting
 edge kernel data structures may just use -I/usr/src/linux/include
 (provided that kernel-headers or kernel-source exists on the system).

        Most programs, even if they include <linux/something.h>, do
 not really depend on the version of the kernel, as long as the kernel
 versions are not too far off, they will work. And the headers
 provided in libc5-dev (and libc6-dev) are just that. 

        libc5-dev is uploaded frequently enough that it never lags too
 far behind the latest released kernel. libc6 has totally disconnected
 the included headers from kernel headers.

        There are two different capabilities which are the issue, and
 the kernel-packages and libc{5,6}-dev address different ones:

 a) The kernel packages try tp provide a stable, well behaved kernel
    and modules, and may be upgraded whenever there are significant
    advances in those directions (bug fixes, more/better module
    support, etc).  These, however, may not have include files that
    are non-broken as far as non-kernel programs are concerned, and
    the quality of the development/compilation environment is not the
    kernel packages priority (Also, please note that the kernel
    packages are tied together, so kernel-source, headers, and image
    are produced in sync)

 b) Quality of the development/compilation environment is the priority
    of libc{5,6}-dev package, and it tries to ensure that the headers it
    provides would be stable and not break non-kernel programs. This
    assertion may fail for alpha kernels, which may otherwise be
    perfectly stable, hence the need for a different set of known-good
    kernel include files.
