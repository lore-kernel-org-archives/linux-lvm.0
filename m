From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20030327174440.A2111@uk.sistina.com>
References: <20030327102520.GA13565@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030327102520.GA13565@fib011235813.fsnet.co.uk>; from joe@fib011235813.fsnet.co.uk on Thu, Mar 27, 2003 at 10:25:20AM +0000
Subject: [linux-lvm] Re: Patchset 2.4.20-dm-10
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
Date: Thu Mar 27 11:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@sistina.com
Cc: linux-lvm@sistina.com, lvm-devel@sistina.com

On Thu, Mar 27, 2003 at 10:25:20AM +0000, Joe Thornber wrote:
> http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-10.tar.bz2
 
I've uploaded a new device-mapper tarball corresponding to this:

  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper.0.96.08.tgz

The tarball contains up-to-date combined patches for 2.4.20,
incorporating a few minor bug fixes and a little restructuring.
(NB The 2.4.19 patches in the tarball have *not* been updated.)

The userspace library has been updated to prepare for a device-mapper
API fix planned for the next release.

  The fix is to a few field definitions in the dm_ioctl structure and
  the change itself is not backwards-compatible.  But, as of this release,
  if the userspace library is *compiled against* a kernel tree that uses
  the *new* dm_ioctl definition, then the library will, if necessary,
  automatically fall back at *runtime* to using the old definition.
  In other words, provided this libdevmapper is compiled against the
  new definition, kernels/modules using the different definitions can 
  be interchanged without having to interchange libdevmapper.so.
  'configure --disable-compat' turns off this behaviour.

Alasdair
-- 
agk@uk.sistina.com
