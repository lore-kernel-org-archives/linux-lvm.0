From: Rich Scheller <richs@dev.tivoli.com>
In-Reply-To: <20011203164340.M1022@tykepenguin.com>
Message-ID: <Pine.GSO.4.21.0112041349520.27570-100000@devmail.dev.tivoli.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvm-1.0.1 tools build error on SPARC64 (was: lvm-1.0.1 kernel compile
 errors on SPARC64)
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
Date: Tue Dec  4 15:49:08 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 3 Dec 2001, Patrick Caulfield wrote:

> On Mon, Dec 03, 2001 at 09:36:04AM -0600, Rich Scheller wrote:
> > This patch fixed the kernel build break.  Thanks!
> > 
> 
> If that actually works (and I can think of no reason why it would not) can you
> let me know and I'll send the patch to Dave Miller for inclusion in the stock
> kernel.

Patrick,

Yes, using that patch, I was able to build a working 2.4.16+lvm_1.0.1
kernel on our Sun Enterprise 250 and (after running into an LVM tools
build problem, see below) I was able to build some test volume groups and
volumes, create ext2 file systems on them, fill them with data, extend the
file systems, etc.  If you have any specific tests that you'd like me to
run, please let me know.  (My eventual goal is to create XFS or JFS file
systems in LVM volumes on top of a software RAID5 array running under
Linux on a Sun E450.)

After getting the kernel working, I ran into a completely different
problem in the build of the lvm-1.0.1 tools.  The configure script created
the file make.tmpl with CFLAGS set to "-g -O0 -Wall -pg".  The -pg
(profiling) option is incompatible with shared libraries on the gcc SPARC
compiler.  You get a whole bunch of these warnings:

cc1: warning: -fPIC and profiling conflict: disabling -fPIC

With -fPIC (Position Independant Code) disabled, the shared library
liblvm-10.so.1 is generated, but it's unusable.  Any executable linked
against this library gets a segmentation fault when the first function
from this library is called.

I can't really think of a reason why you'd want to have profiling turned
on for production code, so may I suggest that the CFLAGS option "-pg" be
removed from the file make.tmpl.in?  That fixed the problem for me...

-Rich

-- 
Rich Scheller    Build Strategy and Infrastructure Group
IBM SWG          rschelle@us.ibm.com
(Tivoli)         Voice: 512-436-8563  Tie-Line: 749-8563

    The love of Lotus Notes is the root of all evil.
