From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] next step of recovering from tha vgchange problem
Message-ID: <20011102140721.N746@lynx.no>
References: <20011102195538.A467@bunuel.tii.matav.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011102195538.A467@bunuel.tii.matav.hu>; from mag@bunuel.tii.matav.hu on Fri, Nov 02, 2001 at 07:55:38PM +0100
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
Date: Fri Nov  2 15:07:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Magosanyi Arpad <mag@bunuel.tii.matav.hu>
Cc: linux-lvm@sistina.com

On Nov 02, 2001  19:55 +0100, Magosanyi Arpad wrote:
> It seems that I have some "lost clusters" of extents. They are listed as
> belonging to the two logical volumes I got rid off.

Yes, I recently ran into this problem as well.  vgck is not very good
at doing anything to check these values.  I was accidentally running
an old version of LVM (partly patched Linus kernel) and when I tried
to lvreduce it would oops.  The LV data was correct (smaller size)
but the PEs were still allocated.  The point isn't that I had a bad
old kernel, but that vgck does not detect/fix these sorts of problems,
which (IMHO) is exactly what it should be doing.

It also turns out that vgcfgrestore is fundamentally broken when restoring
PV UUIDs, I had to always use uuid_fixer to get it to work (even if I tried
backing up the fixed VGDA and then restoring it).

> At the first sight, the sum of lv sizes is less than the
> size of all allocated extents. (only calculated roughly, so not sure)
> It is normal, or some inconsistency remaining?
> If it isn't ok, how to make my vg consistent?
> Is there any other source of inconsistency I am not aware of?

One problem in the design of LVM metadata is that values such as PE/LE
counts are stored in several places on disk, and depending on what piece
of code is used, you may get one or the other.  When everything is OK
it does not matter, in other times it does matter.

If you have time/effort/knowledge, I would suggest that rather than
trying to find/fix the original problem, you spend time trying to make
vgck better.  Put the function of uuid_fixer into vgck.  Make vgck only
read data directly from disk (if it does not already do so).  This will
not only help fix your current problem, but also help fix all other
problems in the future.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
