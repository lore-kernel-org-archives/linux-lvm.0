Message-ID: <1363106460.24725.236.camel@code.and.org>
From: James Antill <james@fedoraproject.org>
Date: Tue, 12 Mar 2013 12:41:00 -0400
In-Reply-To: <20130312144129.GA13459@redhat.com>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
	<1363095972.24725.231.camel@code.and.org>
	<20130312144129.GA13459@redhat.com>
Mime-Version: 1.0
Sender: James Antill <james@mail.and.org>
Content-Transfer-Encoding: 8bit
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
To: Mike Snitzer <msnitzer@fedoraproject.org>
Cc: okozina@fedoraproject.org, yum-devel@lists.baseurl.org, linux-lvm@redhat.com

On Tue, 2013-03-12 at 10:41 -0400, Mike Snitzer wrote:
> On Tue, Mar 12 2013 at  9:46am -0400,
> James Antill <james@fedoraproject.org> wrote:
> 
> > On Mon, 2013-03-11 at 17:25 -0400, Mike Snitzer wrote:
> > > Add a "yum_fs_snapshot_<trans_id>_<origin_volume>" LVM tag to LVM-based
> > > snapshots (old or thinp).  These tags will allow tools (e.g snapper) to
> > > link the pre and post snapshot volumes together.
> > > 
> > > yum_fs_snapshot_trans_id() uses the first 16 digits of the hash() of the
> > > rpm TransactionSet instance to establish a unique id that is common to
> > > both the pretrans_hook() and posttrans_hook() -- this is quite the hack;
> > > I'm open to using other (more future-proof) methods.
> > 
> >  Esp. as hash(ts.ts) is just the address of the pointer for that object
> > in C.
> >  It depends what you want, I guess.
> 
> I couldn't figure out how to store anything in pretrans_hook() and
> retrieve it in posttrans_hook().  Use of a global caused the plugin to
> fail silently.

 Using globals should work, the only real problem is if some python API
creates multiple YumBase() instances (but although we've worried about
that, nothing has ever really done it AFAIK).
 The common way is to just stuff something unique in the yum base object
(base.__plugin_fssnap_whatever = blah).

[...]

> I like the idea of using the actual future rpmDB version; but as you
> note it won't be unique on its own if you undo a transaction.  SO this
> is the incremental change I came up with.  I'll post v2 of the 4/2 patch
> with these chnages folded in:
[...] 
> -def yum_fs_snapshot_trans_id(ts):
> +def yum_fs_snapshot_trans_id(conduit):
>      # return pseudo yum transaction id string
>      # this string is identical for both {pre,post}trans_hook
> -    yum_ts_hash = "%d" % abs(hash(ts.ts))
> -    return "yum_fs_snapshot_" + yum_ts_hash[:16]
> +    tsInfo = conduit.getTsInfo()
> +    # using hash of tsInfo purely to get unique number that isn't tied to rpmDB
> +    tsInfo_hash = "%d" % (abs(hash(tsInfo)))
> +    frpmdbv = tsInfo.futureRpmDBVersion()
> +    return "yum_fs_snapshot_%s_%s" % (tsInfo_hash[:8], frpmdbv)

 I still worry about how unique "abs(hash(ts.ts))" will be over multiple
runs ... is the reason for not using a timestamp just that you don't
know where to store it?
