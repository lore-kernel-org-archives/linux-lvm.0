Message-Id: <37BDD97E.96BA484E@mainland.ab.ca>
Date: Fri, 20 Aug 1999 16:41:03 -0600
From: Drew Smith <drew@winterland.mainland.ab.ca>
Mime-Version: 1.0
Subject: Re: [linux-lvm] LVM and Debian
References: <37BD9B5B.A1247F83@mainland.ab.ca> <19990820140959.A23553@cyberhqz.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Murray <rmurray@cyberhqz.com>
Cc: linux-lvm@msede.com


	Hiya Ryan,

Ryan Murray wrote:

> I haven't actually compiled the tools under debian myself.  Debian does
> not have /usr/include/linux matching up with the kernel release, so any
> patches you might do to the kernel won't show up.

	Zuh?  Lost me here - I patch the kernel all the time.  LVM is actually
looking for lvm.h in /usr/src/linux/include/linux - and that's placed
there properly by the Alan Cox patch... compiling the tools, it just
wasn't finding the include directory happily.  I symlinked it in, and it
compiled fine.
 
> >       My problems begin here - it worked happily!  I shared it out to the
> > others via Samba, and they happily drug and dropped mass quantities of
> > .MP3's to it.  After a while, it crashed.
> 
> Was there anything recorded by syslog?  How did it crash?

	*sigh* - I wish.  No errors whatsoever, and the roommate rebooted it
before I had a chance to throw a graphics head on it and see what was
onscreen at the time.  It has a monitor now, specifically for that
reason.
 
> >       I'm sort of hypothesizing that it crashed as it hit the end of the
> > first drive - I'm only doing a linear setup, no stripes.  Roughly at the
> 
> I've got about 40GB of mix'n'match drives -- 12GB IDE's, .5GB SCSIs,
> full height, half height, a real mix of everything, so striping wouldn't
> help that much.  If you are using ext2fs on the lv, you'll hit all over
> the drives, so there won't be a "just before the second drive".  ext2fs
> will space out the files all over the lv.

	Ah - this is news to me - I really don't know all that much about the
way filesystems work.  This is why I'm jumping on the Linux LVM wagon
early. :)
 
> > time that it WOULD have hit 9G, it locked the system solid, requiring a
> > power-down.  Unfortunately, the machine doesn't have a head most of the
> > time, so no errors were noted.
> 
> Do you have magic sys-rq compiled in?  This could be useful...

	Nopers, and I'm afraid I've never actually used it - I know what a
kernel oops is, and that you can trace it - but not how. :)

 
> >       Since then, I've compiled 2.2.11-ac3, and have been working on getting
> > the same setup running again - with one exception.  I tried to put a
> 
> I've been using 2.2.10-ac12 and 2.2.11-ac1, althought -ac1 has known TCP
> problems...

	Hurm, the problems were with 2.2.10-ac12 - hopefully 2.2.11-ac3 will be
better.

> > seems I don't own a single 50-pin ribbon cable that is clean enough to
> > avoid timeouts.  At 2am, I powered it off and left it for my bed - had
> 
> Yes, that can be a problem.  It's also a problem when one drive dies and
> you aren't running raid on it at any level.  When using older full
> height SCSI drives in stripe/linear, if you don't add raid to it
> somewhere, you are only as strong as the weakest drive.  I dunno if I'd
> trust heavily used drives nearing the end of their life...

	*nod*, that's an issue - however, all of the data is static, and will
be on high-speed tape by the end of the week (unless I can find some
optical media for my unpopulated Artecon library...) - so if a drive
dies, that's about 1 hour's work, then another 8 hours unattended. 
Almost worth the risk rather than losing space to parity.  Your
thoughts?  Ideas on maximizing security while maintaining speed and
capacity?

> > tonight. Has anyone had any problems with stability under Debian, and/or
> > tracked down what those might stem from?  I'm running the machine now
> 
> I'm running debian potato on one machine, but it isn't running LVM.  The
> LVM system is a Slackware 4.0 system, still on libc5.  Maybe it is libc?
>  If you are running the latest from potato (2.1.x) it may not be
> compatible with the tools as is, I dunno if anyone has looked into it
> yet.

	Hurm, never even considered LibC.  I'll look into it tonight at home -
can't remember the version, and the machine's down.  Woo!  Crash-test
weekend!

	Cheers,
	- Drew.
