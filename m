Message-ID: <000b01c36ca9$7bc29b50$c5000a0a@TTHENRIC2>
From: "Henric Andersson" <ha@thedudes.nu>
References: <000e01c36bf9$e5f82720$6402000a@gasaraki> <20030827115857.GE23955@www.13thfloor.at> <001001c36c93$9336a490$c5000a0a@TTHENRIC2> <20030827121655.GB26817@www.13thfloor.at>
Subject: Re: [linux-lvm] Poor performance with LVM 1.0.7
MIME-Version: 1.0
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
Date: Wed Aug 27 10:58:06 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I asked this, because I reported several times that
> lvm does have some I/O bottleneck/issue ...
>
> I had a similar problem with RAID5 where I could
> get 16Mb/s from each disk and about 30Mb/s from
> the RAID5 (4 disks) but only 18Mb/s from the lvm
> ontop of that raid ...

I've seen some evidence of that too on the net, but noone seems to have any answer.

Did a test now with bonnie on the LV setup with a 512MB file, and this is the result:

-------Sequential Output--------
Char: 17159K/s (97% CPU)
Block: 21966K/s (7% CPU)
Rewrite: 21052K/s (8% CPU)

---Sequential Input--
Char: 10879K/s (54% CPU)
Block: 18166K/s (2% CPU)

So, clearly, this should be enough to feed samba the 9.5MB/s that all the other non-lvm disks can do.
But apparently not. Is there perhaps some strange configuration of samba with LVM that actually makes
it slower? (Due to buffers, and read sizes?)

> > Even tried doing:
> >
> > time cat "somefile on the LV set" > /dev/null
> >
> > Which performed equally bad (ie, about 4-5MB/s).
> > Doing the same on the /dev/hda1 drive gives ALOT
> > better performance (more in the line of what hdparm -Tt reports)
>
> this was, on one of my systems, the reason why
> I removed the lvm and used the plain disk ...

No good in my case, I need to be able to extend the filesystem and thus, I need LVM.

> Heinz suggested to use the new LVM2 anyway, and maybe
> this is an option for you, so you could try this too
> (if you need patches for LVM2, hopefully they will be
> available for 2.4.22 this evening ...)

Isn't LVM2 just a new bunch of userland tools (+ a devicemapper) ? Or did I miss something?

/Henric
