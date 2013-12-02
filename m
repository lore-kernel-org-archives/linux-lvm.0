Date: Mon, 2 Dec 2013 09:39:11 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20131202143911.GA5331@redhat.com>
References: <CADsoVx80SzPEnyyzmEFRppTHqBSsyuOuvN+q-eQAOxPd_VHgYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADsoVx80SzPEnyyzmEFRppTHqBSsyuOuvN+q-eQAOxPd_VHgYg@mail.gmail.com>
Subject: Re: [linux-lvm] LVM snapshot merge and corrupted file
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
To: Guilherme Moro <guilherme.moro@gmail.com>
Cc: linux-lvm@redhat.com

On Mon, Dec 02 2013 at  6:41am -0500,
Guilherme Moro <guilherme.moro@gmail.com> wrote:

> Hi,
> 
> I know that is a too broad question, but please be kind ;)
> The scenario:
> RHEL 6.2 - snapshot a disk mounted over multipath device mapper
> Upgrade system to RHEL 6.4
> Merge the snapshot to return the system to previous state.
> System get unstable and rebooting cyclic (not reaching user-level, at
> least the logs don't show it)
> Spot a file that got more or less 1200 bytes corrupted (mostly turned to 0).

The first rollback attempt was done in production?

> Sadly, I got called to the machine too late to recover the console
> output of the reboot (it's a blade and no console logs was
> configured), and could figure out if some hardware failure happened.
> 
> As I don't have proper logs to further investigate my questions is:
> 
> - There are any know issues around snapshotting in this conditions
> (RHEL 6.2 -> RHEL 6.4, multipath)?

Not aware of any.

> - There's any chance of this being a software failure (bug?) and do
> the restore procedure warn me in the logs (/var/log/message?) about
> any failure during the restore (even if hardware related).
> 
> My main suspicion for now is a hardware failure somewhere, but I was
> kindly asked to be sure that this can't be a bug.
> 
> Any thoughts or pointers (docs, pieces of code, testing reports) would
> be appreciate, so don't be shy :)

The lvm2 testsuite has support for testing snapshot-merge; but it
doesn't test layering snapshot ontop of multipath.

Without context (e.g. logs) for what happened it is really hard to say
definitively whether or not you hit some software bug or if your problem
was hardware failure like you suspect.
