Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] Patching my kernel.
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010509195843.A1351@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost>
	<20010509085110.G23157@colombina.comedia.it>
	<989404772.3725.0.camel@localhost>
	<20010509160319.C898@66bassett.freeserve.co.uk>
	<989408594.3725.3.camel@localhost> 
	<20010509195843.A1351@66bassett.freeserve.co.uk>
Date: 10 May 2001 18:48:44 -0400
Message-Id: <989534925.7891.0.camel@localhost>
Mime-Version: 1.0
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

Well, Joe:

It worked this time.  As I write this, the kernel is compiling itself
after the patch install.  

I think I know what went wrong last time......I'd just finished
discussing with someone how to retain the kernel config settings from
the previously used source tree.  What I did last time was to copy the
old .config file into /usr/src/linux.  Do the "make oldconfig" command,
THEN do the patch install.

Obviously from what I've seen now, I need to to the patch install before
the "make oldconfig".   I should have mentioned it in my post to you,
but I probably didn't think of it!


On 09 May 2001 19:58:43 +0100, Joe Thornber wrote:
> On Wed, May 09, 2001 at 07:43:14AM -0400, Rupert Heesom wrote:
> 
> hmmmm... not sure what you've done here.  It looks like the patch
> generation has gone astray.  My advice is to start with a fresh LVM dir:
> 
> untar clean kernel
> untar LVM_beta7
> cd LVM
> ./configure
> cd PATCHES
> make 
> cd /usr/src/linux
> patch -p1 < <where ever>/LVM/PATCHES/lvm-0.9.1_beta7-2.4.3.patch
> 
> If this doesn't work please send me (off list) the LVM patch so I can
> see what has gone wrong.
> 
> Also please be aware that beta7 needs an extra little patch to fix the
> get_hardblocksize -> hardsectsize name change.  Search this mailing
> list for it, or grab code from CVS.

I forgot about this....  but looking at the msgs regarding what you
mentioned here, looks like it's s/390 code, so not something that will
affect my intel processor.

> 
> > What a learning curve!!  What next?
> 
> Please persevere, it gets easy once you've done it a couple of times.

Yes, I didn't mean that to come across sharply. I *ALWAYS* persevere!
When I first started with Linux, it took me 2 WEEKS to get diald working
on my PC so that I could use the internet the way I wanted (2 days
because of a pw typed into the config file wrong!).

-- 
regs
rupert
