Date: Fri, 25 Aug 2000 00:46:13 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000825004612.A16428@vestdata.no>
References: <20000824124613.B19952@colombina.comedia.it> <200008241747.e7OHlNd04033@webber.adilger.net> <20000824200438.A32379@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20000824200438.A32379@colombina.comedia.it>; from Luca Berra on Thu, Aug 24, 2000 at 08:04:38PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>, Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

On Thu, Aug 24, 2000 at 08:04:38PM +0200, Luca Berra wrote:
> > > fixed that and pvmoved everything onto my lvm+raid5 (fixing another bug
> > > in the process).  Well, i discovered that reiserfs + LVM + raid DOES NOT
> > > WORK, it actually filled 95% of my files with zeroes :)
> > 
> > No journalling filesystem will work properly with RAID 5 - not reiserfs
> > and not ext3.  You need to stick with a non-journalling filesystem, or
> > use RAID1.  It may be that this is supposed to be fixed in 2.4, but I'm
> > not 100% sure...
> > 
> I probably dinna specify but it i am running 2.4.0-test7pre5
> so i can confirm reiserfs not working on raid+lvm with 2.4

If you have more information, please send a bugrapport to
reiserfs@devlinux.com.

> AFAIR the problem with journaling and raid was due to raid's usage
> of the buffer cache during recnstruction, there was no reconstrucion
> happening on my system. i will also try reiserfs on raid without
> lvm, i cannot try ext3 since there isn't any patch for 2.4

For linux 2.2 it will not work with raid5 at all, the reconstruction
issue is just for mirroring....I think.

From Chris Mason on reiserfs@devlinux.com:

> reiserfs and raid:
> The FAQ should state that hardware RAID is not a problem
> 2.2: I found a mail saying that concatening, striping and mirroring
>      are ok, but raid5 has issues, but I also seem to remember reading
>      there were issues with reconstructing mirroring?

Correct, any hardware raid is safe.  For software, striping is ok.
Mirroring is ok, but you *cannot* use the online mirror rebuild.
software raid5 is unsafe.  lvm is safe.

> 2.4: Is everything working here? both lvm and md?
>
Yes, software raid in 2.4 is working properly, and so is lvm.


-- 
Ragnar Kjorstad
Torque Systems / Big Storage
