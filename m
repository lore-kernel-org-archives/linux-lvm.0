From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Poor performance with LVM 1.0.7
Message-ID: <20030827121655.GB26817@www.13thfloor.at>
References: <000e01c36bf9$e5f82720$6402000a@gasaraki> <20030827115857.GE23955@www.13thfloor.at> <001001c36c93$9336a490$c5000a0a@TTHENRIC2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001001c36c93$9336a490$c5000a0a@TTHENRIC2>
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
Date: Wed Aug 27 07:59:12 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henric Andersson <ha@thedudes.nu>
Cc: linux-lvm@sistina.com

On Wed, Aug 27, 2003 at 02:05:55PM +0200, Henric Andersson wrote:
> > check the raw performance of one drive involved
> > with hdparm -tT ...
> 
> Did that, it reported between 27-45MB/s on all drives (ranging from the system harddrive to the LVM
> harddrives)

I asked this, because I reported several times that
lvm does have some I/O bottleneck/issue ...

I had a similar problem with RAID5 where I could
get 16Mb/s from each disk and about 30Mb/s from
the RAID5 (4 disks) but only 18Mb/s from the lvm
ontop of that raid ...

> > > After scouring the net for suggestions on how to improve the speed, I came
> > > up empty, and thus, I'm writing this email :)
> > >
> > > Some more facts (more available if needed ;)) about the server:
> > >
> > > All drives are tuned with 32bit transfers and DMA enabled. I'm running
> > > kernel 2.4.22pre2 (gentoo).
> >
> > just for the fun of doing it, compile vanilla
> > 2.4.22 and give it a try ... you could also add
> 
> Oki, will try it as soon as I get home.
> 
> > the following lvm patch ...
> > http://www.13thfloor.at/VServer/patches-2.4.22-p10c17/07_lvm-1.0.7-2.4.21pre5.patch.bz2
> 
> Hmm? What does this patch do?

get lvm up to version 1.0.7 ...

> > was the performance you had on your old box higher?
> > or did you just expect an increase in speed, which didn't
> > happen?
> 
> Performance on my old box was lower, so I expected it to 
> increase with my new system. And it did, as
> long as I don't serve any files from the volumeset, 
> everything runs just fine (9.5MB/s) but whenever I
> try to access files on the LV, I get 4-5MB/s ...
> 
> Even tried doing:
> 
> time cat "somefile on the LV set" > /dev/null
> 
> Which performed equally bad (ie, about 4-5MB/s). 
> Doing the same on the /dev/hda1 drive gives ALOT
> better performance (more in the line of what hdparm -Tt reports)

this was, on one of my systems, the reason why
I removed the lvm and used the plain disk ...

Heinz suggested to use the new LVM2 anyway, and maybe
this is an option for you, so you could try this too 
(if you need patches for LVM2, hopefully they will be 
available for 2.4.22 this evening ...)

HTH,
Herbert

> /Henric
