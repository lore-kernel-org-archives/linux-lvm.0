Return-Path: <totake66@home.com>
Message-ID: <3B01AF42.C171FE86@home.com>
Date: Tue, 15 May 2001 17:35:46 -0500
From: Tom Otake <totake66@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
References: <3B005823.33AEE05D@home.com> <20010515094004.B468@66bassett.freeserve.co.uk>
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

Yes, I've been able to recreate the second hang scenario, though I have to
admit it wasn't exactly the same.  I started the copy of the data, created a
new LV, which worked.  I ran mkreiserfs on the new LV, it worked.  I removed
the new LV, also worked, then ran pvscan.  That's when the system hung.  All
the while, the copy from CD to disk was going on.

I apologize if I sound like an idiot but I've never taken a stack trace for
the linux kernel.  I assume this will require enabling magic sysrq.  I looked
through the sysrq.txt but it didn't offer too much help, especially on how to
save stack traces, etc.  Would it be possible to get a quick rundown on what
commands/keys I need to use to get the data you need?

Thanks

Joe Thornber wrote:

> On Mon, May 14, 2001 at 05:11:47PM -0500, Tom Otake wrote:
> > I'm not sure if this has been brought up yet.  Over the weekend, my
> > Linux hung up on me twice.  Considering that this never happened before
> > and only two things have recently changed (LVM and ReiserFS) , I did
> > some reading and came across the bug report for LVM on sistina's website
> > about LVM deadlocking Linux.
>
> All the deadlocking issues have been due to either running snapshots
> on 2.2 kernels or doing a 'pvmove' on 2.2 or 2.4.  It doesn't sound
> like you were doing either.
>
> >
> > I'm running kernle 2.4.3 with LVM compiled into the kernel.  LVM is
> > 0.9.1_beta7, reiser is 3.x.0j.  All essential fs (/, /usr, /var, /tmp)
> > are still using ext2 and linux partitions, non essential fs (/home
> > amongst others) are all on  reiserfs with LVM, excluding /usr/local,
> > which is still on ext2 and Linux partition.
> >
> > The first occurance:
> > Running vmware (not on lvm/reiser) while browsing the web using netscape
> > and running seti@home.  The system hung on me when I tried to access a
> > web page that appeared to be task intensive, wether servlets,
> > javascript, flash, or something else, I don't know.
>
> I used to get deadlocks from vmware without using LVM.
>
> > The second occurance:
> > I was copying a large amount of data from a CDROM to my home dir (on
> > lvm).  While the copy was in progress, I created a new LV.  This
> > worked.  The system hung when I ran mkreiserfs on the new LV.
>
> This sounds more serious.  Can you reproduce it ?  If you can the
> quickest way for us to find the problem is for you to build the kernel
> with kdb and get stack traces for the relevent threads.
>
> > As I said, I'm not sure if the system hang was caused by the deadlock,
> > since the system was dead.  If this is related to the deadlock issue,
> > are there any possible workarounds, besides being mindful of the system
> > load?
>
> I am not aware of any deadlock issues in beta7.  Has anyone else
> experienced problems ?
>
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--
_______________
Love cannot be much younger than the lust for murder.
                -- Sigmund Freud

-- Tom Otake
-- totake66_nospam@home.com
-- Remove _nospam
-- #550
