From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: Re: [linux-lvm] Drive failure
In-reply-to: <20030515203908.66A9CAE4F5@basilica.la.naos.co.nz>
Message-id: <200305151834.10480.bjzolp@wisc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <20030515203908.66A9CAE4F5@basilica.la.naos.co.nz>
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
Date: Thu May 15 18:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thursday 15 May 2003 15:39, Ewen McNeill wrote:
> In message <200305150917.21504.bjzolp@wisc.edu>, "B. J. Zolp" writes:
> >On Thursday 15 May 2003 03:14, Ewen McNeill wrote:
> >> - make sure you do the dd with an option to replace unreadable sectors
> >>   with blank sectors (otherwise nothing will be written out for the
> >>   unreadable sectors, causing everything to be "out of alignment" after
> >>   the first bad block)
> >
> >I plan on using the noerror switch for dd, what else would I need to use
> > to make sure it replaces with blank sectors.  I could not find anything
> > in info dd or man dd.
>
> The option I was thinking of is conv=noerror,sync
>
> The "noerror" is "continue reading after read errors", and the "sync"
> is "pad each input block with zero bytes to block size".  Possibly GNU
> dd is better behaved, but my recollection is that at least some "dd"s
> will happily skip over blocks they can't read given "conv=noerror" (by
> assuming they just read 0 bytes that time), but result in effectively
> fewer blocks written out than read in, effectively shuffling everything
> after the blocks with errors down a bit.  This is, suffice to say,
> a bad thing to have happen to your file system.
>
> You might want to practice a little with copying from the disk into some
> temporary location (eg outputting to /dev/null will do for this
> purpose), and watch the "input blocks" and "output blocks" counts that
> are reported -- if they're not the same, you're going to have a problem.

I'm doing a
 dd bs=512 conv=noerror,sync if=/dev/hdf of=/dev/null 
right now.  It has been going for a few hours, but does not seem to be taking 
up any cpu cycles (it looks hung up).  I will let it go over night and see 
how it is tomorrow.  What would you suggest I do if the I can only get the 
data on the HD up until the bad sector (or where ever it is hung up).  This 
is the last drive in the logical volume, so there was not too much data on 
it, but how would I go about added the new replacement drive to the logical 
volume without messing up my entire filesystem?

Thanks again.

bjz



>
> Ewen
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
