Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8DJ2LrL027562
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2006 15:02:21 -0400
Received: from mail.esperi.org.uk (user13204@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8DJ2H8i026257
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2006 15:02:20 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	k8DJ2ETG001648
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2006 20:02:15 +0100
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
	<20060909231739.GB13859@agk.surrey.redhat.com>
	<b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
	<20060910154107.GC13859@agk.surrey.redhat.com>
	<878xkriq0r.fsf@hades.wkstn.nix>
	<20060910213014.GD13859@agk.surrey.redhat.com>
From: Nix <nix@esperi.org.uk>
Date: Wed, 13 Sep 2006 20:02:14 +0100
In-Reply-To: <20060910213014.GD13859@agk.surrey.redhat.com> (Alasdair G.
	Kergon's message of "Sun, 10 Sep 2006 22:30:15 +0100")
Message-ID: <87fyevfv49.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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

On Sun, 10 Sep 2006, Alasdair G. Kergon stipulated:
> On Sun, Sep 10, 2006 at 06:35:00PM +0100, Nix wrote:
>> I must admit I can't see what's so special about the root filesystem.

(Well, *that* was a stupid thing for me to say.)

> The tools you are running may be stored on it and access files on it.
> Some operations the tools do temporarily suspend I/O to the LVs involved.
> If a tool suspends I/O to the root then does anything that causes an access
> to it the system can lock up.

Ah. Isn't a possible solution to this to mlock() tools that may do that
into memory, so that they're not going to need to be paged in while
access is suspended?

>                                Caches/flushing/scheduling can make this
> indeterminate.  Even the filesystem type matters (e.g. timing of journal
> transactions e.g. lazy inode time updates).

Ick! A delicate area? :(

>> The tools work for me: even doing things like pvmoving root filesystems in
>> active use works fine. I'd vaguely guess that only snapshot support is
>> broken?
>  
> pvmove also may fail.

The only times I've ever had pvmove fail was when moving active swap
partitions: a related problem? They'd start moving, then disk I/O would
cease: lvs shows the swap LV in SUSPENDED state. (This was back in
2.6.14 and 2.6.15 days: it may be fixed by now.)

The attention to disaster recovery/move resumption in pvmove was a
godsend: reboot, `pvmove' and it ran to completion happily.

> Workaround is to copy required components into ramdisk and run from
> there.  I have never done a complete audit, but:
>   lvm binary (& libraries) should not be on root filesystem [use lvm.static
> in ramdisk] 

Yeah. My most recent root pvmove I did using the copy of lvm on my
initramfs (statically linked against uClibc). I guess that would avoid
all the problems (only, of course, the system wasn't exactly very far
up when I did that).

>   /dev must not be part of root filesystem being changed [ramdisk copy]

That's pretty much the standard by now.

>   log/activation = 0 in lvm.conf (the default)

Hm, the message above that says that low-memory situations can deadlock,
not that all can.

> Depending on the particular command and configuration there may be more
> restrictions.  (E.g. some commands may still require config files and lock
> files not to be in the root filesystem.)  dmeventd is also unsafe as
> currently implemented - one reason it is not enabled by default upstream.

It's also totally undocumented :( but then I'm not even sure what clvmd
is for (something to do with GFS or SANs? Why else would you want to
distribute a VG over multiple machines?) so I'm not really fit to comment
(or to document it).

> Upstream support entails a full review and changes to deal with as many
> problems as possible (regardless of the user's configuration and
> compile-time options) and then detecting the remaining problems and issuing
> warning messages or refusing to proceed as appropriate.

Oh yes, paranoia is good in this area.

But it would be nice to document the root-is-not-really-supported stuff
somewhere (with a caveat perhaps that it might work if operations on /'s
LV, PVs and VG are done with great care).

-- 
`In typical emacs fashion, it is both absurdly ornate and
 still not really what one wanted.' --- jdev
