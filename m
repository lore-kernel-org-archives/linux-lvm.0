From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1 tools build error on SPARC64 (was: lvm-1.0.1 kernel compile errors on SPARC64)
Message-ID: <20011205083756.B1040@tykepenguin.com>
References: <20011203164340.M1022@tykepenguin.com> <Pine.GSO.4.21.0112041349520.27570-100000@devmail.dev.tivoli.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0112041349520.27570-100000@devmail.dev.tivoli.com>
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
Date: Wed Dec  5 10:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 04, 2001 at 03:50:57PM -0600, Rich Scheller wrote:
> On Mon, 3 Dec 2001, Patrick Caulfield wrote:
> 
> > On Mon, Dec 03, 2001 at 09:36:04AM -0600, Rich Scheller wrote:
> > > This patch fixed the kernel build break.  Thanks!
> > > 
> > 
> > If that actually works (and I can think of no reason why it would not) can you
> > let me know and I'll send the patch to Dave Miller for inclusion in the stock
> > kernel.
> 
> Patrick,
> 
> Yes, using that patch, I was able to build a working 2.4.16+lvm_1.0.1
> kernel on our Sun Enterprise 250 and (after running into an LVM tools
> build problem, see below) I was able to build some test volume groups and
> volumes, create ext2 file systems on them, fill them with data, extend the
> file systems, etc.  If you have any specific tests that you'd like me to
> run, please let me know.  (My eventual goal is to create XFS or JFS file
> systems in LVM volumes on top of a software RAID5 array running under
> Linux on a Sun E450.)

Thanks for doing that, I'll get the patch off today. I tested the original
SPARC port pretty thoroughly so if the basics work the rest should be OK - barring
other bugs of course!

> After getting the kernel working, I ran into a completely different
> problem in the build of the lvm-1.0.1 tools.  The configure script created
> the file make.tmpl with CFLAGS set to "-g -O0 -Wall -pg".  The -pg
> (profiling) option is incompatible with shared libraries on the gcc SPARC
> compiler.  You get a whole bunch of these warnings:
> 
> cc1: warning: -fPIC and profiling conflict: disabling -fPIC
> 
> With -fPIC (Position Independant Code) disabled, the shared library
> liblvm-10.so.1 is generated, but it's unusable.  Any executable linked
> against this library gets a segmentation fault when the first function
> from this library is called.
> 
> I can't really think of a reason why you'd want to have profiling turned
> on for production code, so may I suggest that the CFLAGS option "-pg" be
> removed from the file make.tmpl.in?  That fixed the problem for me...

You're right, there's no reason that should be in the release Makefile - I'll
remove it, thanks for pointing it out.

patrick
