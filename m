From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <20011214233254.F855@lynx.no>
References: <20011214073506.A12990@math.ohio-state.edu> <20011214113804.I940@lynx.no> <wxxn10lcn70.fsf@nommo.uio.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wxxn10lcn70.fsf@nommo.uio.no>; from terjekv@math.uio.no on Sat, Dec 15, 2001 at 02:00:03AM +0100
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
Date: Sat Dec 15 00:31:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Dec 15, 2001  02:00 +0100, Terje Kvernes wrote:
> * Andreas Dilger
> > If you were really clever, you could write a script which checked
> > the free space in the snapshots every minute, and if they had less
> > than X PEs free, you extend the snapshot LV to have more free space.
> > If you run out of free PEs, you delete the oldest snapshot.
> 
>   heh. I was thinking of trying to get a snapshot taken every three
>   hours or so, and storing it until the next one came about. but of
>   course, you're right, I should check how much free space I have, and
>   keep a backlog until I _need_ the space. 
> 
>   come to think of it, it doesn't take that complicated a shell-script
>   to get this working. hm... :)

In fact, the LVM snapshots have a facility where you can have it wake a
process when the snapshot is more than X percent full.  You probably
couldn't do it with a shell script (it is an ioctl), but you could
either write a simple executable (e.g. lvmsnapwait 95 /dev/vgtest/lvtest),
or do it with Perl (there is a Perl ioctl module, whose name I have
forgotten).

This avoids polling for lots of snapshots of lots of LVs, and also prevents
you from over-committing PEs to snapshots.

Note that there is a system-wide hard limit of 255 LVs (ABS_MAX_LV).  The
problem is that LVM only has a single block major number, with 256 minor
numers, so you might have to do some kernel/tool hackery to exceed that.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
