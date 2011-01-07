Date: Fri, 7 Jan 2011 20:41:04 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110107204104.GN5910@agk-dp.fab.redhat.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<4082.44403.qm@web39301.mail.mud.yahoo.com>
	<1294315155.21712.91.camel@ubuntu>
	<158710.27807.qm@web39304.mail.mud.yahoo.com>
	<4D27772F.1060705@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D27772F.1060705@cfl.rr.com>
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: Brian Neu <proclivity76@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jan 07, 2011 at 03:27:27PM -0500, Phillip Susi wrote:
> I've been wondering this myself.  I thought I found it over at
> git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm.git/ but it
> hasn't seen any updates in 4 months and has been fully merged into
> Linus's tree.
 
I only update that when I have patches ready for Linus to pull.

The route for patches is:
  Email to dm-devel@redhat.com.

  Captured here:
    https://patchwork.kernel.org/project/dm-devel/list/?state=*
    (Patchwork state = New)

  Pulled into my working directory (quilt) here:
    http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/
and also copied here:
    ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/editing/patches/
(sometimes kernel.org is slower syncing changes)
  (Patchwork state = Under Review)

  Pulled into linux-next git.
  (Patchwork state = Awaiting Upstream)

  Finally when a batch is ready to send to Linus, a branch is
created here:
  git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm.git/
for Linus to pull.

  Pulled into Linus's tree.
  (Patchwork state = Accepted + Archived)


Joe's patches aren't quite ready to enter this workflow yet.  But look out
for them on dm-devel soon.

Alasdair
