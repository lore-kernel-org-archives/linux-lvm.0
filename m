Return-Path: <thornber@btconnect.com>
Date: Wed, 9 May 2001 19:58:43 +0100
Subject: Re: [linux-lvm] Patching my kernel.
Message-ID: <20010509195843.A1351@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost> <20010509085110.G23157@colombina.comedia.it> <989404772.3725.0.camel@localhost> <20010509160319.C898@66bassett.freeserve.co.uk> <989408594.3725.3.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <989408594.3725.3.camel@localhost>; from raheesom@navpoint.com on Wed, May 09, 2001 at 07:43:14AM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Wed, May 09, 2001 at 07:43:14AM -0400, Rupert Heesom wrote:
> Joe:  I've untarred a new kernel archive & sorted the linux symlink to
> "kernel-2.4.3", etc.  Copied the .config file to the linux directory.
> 
> Then ran the patch -p1 < <path to patch file> from the linux directory.
> 
> I got a whole lot of errors -
> 
> [root@localhost linux]#patch -p1 <
> /usr/src/patch_gen_7/PATCHES/lvm-0.9.1_beta7-2.4.3.patch
> patching file include/linux/lvm.h
> Hunk #1 FAILED at 67.

<snip>

hmmmm... not sure what you've done here.  It looks like the patch
generation has gone astray.  My advice is to start with a fresh LVM dir:

untar clean kernel
untar LVM_beta7
cd LVM
./configure
cd PATCHES
make 
cd /usr/src/linux
patch -p1 < <where ever>/LVM/PATCHES/lvm-0.9.1_beta7-2.4.3.patch

If this doesn't work please send me (off list) the LVM patch so I can
see what has gone wrong.

Also please be aware that beta7 needs an extra little patch to fix the
get_hardblocksize -> hardsectsize name change.  Search this mailing
list for it, or grab code from CVS.

> What a learning curve!!  What next?

Please persevere, it gets easy once you've done it a couple of times.

- Joe
