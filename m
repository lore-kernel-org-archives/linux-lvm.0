Date: Fri, 20 Aug 1999 14:09:59 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] LVM and Debian
Message-ID: <19990820140959.A23553@cyberhqz.com>
References: <37BD9B5B.A1247F83@mainland.ab.ca>
Mime-Version: 1.0
In-Reply-To: <37BD9B5B.A1247F83@mainland.ab.ca>; from Drew Smith on Fri, Aug 20, 1999 at 12:15:55PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, Aug 20, 1999 at 12:15:55PM -0600, Drew Smith wrote:
> 	So I did manage to get 0.7 to compile happily under Debian - using
> 2.2.10-ac12.  This was difficult, and I've discovered why - either
> Debian or LVM isn't properly referencing where the includes are stored. 
> My fix was:

I haven't actually compiled the tools under debian myself.  Debian does
not have /usr/include/linux matching up with the kernel release, so any
patches you might do to the kernel won't show up.

> 	My problems begin here - it worked happily!  I shared it out to the
> others via Samba, and they happily drug and dropped mass quantities of
> .MP3's to it.  After a while, it crashed.

Was there anything recorded by syslog?  How did it crash?

> 	I'm sort of hypothesizing that it crashed as it hit the end of the
> first drive - I'm only doing a linear setup, no stripes.  Roughly at the

I've got about 40GB of mix'n'match drives -- 12GB IDE's, .5GB SCSIs,
full height, half height, a real mix of everything, so striping wouldn't
help that much.  If you are using ext2fs on the lv, you'll hit all over
the drives, so there won't be a "just before the second drive".  ext2fs
will space out the files all over the lv.

> time that it WOULD have hit 9G, it locked the system solid, requiring a
> power-down.  Unfortunately, the machine doesn't have a head most of the
> time, so no errors were noted.

Do you have magic sys-rq compiled in?  This could be useful...

> 	Since then, I've compiled 2.2.11-ac3, and have been working on getting
> the same setup running again - with one exception.  I tried to put a

I've been using 2.2.10-ac12 and 2.2.11-ac1, althought -ac1 has known TCP
problems...

> seems I don't own a single 50-pin ribbon cable that is clean enough to
> avoid timeouts.  At 2am, I powered it off and left it for my bed - had

Yes, that can be a problem.  It's also a problem when one drive dies and
you aren't running raid on it at any level.  When using older full
height SCSI drives in stripe/linear, if you don't add raid to it
somewhere, you are only as strong as the weakest drive.  I dunno if I'd
trust heavily used drives nearing the end of their life...

> tonight. Has anyone had any problems with stability under Debian, and/or
> tracked down what those might stem from?  I'm running the machine now

I'm running debian potato on one machine, but it isn't running LVM.  The
LVM system is a Slackware 4.0 system, still on libc5.  Maybe it is libc?
 If you are running the latest from potato (2.1.x) it may not be
compatible with the tools as is, I dunno if anyone has looked into it
yet.
