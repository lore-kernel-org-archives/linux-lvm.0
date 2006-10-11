Date: Wed, 11 Oct 2006 23:39:33 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20061011223933.GU17654@agk.surrey.redhat.com>
References: <1160580040.30654.18.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1160580040.30654.18.camel@hydrogen.msp.redhat.com>
Subject: [linux-lvm] Re: [LVM2 PATCH] mirror force resync option
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Brassow <jbrassow@redhat.com>
Cc: linux-lvm@redhat.com

On Wed, Oct 11, 2006 at 10:20:40AM -0500, Jon Brassow wrote:
> I view
> this as a bug in the 'deactivate_lv' code, since it should fail if
> it is unable to deactivate the lv on all nodes.

Correct, if that's true.  But the code doesn't show any deactivation
attempt!  (see below)

> +Enforce resynching the mirrored logical volumes.

Needs explaining better here for someone who doesn't know
what that means/involves:-)

> +	if (!(lv->status & MIRRORED))
> +		return 1;

Are you sure this shouldn't be an error?

> +	if (!lv_info(cmd, lv, &info, 0) || !info.exists)
> +		active = 0;

This is currently defined as telling you if the device is active on
the local node.  (Patrick's looking at extending it to the cluster.)

> +	if (active) {
> +		if (!deactivate_lv(cmd, lv)) {
> +			log_error("Unable to deactivate, %s, for sync status change", lv->name);
> +			log_error("Hint: %s may be in-use", lv->name);
> +			return 0;
> +		}

On a cluster, you need to call deactivate_lv *even if* it's not active on the
local node.  So test for the VG clustered flag and use that to decide
whether to do the lv_info/active test or not.  (That's only a local optimisation
normally to assist with the error messages.)

> +		/* Must activate log, or we can't zero it */
> +		if (!activate_lv(cmd, first_seg(lv)->log_lv)) {
> +			log_error("Unable to activate, %s, for sync status change",
> +				  first_seg(lv)->log_lv->name);
> +			activate_lv(cmd, lv);
> +			return 0;
> +		}

Interesting.   That extension to the interface needs more comment: you need to
demonstrate that the operation is either atomic (which it doesn't appear to be
at first sight), or else if it's not atomic, there must be no failure modes
that lead to corruption, or people thinking a complete resync got forced when
it actually didn't.

Normally you're not allowed to activate only part of a device tree - you can't
activate a mirror log except as part of the mirror.   Notice how lvcreate
and lvconvert manipulate the log independently before attaching it to the
mirror.  However the recent changes to prepare for stacked devices should be
sufficient for that particular activation to work, so that's probably acceptable
now.

A breakdown into atomic operations might be:
Detach the log (leaving the [inactive] mirror with a core log), wipe the log,
then reattach it.
Or you could introduce an additional metadata state to indicate the log
needs to be wiped, wipe it, then revert to the previous metadata state.
Or have a combination of both (so that a future lvchange -ay can complete
the process if interrupted).

> +		/*
> +		 * Note: there is no need to deactivate the log before
> +		 * we activate the mirror
> +		 */

Because of the stacking preparation now, yes, so long as set_lv() syncs the
block device correctly.

Alasdair
-- 
agk@redhat.com
