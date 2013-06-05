Message-ID: <51AF7572.5020200@web.de>
Date: Wed, 05 Jun 2013 19:29:22 +0200
From: Andreas Pflug <andreas.pflug@web.de>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<20130319164224.GI20480@agk-dp.fab.redhat.com>
	<5148A372.6050402@hoster-ok.com>
	<51AF3BD4.5070203@pse-consulting.de>
	<20130605151310.GA13992@redhat.com>
In-Reply-To: <20130605151310.GA13992@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 06/05/13 17:13, David Teigland wrote:
> On Wed, Jun 05, 2013 at 03:23:32PM +0200, Andreas Pflug wrote:
> A few different topics wrapped together there:
>
> - With kill -9 clvmd (possibly combined with dlm_tool leave clvmd),
>    you can manually clear/remove a userland lockspace like clvmd.

I had some clvmd instances not starting up correctly, remaining in 
nowhereland...
>
> - If clvmd is blocked in the kernel in uninterruptible sleep, then
>    the kill above will not work.  To make kill work, you'd locate the
>    particular sleep in the kernel and determine if there's a way to
>    make it interruptible, and cleanly back it out.
>
> - If clvmd is blocked in the kernel for >120s, you probably want to
>    investigate what is causing that, rather than being too hasty
>    killing clvmd.
>
> - If corosync or dlm_controld are killed while dlm lockspaces exist,
>    they become "uncontrolled" and would need to be forcibly cleaned up.
>    This cleanup may be possible to implement for userland lockspaces,
>    but it's not been clear that the benefits would greatly outweigh
>    using reboot for this.

Any of those programs might get a problem, so either they should 
re-attach to the lockspace, or a cleanup should be possible. If (as in 
my case) the host is a xen host with san storage you wouldn't like to 
reboot it... In my naive imagination, an orphaned lockspace is just some 
allocated memory that should't be too hard to free.

>
> - Killing either corosync or dlm_controld is very unlikely help
>    anything, and more likely to cause further problems, so it should
>    be avoided as far as possible.

Apparently the problem started with corosync running correctly, but 
dlm_controld wasn't up; clvmd then blocked somewhere. I now have still 
four hosts with 60VMs or so to reboot. So any hint how to kill that 
lockspace is greatly appreciated.


Regards,
Andreas
