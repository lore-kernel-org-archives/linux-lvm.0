Message-ID: <3920884E.E1B5EBA9@ednet.ns.ca>
Date: Mon, 15 May 2000 20:29:19 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can activate the LVM in start
References: <00a201bfbe75$7395a020$4b1f04d5@migue> <20000515194742.A1442@home.ds9a.nl> <392048A3.BA78B2A3@ednet.ns.ca> <20000515182126.A17908@omnifarious.mn.org>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: linux-lvm@msede.com

I put it just before the raid stuff that starts with the following line:

# Add raid devices

It is line 303 in my rc.sysinit

"Eric M. Hopper" wrote:

> On Mon, May 15, 2000 at 03:57:40PM -0300, Patrick Boutilier wrote:
> > Or stick it in your system startup files like /etc/rc.d/rc.sysinit on REdHat
> > Linux.
>
>         That's all fine and good, but where in rc.sysinit?  I tried
> putting it just before the root filesystems are mounted read/write, and
> that didn't seem to work.
>
> Have fun (if at all possible),
> --
> Its name is Public Opinion.  It is held in reverence. It settles everything.
> Some think it is the voice of God.  Loyalty to petrified opinion never yet
> broke a chain or freed a human soul.     ---Mark Twain
> -- Eric Hopper (hopper@omnifarious.mn.org  http://omnifarious.mn.org/~hopper) --
>
>   ------------------------------------------------------------------------
>    Part 1.2Type: application/pgp-signature
