Date: Tue, 12 Mar 2013 10:41:30 -0400
From: Mike Snitzer <msnitzer@fedoraproject.org>
Message-ID: <20130312144129.GA13459@redhat.com>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
	<1363095972.24725.231.camel@code.and.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363095972.24725.231.camel@code.and.org>
Subject: Re: [linux-lvm] [PATCH 4/2] fs snapshot plugin: add LVM tag to
 allow tools to link pre and post snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Antill <james@fedoraproject.org>
Cc: okozina@fedoraproject.org, yum-devel@lists.baseurl.org, linux-lvm@redhat.com

On Tue, Mar 12 2013 at  9:46am -0400,
James Antill <james@fedoraproject.org> wrote:

> On Mon, 2013-03-11 at 17:25 -0400, Mike Snitzer wrote:
> > Add a "yum_fs_snapshot_<trans_id>_<origin_volume>" LVM tag to LVM-based
> > snapshots (old or thinp).  These tags will allow tools (e.g snapper) to
> > link the pre and post snapshot volumes together.
> > 
> > yum_fs_snapshot_trans_id() uses the first 16 digits of the hash() of the
> > rpm TransactionSet instance to establish a unique id that is common to
> > both the pretrans_hook() and posttrans_hook() -- this is quite the hack;
> > I'm open to using other (more future-proof) methods.
> 
>  Esp. as hash(ts.ts) is just the address of the pointer for that object
> in C.
>  It depends what you want, I guess.

I couldn't figure out how to store anything in pretrans_hook() and
retrieve it in posttrans_hook().  Use of a global caused the plugin to
fail silently.

All I was going for was a unique number that was the same in both
pretrans_hook() and posttrans_hook().

>  My first guess is that you'd want roughly what the rest of yum uses,
> so:
> 
> rpmdbv  = self.rpmdb.simpleVersion(main_only=True)[0]
> frpmdbv = self.tsInfo.futureRpmDBVersion()
> 
> ...except things like yum history also get the real "future" rpmdbv
> after the transaction happens, which this can't (unless we can add the
> tags in post_trans? -- and then there are problems about what happens if
> we don't get there).
> 
>  This should identify the state of the system, and what will happen well
> enough ... but that means if the user does:
> 
> yum blah
> yum history undo last
> yum history undo last
> yum history undo last
> 
> ...you'll have multiple snapshots with the same tag (as the system will
> be in the same states from the packaging POV -- is this what you want?).
>  The other alternative is to just use a stored time.time(), of the first
> snapshot (or maybe that and the start rpmdbv?).

I like the idea of using the actual future rpmDB version; but as you
note it won't be unique on its own if you undo a transaction.  SO this
is the incremental change I came up with.  I'll post v2 of the 4/2 patch
with these chnages folded in:

diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 22582aa..1625564 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -43,11 +43,14 @@ lvm_key = "create_lvm_snapshot"
 dm_snapshot_merge_checked = 0
 dm_snapshot_merge_support = 0
 
-def yum_fs_snapshot_trans_id(ts):
+def yum_fs_snapshot_trans_id(conduit):
     # return pseudo yum transaction id string
     # this string is identical for both {pre,post}trans_hook
-    yum_ts_hash = "%d" % abs(hash(ts.ts))
-    return "yum_fs_snapshot_" + yum_ts_hash[:16]
+    tsInfo = conduit.getTsInfo()
+    # using hash of tsInfo purely to get unique number that isn't tied to rpmDB
+    tsInfo_hash = "%d" % (abs(hash(tsInfo)))
+    frpmdbv = tsInfo.futureRpmDBVersion()
+    return "yum_fs_snapshot_%s_%s" % (tsInfo_hash[:8], frpmdbv)
 
 def _fail(msg):
     raise PluginYumExit(msg)
@@ -262,8 +265,6 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
     mntpnt = volume["mntpnt"]
     kern_inst = True # Default to saying it might be.
     ts = conduit._base.rpmdb.readOnlyTS()
-    # save pseudo yum transaction id
-    yum_trans_id = yum_fs_snapshot_trans_id(ts)
     kern_pkgtup = yum.misc.get_running_kernel_pkgtup(ts)
     del ts
     if kern_pkgtup is not None:
@@ -299,6 +300,7 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
         return 1
     # Add tag to allow other tools (e.g. snapper) to link pre
     # and post snapshot LVs together
+    yum_trans_id = yum_fs_snapshot_trans_id(conduit)
     if add_lvm_tag_to_snapshot(conduit, yum_trans_id + "_" + orig_lvname, snap_device):
         return 1
     return 2
