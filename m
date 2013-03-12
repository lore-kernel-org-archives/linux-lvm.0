Message-ID: <1363095972.24725.231.camel@code.and.org>
From: James Antill <james@fedoraproject.org>
Date: Tue, 12 Mar 2013 09:46:12 -0400
In-Reply-To: <1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
Mime-Version: 1.0
Sender: James Antill <james@mail.and.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [Yum-devel] [PATCH 4/2] fs snapshot plugin: add LVM
 tag to allow tools to link pre and post snapshots
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

On Mon, 2013-03-11 at 17:25 -0400, Mike Snitzer wrote:
> Add a "yum_fs_snapshot_<trans_id>_<origin_volume>" LVM tag to LVM-based
> snapshots (old or thinp).  These tags will allow tools (e.g snapper) to
> link the pre and post snapshot volumes together.
> 
> yum_fs_snapshot_trans_id() uses the first 16 digits of the hash() of the
> rpm TransactionSet instance to establish a unique id that is common to
> both the pretrans_hook() and posttrans_hook() -- this is quite the hack;
> I'm open to using other (more future-proof) methods.

 Esp. as hash(ts.ts) is just the address of the pointer for that object
in C.
 It depends what you want, I guess.
 My first guess is that you'd want roughly what the rest of yum uses,
so:

rpmdbv  = self.rpmdb.simpleVersion(main_only=True)[0]
frpmdbv = self.tsInfo.futureRpmDBVersion()

...except things like yum history also get the real "future" rpmdbv
after the transaction happens, which this can't (unless we can add the
tags in post_trans? -- and then there are problems about what happens if
we don't get there).

 This should identify the state of the system, and what will happen well
enough ... but that means if the user does:

yum blah
yum history undo last
yum history undo last
yum history undo last

...you'll have multiple snapshots with the same tag (as the system will
be in the same states from the packaging POV -- is this what you want?).
 The other alternative is to just use a stored time.time(), of the first
snapshot (or maybe that and the start rpmdbv?).
