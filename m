From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot resizing bug (LVM1)
Message-ID: <20030206112752.B22450@sistina.com>
References: <A00B669E-3934-11D7-A9B9-0003937830E4@mac.com>
Mime-Version: 1.0
In-Reply-To: <A00B669E-3934-11D7-A9B9-0003937830E4@mac.com>; from dalestephenson@mac.com on Wed, Feb 05, 2003 at 01:07:01PM -0500
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
Date: Thu Feb  6 04:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dale,

thanks for finding this bug.
Obviously people don't resize populated snapshots very often or we'ld
seen this one much earlier ;)
Your fix is in LVM_BRANCH_1-0 for everybody to test.

We plan to revert CVS and will announce the change seperately.

Regards,
Heinz    -- The LVM Guy --


On Wed, Feb 05, 2003 at 01:07:01PM -0500, Dale J. Stephenson wrote:
> I've discovered a problem with using lvreduce/lvextend on LVM.  The 
> resized snapshot will have a new exception table and hash table 
> allocated for it.  But lvm_hash_link will be called for these in a loop 
> that depends on the lv_remap_ptr counter passed down from userspace -- 
> which will always be zero.  The result is that existing COW on the 
> snapshot are ignored, and the contents of the snapshot can magically 
> change to reflect the current state of the source volume.  Reboot (or 
> deactivating and reactivating the volume group) should solve the 
> problem, although it may be possible in the meantime to store a new COW 
> exception for a chunk that already has one.
> 
> The fix is simple:
> 
> --- lvm.c.orig  Tue Feb  4 18:36:58 2003
> +++ lvm.c       Tue Feb  4 18:43:26 2003
> @@ -2792,7 +2792,7 @@
>                  old_lv->lv_snapshot_hash_mask =
>                      new_lv->lv_snapshot_hash_mask;
> 
> -               for (e = 0; e < new_lv->lv_remap_ptr; e++)
> +               for (e = 0; e < old_lv->lv_remap_ptr; e++)
>                          lvm_hash_link(new_lv->lv_block_exception + e,
>                                        new_lv->lv_block_exception[e].
>                                        rdev_org,
> 
> As a side note, why not revert the main LVM cvs tree back to LVM 1.0.6? 
>   1.1 is dead.
> 
> Dale J. Stephenson
> dalestephenson@mac.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
