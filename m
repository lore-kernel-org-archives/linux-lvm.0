Date: Wed, 5 Jun 2013 11:13:10 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130605151310.GA13992@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<20130319164224.GI20480@agk-dp.fab.redhat.com>
	<5148A372.6050402@hoster-ok.com>
	<51AF3BD4.5070203@pse-consulting.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51AF3BD4.5070203@pse-consulting.de>
Subject: Re: [linux-lvm] clvmd leaving kernel dlm uncontrolled lockspace
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
To: Andreas Pflug <pgadmin@pse-consulting.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jun 05, 2013 at 03:23:32PM +0200, Andreas Pflug wrote:
> Hi David,
> 
> I got quite some trouble with clvmd on corosync 2.3.0/dlm;
> apparently a nonfunctional clvmd in the cluster can block all others
> (kern.log states clvmd stuck for >120s in some dlm call). I tried to
> clean things up killing -9 clvmd, but it will remain on state D or
> Z. Unfortunately, it seems that those zombies still keep some dlm
> stuff locked. When I restart corosync on a node and dlm_controld -D
> on it, I see "found uncontrolled lockspace, tell corosync to remove
> nodeid from cluster".
> 
> Well, that's fine for the first step, but how about cleaning up the
> dlm lockspace? dlm_tool leave <lockspace> hangs as well (sometimes
> it just fails with error 49). The comment in dlm_controld/action.c
> isn't too satisfactory: need reboot, not funny if a whole cluster is
> affected. I'd really appreciate a way to manually clean old
> lockspaces. I'd presume that an uncontrolled lockspace on an
> isolated node should be easily removable...

A few different topics wrapped together there:

- With kill -9 clvmd (possibly combined with dlm_tool leave clvmd),
  you can manually clear/remove a userland lockspace like clvmd.

- If clvmd is blocked in the kernel in uninterruptible sleep, then
  the kill above will not work.  To make kill work, you'd locate the
  particular sleep in the kernel and determine if there's a way to
  make it interruptible, and cleanly back it out.

- If clvmd is blocked in the kernel for >120s, you probably want to
  investigate what is causing that, rather than being too hasty
  killing clvmd.

- If corosync or dlm_controld are killed while dlm lockspaces exist,
  they become "uncontrolled" and would need to be forcibly cleaned up.
  This cleanup may be possible to implement for userland lockspaces,
  but it's not been clear that the benefits would greatly outweigh
  using reboot for this.

- Killing either corosync or dlm_controld is very unlikely help
  anything, and more likely to cause further problems, so it should
  be avoided as far as possible.

Dave
