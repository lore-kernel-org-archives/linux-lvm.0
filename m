Return-Path: <totake66@home.com>
Message-ID: <3B0336BC.B8BC97D4@home.com>
Date: Wed, 16 May 2001 21:26:04 -0500
From: Tom Otake <totake66@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
References: <3B005823.33AEE05D@home.com> <20010515094004.B468@66bassett.freeserve.co.uk> <3B01AF42.C171FE86@home.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've recreated the system hang exactly as I've described below with a pvscan
during a copy.  I used a new kernel with hacking enabled, redirected 1 into
/proc/sys/kernel/sysrq.  None of the sysrq commands seemed to have worked.  The
system hung about 20 to 30 seconds into the copy process.

Tom Otake wrote:

> Yes, I've been able to recreate the second hang scenario, though I have to
> admit it wasn't exactly the same.  I started the copy of the data, created a
> new LV, which worked.  I ran mkreiserfs on the new LV, it worked.  I removed
> the new LV, also worked, then ran pvscan.  That's when the system hung.  All
> the while, the copy from CD to disk was going on.
>
> Joe Thornber wrote:
>
> >
> > > The second occurance:
> > > I was copying a large amount of data from a CDROM to my home dir (on
> > > lvm).  While the copy was in progress, I created a new LV.  This
> > > worked.  The system hung when I ran mkreiserfs on the new LV.
> >
> > This sounds more serious.  Can you reproduce it ?  If you can the
> > quickest way for us to find the problem is for you to build the kernel
> > with kdb and get stack traces for the relevent threads.
> >
