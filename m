Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0IJslO16414
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 14:54:47 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.242])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0IJsfGb031519
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 14:54:42 -0500
Received: by mproxy.gmail.com with SMTP id q44so595903cwc
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 11:54:41 -0800 (PST)
Message-ID: <dff3752705011811541b040c4e@mail.gmail.com>
Date: Tue, 18 Jan 2005 14:54:41 -0500
From: Kristina Clair <kclair@gmail.com>
Subject: Re: [linux-lvm] snapshots and nfs
In-Reply-To: <20050118194449.GQ26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <dff37527050118093648e504e@mail.gmail.com>
	<20050118194449.GQ26670@agk.surrey.redhat.com>
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 18 Jan 2005 19:44:49 +0000, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Jan 18, 2005 at 12:36:06PM -0500, Kristina Clair wrote:
> > so, is there a way to have lvcreate not suspend the volume?  I'm using
> > xfs, so I should be able to freeze the filesystem.
>  
> Quick question: you're not running xfs_freeze are you?
> If so, try without, as device-mapper does the equivalent of that
> internally and xfs can't handle things if it gets run twice.

No, if I run xfs_freeze first, lvcreate hangs when it tries to suspend
the volume, so I stopped doing that.
Now, if I run lvcreate shortly after the machine is booted, it runs
successfully.  However, if I try to run the same command the next day,
after it's been online and the webservers have had the filesystem
mounted, it hangs when trying to suspend the volume.

So I'm wondering if the problem is that the webservers have the
filesystem mounted and in use (apache is serving pages from it),  I'm
trying to find a way to keep the filesystem mounted over nfs but still
be able to create snapshots, and I was wondering if I could use
xfs_freeze and have lvcreate not try to suspend the volume.

Thanks,
Kristina
