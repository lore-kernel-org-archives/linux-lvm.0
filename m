Return-Path: <wcurry@cts.com>
Date: Tue, 7 Aug 2001 14:03:21 -0700
From: Wade Curry <wcurry@cts.com>
Subject: Re: [linux-lvm] Installing Linux on LVM
Message-ID: <20010807140321.C31158@verb.syntaxsleuth.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000901c11f71$1b950100$f04b7818@lvcm.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Glenn Shannon(warl0k@lvcm.com)@Tue, Aug 07, 2001 at 11:45:19AM -0700:
> Hi there and thanks for the info!
> 
> What I did last time was:
> Install to a normal partition all on one partition (only partition created

--snip---
> 
> Booted into LVMed Debian.(yay!)
> 
> So all told I have been there done that already.. what my real question was
> is if there is any way to get Debian (or any linux really) to install
> straight into an LVM without the aforementioned steps above? Or would I need
> to create my own bootfloppy/installation system?
> 
> Anyhow thanks for the info on your experience!
> 

Ah well, you're welcome.  Sorry it's not the information you were
after.  I don't know of any boot floppies (official or not) for any
distro that does that.  I honestly don't expect to see it for a
while, either.  I don't mean to be just pessimistic.  Someone on
this list (Hienz I think) said that boot-time recognition of
logical volumes is a feature to be added _after_ 1.0.  Doesn't seem
quite worth the effort to work out all the logistics of initrds and
whatnot in the boot disks, if we can hold off for that functionality
just a bit.  In the meantime the few of us who want to explore, are
already having success with the current scheme of things. Just
doesn't seem that there is as much pressure to create that
functionality as there would be if new boot floppies were
absolutely necessary.


Gonna wait it out :)


Wade Curry                            wcurry(AT)cts.com

The industry doesn't want [MP3] pushed, and Microsoft and
RealNetworks don't want it pushed. The consumer is going to eat
what he's given.
                               - David Farber, FCC
