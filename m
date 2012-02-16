Date: Thu, 16 Feb 2012 10:43:01 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120216154301.GA13948@redhat.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
	<4F3D15CC.1080901@mohawksoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F3D15CC.1080901@mohawksoft.com>
Subject: Re: [linux-lvm] Snapshots
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
To: Mark Woodward <markw@mohawksoft.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 16 2012 at  9:42am -0500,
Mark Woodward <markw@mohawksoft.com> wrote:

> On 02/16/2012 08:57 AM, Mike Snitzer wrote:
> >On Thu, Feb 16 2012 at  8:25am -0500,
> >Mark Woodward<markw@mohawksoft.com>  wrote:
> >
> >>I have been looking into LVM2 for a while now and while I think it
> >>is useful for a range of applications, its seems pretty limited in
> >>overall scope.
> >>
> >>Is there any active development happening? Most of the code seems
> >>like bug-fixes or minor tweaks. Is the snapshot system being
> >>improved? Specifically, snapshots of snapshots? thin provisioned
> >>snapshots or auto-expand (i.e. snapshots don't run out of space).
> >>If you look at technologies like ZFS snapshots are far better
> >>supported, but ZFS will probably never be real under Linux, and it
> >>really is far more than is really needed.
> >>
> >>So, I guess my questions are these: Is LVM in maintenance mode or is
> >>there active development? If it is being actively developed, is
> >>there a road map and is there a group or site specifically dedicated
> >>to the development?
> >Um, where are you even getting this idea that LVM2 is in maintenance
> >mode?  Or that snapshots haven't improved?
> >
> >Sorry to come off defensive but your entire post is founded on incorrect
> >understanding.
> 
> Understood, I apologize.
> >Anyway, if you look at the change history of the lvm2 repository (be it
> >cvs or git, cvs commits are mirrored to git) you'll see there have been
> >regular changes flowing in and most recently a very extensive evolution
> >of the code to add support for thin provisioning with highly efficient
> >snapshots (ala btrfs or ZFS).
> I guess I missed that. I need to check out the changes, looks like
> you have auto-grow with monitoring? I was looking more towards the
> "snapshots of snapshots" ability. Is that on the radar?

recursive snapshots of arbitrary depth (snapshot of snapshots ...) are
already supported with the new thinp snapshots.

Please review the upstream Linux >= 3.2 kernel code/docs too, it has
more documentation of the underlying capabilities, e.g.:

Documentation/device-mapper/thin-provisioning.txt

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/device-mapper/thin-provisioning.txt

(the "Introduction" being the most approachable overview)
