Date: Thu, 12 Oct 2000 11:20:13 +0200
From: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Subject: Re: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Message-ID: <20001012112013.B15196@pdc.kth.se>
References: <20001012160136.E413@destiny.ist.flinders.edu.au> <20001012102613.A15196@pdc.kth.se> <20001012182627.G413@destiny.ist.flinders.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20001012182627.G413@destiny.ist.flinders.edu.au>; from mark@ist.flinders.edu.au on Thu, Oct 12, 2000 at 06:26:27PM +0930
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

On Thu, Oct 12, 2000 at 06:26:27PM +0930, Mark Phillips wrote:
> Erik B�gfors [bagfors@pdc.kth.se] wrote:
> 
> > This is more or less what I did.  But you only need a small partition to
> > install to.
> 
> Thanks for this!  I have since been thinking about a similar plan,
> though I was thinking of perhaps initially installing the basic
> installation on another drive and then copying it across to my new
> drive (on LVM partitions).  That way I could have / under LVM as well
> if I wanted.

Sure, I just didn't think it was worth the hassle.

> I have a few questions:
> 
> 1. What is a safe way of copying between partitions?  Ie is there a
> risk of corruption?

gnu cp with the -a flag can copy even stuff in /dev I've heard (and read).
I usualy use tar with a bunch of flags :)

> 2. How stable is LVM?  Is it worth having your / partition as a real
> partition (not a LV) just for reliability sake?  I agree that having a
> non LVM / partition makes things easier to boot up, but is this the
> only concern, or are there other reasons for not making / LVM?

I biggest reason I see is that 1) You still need a /boot that's not on lvm
(I know this is not true it you apply the latest patches that has come to
this mailinglist but I don't trust them yet) 2) rescue-reason.  You can
access your / from a rescue-disk without lvm-stuff (this is also a reason
not to use reiserfs on it...)

> 3. How much space did you give to /?  I'm not sure how much you would
> need.  And what parts of the filesystem did you chose to put on LVM?

Here is a df from my system
: [bagfors@zyrgelkwyt]$ ; df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda2               102486     62462     34732  65% /
/dev/disk_vg/usr_lv     921564    842716     78848  92% /usr
/dev/disk_vg/var_lv     409580    230368    179212  57% /var
/dev/disk_vg/tmp_lv     155636     37912    117724  25% /tmp
/dev/disk_vg/src_lv     770020    712576     57444  93% /usr/src
/dev/disk_vg/home_lv   1433552   1337976     95576  94% /home
/dev/disk_vg/opt_lv     270320    213896     56424  80% /opt
/dev/disk_vg/scratch_lv
                       2207672   1944840    262832  89% /pub/scratch
arla                   1048576         0   1048576   0% /afs
You have mail in /home/bagfors/Mail/inbox


> 4. How did you deal with the 8Gig disk barrier (assuming you have a
> disk bigger than this)?  Did you also have a /boot partition, or did
> you just include this in your / partition?

It's in /

> 5. Doesn't reiserfs have some stability problems and problems with nfs
> and a few other issues?  Also do you need to patch the 2.4.0-test9
> kernel in order to get reiserfs?  Is reiserfs going to make it into
> the 2.4 kernel?

I haven't had any problems with it.  Check out the reiserfs-faq on the
webpage.

Reiserfs will make it into the 2.4-kernel according to the faq.  If it will
be in 2.4.0 or in later versions is not known yet.

/Erik
-- 
Erik B�gfors               | Center for Parallel Computers
http://erik.bagfors.nu/    | http://www.pdc.kth.se/
erik@bagfors.nu            | bagfors@pdc.kth.se  
Supporter of free software | GSM +46 70 398 54 43 
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
