Return-Path: <thornber@btconnect.com>
Date: Sun, 22 Apr 2001 21:22:48 +0100
Subject: Re: [linux-lvm] Kernel 2.2.19, RawIO, LVM, RAID -- who has it running?
Message-ID: <20010422212248.A11432@66bassett.freeserve.co.uk>
References: <20010422202214.A20864@babbage.hcsd.de> <20010422205547.C1984@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010422205547.C1984@dragon.blacknet.de>; from bock@blacknet.de on Sun, Apr 22, 2001 at 08:55:47PM +0200
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

Goetz,

On Sun, Apr 22, 2001 at 08:55:47PM +0200, Goetz Bock wrote:
> 
> On Sun, Apr 22 '01 at 20:22, Stephan Austermuehle wrote:
> > anybody out there who has a running kernel 2.2.19 with Raw-IO patch,
> no, but a patched onw
> > LVM, and RAID patch 2.2.19-A1? Applying all these patches seems to be
> > inpossible.
> This actualle workes out of the box (see Patches/README). Get the latest
> tar ball from sistina.com, untar it, get the raw-io patch from the
> patches dir and apply it to a clean 2.2.19 kernel. then change the
> fragments file (see the readme for the location) and do a 
> "make; cd Patches ; make" to get the patch for your kernel.
> apply the raid patch, and than the LVM patch.

I'm glad to see you've got this working.  Could I ask you to give the
list a bit more information on your set up please ?  As far as I know
you're the only person who is using this.  Which raid modes are you using ?
How heavily are you loading the system ?

The changes I made to the md code were pretty trivial (but untested),
so if it's working at all it should be robust.

- Joe
