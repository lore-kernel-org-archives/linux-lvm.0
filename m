Message-Id: <199902171022.AA22723@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] User count, general question for all y'all
Date: Wed, 17 Feb 1999 11:20:21 MET
In-Reply-To: <Pine.GHP.4.05.9902162016250.4139-100000@ixion.honeywell.com>; from "Shawn Leas" at Feb 16, 99 8:23 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sleas@ixion.honeywell.com, linux-lvm@msede.com
Cc: mge@u9ete.ez-darmstadt.telekom.de

> 
> On Tue, 16 Feb 1999, Stephen Costaras wrote:
> 
> > I signed up to the list to get a feel as to how stable lvm is and
> > what pitfalls I would cross in using it.  The servers here are used
> > in a production setting so I am on the reluctant side of putting in
> > 'bleeding edge' stuff.
> > 
> > Steve
> 
> When you think about it, the fundamental role of LVM has
> little opportunity to introduce instability where it wasn't
> there before. (Maybe Heinz can help me here)

Shawn is right with this because the LVM driver does a quite simple
remapping job these days based on tables loaded by user land tools
(vgchange, vgcreate, lvcreate etc.)

I have plans for the future (RAID > 0) which will make the driver more complex
in means of remapping. But this will only be if you choose to create
RAID > 0 logical volumes then and will have no impact on linear or striped
logical volumes possible today.

BTW: i don't know what future really means 8*)))

> 
> It's simply offering userland a virtual view of disk (or
> some non-volatile storage), and in doing so has the job of
> translating logical addresses to physical ones, etc etc.

See my statement above.

> Well,
> that and locking some things here and there at times... But
> then, that's more for LVM meta data, because LVM sits on top
> of already existing kernel stuff, proven stable.

Yes. See lvm_map() in drivers/block/lvm.c for the remapping stuff.

The only problem being forced to the surface by LVM caused
by the storage amount it can deal with (up to 1 Terabyte today) is mass
i/o instability in some Linux kernel versions.
I watched that problem with several 2.1.x and logical volumes of 20-30 GB.

This is basically fixed with 2.2.1 today.

But 2.2.1 suffers from being to agressive in stealing memory pages
for the buffer cache which leads for eg. to a mke2fs of a big logical volume
(or a big partition) forcing out process pages 8*(

An artivicial limit for buffer memory or more agressive bdflush() activities
hacked into 2.2.1 (fs/buffer.c) helps with this but is not the right
solution for the medium term.

Stephen Tweedie and others are working on this and i think the problem
will disapear in 2.2.2.

> 
> I guess locking could be a concern, but I get the feel,
> having used LVM, that Heinz has done a production quality job
> with everything.

Thanks and thank you all for enhancing its quality!

> 
> Go ahead and try it out on a more developmenty platform,
> I think you'll find it as stable as a non-lvm one.
> 

Agreed ;*)

Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
