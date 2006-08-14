Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7ELZeLd003177
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 17:35:40 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7ELZSk3008128
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 17:35:28 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7ELZPG11610
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 22:35:25 +0100
Date: Mon, 14 Aug 2006 22:35:23 +0100
From: paddy <paddy@panici.net>
Subject: Re: Re: [linux-lvm] LVM2 on hardware RAID
Message-ID: <20060814213510.GB30880@cobalt0.panici.net>
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7E@exchange2k.lims.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7E@exchange2k.lims.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Aug 11, 2006 at 02:11:43PM -0400, Musil, William wrote:
> Thanks for the reply. 
> 
> I would intend to do it offline. 

In which case I would think it should be reasonably easy, even if you have
to write a simple program to do it.

> Not sure what you mean by dd in a shell.
> Could you elaborate? 

sorry, I guess it's just my personal shorthand for block device manipulations
that you could do with just bash and dd(1).  In this case you'd likely be
better of in C.

From what I recall, the layout of a PV is fairly straight-forward, with a 
bunch of metadata at the front and then PEs after that.  You would need to
change that metadata, and you may well need to extend the table that maps
PEs to LEs, which could even mean stealing a PE or so from the data section
to extend the metadata section (dunno off the top of my head). IIRC, 
recent lvm layouts have PEs PE size aligned to the start of the PV, which
is a gift from the point of view of this problem (and what I was alluding
to in the context of a hypothetical pvmerge).

To recap, you would need to change the metadata, you may need to relocate 
some PEs and renumber the PEs if you need more space for the metadata.

there might be some hazards with the vgcfgbackup system that would need 
watching out for.

As I said in my other mail just now, I am surprised that it doesn't
already exist, so perhaps it does, or perhaps I've overlooked some
complication.

> Do you mean, make a backup, drop and recreate the pv, vg, lv, and
> filesystems, and recover backup?

Naturally I can only advise you to have proper backups before attempting
anything 'interesting', just like everyone else does.  You do have backups
don't you? ;-)

What you describe might well be easier and more sensible than writing a 
pvresize, although I'd rather write the util myself ;-)

> I was hoping not to have to do this, kinda defeats the purpose.

Agreed.  It should be possible to do this with a minimum of actual moving
blocks about, unless you're greatly concerned to keep an lv contiguous
or something.

> I was trying to get away with managing all of my filesystems within lvm as
> LV's, trying to keep the pv's as simple as possible.

Yeah, I've been using HM's LVM since about 0.7, and I don't know how I lived
without it before :-)  

That said, I would advise you to weigh the pros and cons of things like 
root on LVM or swap on LVM carefully.  I found it fun to do that kind
of thing at first, but I've tended to shy away from it of late :-)

Originally I implemented a version that had a single blank block at 
the begining, much like say ext2, so that I could still have a 
partition table and have the whole disk a PV.  Found a couple of 'bugs' in
the user space code doing that :-) But I quickly became convinced from 
conversation on the list that HM wouldn't take a patch for that :-(
And I was patching the kernel for that and devfs and some nfs stuff, and
I soon learnt that keeping up with that becomes a serious chore.

I recently had what seemed to be a nasty event that was dm related, which 
is why I joined the list, but it's a bit of a chore to write up and my
supply of round tuits has been a bit short since then.  Upon reflection
I think I fell into the same old mistake again: the kernel was from
sometime around 2.6.10 and patched for one or two things, so I hadn't
upgraded it. I'm wondering now whether it was that bio bug that got 
fixed at around 2.6.12. But anyway, it made me revisit a few
fundamental thoughts about keeping it simple and keeping good backups :-)

Apologies for waffling on so, but I hope this helps :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
