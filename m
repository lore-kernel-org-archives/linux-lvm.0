Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q5UNBAoq012548
	for <linux-lvm@redhat.com>; Sat, 30 Jun 2012 19:11:10 -0400
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5UNB9Ds018968
	for <linux-lvm@redhat.com>; Sat, 30 Jun 2012 19:11:09 -0400
Received: by pbbrp8 with SMTP id rp8so6598638pbb.33
	for <linux-lvm@redhat.com>; Sat, 30 Jun 2012 16:11:08 -0700 (PDT)
Date: Sat, 30 Jun 2012 16:10:38 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
In-Reply-To: <4FEF66C4.20001@redhat.com>
Message-ID: <alpine.LSU.2.00.1206301541280.1919@eggly.anvils>
References: <4FEEE5E5.5060800@redhat.com>
	<alpine.LSU.2.00.1206301217590.1728@eggly.anvils>
	<4FEF66C4.20001@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Regression with FALLOC_FL_PUNCH_HOLE in 3.5-rc
	kernel
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-kernel@vger.kernel.org, amwang@redhat.com, Alasdair G Kergon <agk@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 30 Jun 2012, Zdenek Kabelac wrote:
> Dne 30.6.2012 21:55, Hugh Dickins napsal(a):
> > On Sat, 30 Jun 2012, Zdenek Kabelac wrote:
> > > 
> > > When I've used 3.5-rc kernels - I've noticed kernel deadlocks.
> > > Ooops log included. After some experimenting - reliable way to hit this
> > > oops
> > > is to run lvm test suite for 10 minutes. Since 3.5 merge window does not
> > > included anything related to this oops I've went for bisect.
> > 
> > Thanks a lot for reporting, and going to such effort to find
> > a reproducible testcase that you could bisect on.
> > 
> > > 
> > > Game result is commit: 3f31d07571eeea18a7d34db9af21d2285b807a17
> > > 
> > > mm/fs: route MADV_REMOVE to FALLOC_FL_PUNCH_HOLE
> > 
> > But this leaves me very puzzled.
> > 
> > Is the "lvm test suite" what I find at git.fedorahosted.org/git/lvm2.git
> > under tests/ ?
> 
> Yes - that's it -
> 
>  make
> as root:
>  cd test
>  make check_local
> 
> (inside test subdirectory should be enough, if not - just report any problem)
> 
> > 
> > I see no mention of madvise or MADV_REMOVE or fallocate or anything
> > related in that git tree.
> > 
> > If you have something else running at the same time, which happens to use
> > madvise(,,MADV_REMOVE) on a filesystem which the commit above now enables
> > it on (I guess ext4 from the =y in your config), then I suppose we should
> > start searching for improper memory freeing or scribbling in its holepunch
> > support: something that might be corrupting the dm_region in your oops.
> 
> What the test is doing - it creates file in  LVM_TEST_DIR (default is /tmp)
> and using loop device to simulate device (small size - it should fit bellow
> 200MB)
> 
> Within this file second layer through virtual DM devices is created and
> simulates various numbers of PV devices to play with.

This sounds much easier to set up than I was expecting:
thanks for the info, I'll try it later on today.

> 
> So since everything now support TRIM - such operations should be passed
> down to the backend file - which probably triggers the path.

What filesystem do you have for /tmp?

If tmpfs, then it will make much more sense if we assume your bisection
endpoint was off by one.  Your bisection log was not quite complete;
and even if it did appear to converge on the commit you cite, you might
have got (un)lucky when testing the commit before it, and concluded
"good" when more attempts would have said "bad".

The commit before, 83e4fa9c16e4af7122e31be3eca5d57881d236fe
"tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE", would be a
much more likely first bad commit if your /tmp is on tmpfs:
that does indeed wire up loop to pass TRIM down to tmpfs by
fallocate - that indeed played a part in my own testing.

Whereas if your /tmp is on ext4, loop has been passing TRIM down
with fallocate since v3.0.  And whichever, madvise(,,MADV_REMOVE)
should be completely irrelevant.

> 
> > I'll be surprised if that is the case, but it's something that you can
> > easily check by inserting a WARN_ON(1) in mm/madvise.c madvise_remove():
> > that should tell us what process is using it.
> 
> I could try that if that will help.

That would help, if you're very sure of your bisection endpoint;
but if your /tmp is on tmpfs, then I do think it's more likely
that you've actually found a bug in the commit before.

> 
> > I'm not an LVM user, so I doubt I'll be able to reproduce your setup.
> 
> Shouldn't be hard to run - unsure if every config setup is influnenced
> or just mine config.

I'll start from your config.

> 
> > 
> > Any ideas from the DM guys?  Has anyone else seen anything like this?
> > 
> > Do all your oopses look like this one?
> 
> I think I've get yet another one - but also within  dm_rh_region
> 
> It could be that your patch exposed problem of some different part of stack -
> not really sure - it's just now with 3.5  this crash will not allow to pass
> whole test suite  -  I've tried also in kvm machine and it's been
> reproducible (so in the worst case I could eventually send you 2GB image)
> 
> The problem is - there is not a 'single test case' to trigger the oops (at
> least I've not figured out one)  - it's the combination of multiple tests
> running after each other - but for simplication this should be enough:
> 
> make check_local T=shell/lvconvert
> 
> Which usually dies on shell/lvconvert-repair-transient.sh

Thanks again, I'll report back later.

Hugh
