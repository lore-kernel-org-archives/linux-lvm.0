From: "Stephen C. Tweedie" <sct@redhat.com>
Message-ID: <20011022230524.B4212@redhat.com>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002501c15a66$34f8d010$836788cf@industry>; from jlixfeld@fastvibe.com on Sun, Oct 21, 2001 at 03:25:56PM -0400
Subject: [linux-lvm] Re: What really works?
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
Date: Mon Oct 22 17:04:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Cc: ext3-users@redhat.com, linux-lvm@sistina.com

Hi,

On Sun, Oct 21, 2001 at 03:25:56PM -0400, Jason A. Lixfeld wrote:
> Folks, I'm really stressed here.  I'm sending this to both lists to see
> if anyone can offer any assistance.
 
> Anyway, 2.4.10-ac11 worked fine for about 5
> days.  We started to get low on space on the RAID so deleted stuff off
> of one of the LVMs to make room and then we moved stuff from the raid
> over to the LVM we had just free'd up space on.

We test ext3 extensively under load, but if it has particular problems
over LVM I'd be interested in knowing.  All I can suggest right now to
narrow things down is that you see whether ext2 works any better.

Just glancing over the LVM code, though, I don't think that their
locking code is safe in the presence of other filesystem activity.  

lvm_do_pe_lock_unlock does try to flush existing IO, but they do it
with

		pe_lock_req.lock = UNLOCK_PE;
		fsync_dev(pe_lock_req.data.lv_dev);
		pe_lock_req.lock = LOCK_PE;

which (a) doesn't wait for existing IO to complete if that IO was
submitted externally to the buffer cache (so it won't catch
raw IO, direct IO, journal activity, or RAID1 ios); and (b) it allows
new IO to be submitted while the fsync is going on, so when it
eventually sets LOCK_PE state again, we can have loads of new IO
freshly submitted to the device by the time the lock is re-asserted.  

LVM folks, am I missing something here?  I can't see how you can
assert that the device is truly quiescent after the LOCK_PE has been
set.  

The 1.0.1-rc4 code seems to be improved in that it does another
fsync_dev after finally setting LOCK_PE, but fsync_dev is still
inadequate here for any IO submitted directly via submit_bh(), rather
than through the buffer cache.  This bug would be more likely to hit
ext3 than ext2, as ext3 uses submit_bh directly for a lot of its
journal IO, but there are plenty of cases outside ext3 which will also
hit this problem.

Cheers,
 Stephen
