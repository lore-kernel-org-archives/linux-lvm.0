Date: Fri, 11 Feb 2000 00:09:24 +0000 (GMT)
From: James Pattinson <jamesp@subdimension.com>
Subject: Re: [linux-lvm] Patch to 2.3.40
In-Reply-To: <38A338A3.13861967@moose.net>
Message-ID: <Pine.LNX.4.10.10002110008250.12931-100000@greebo.jj.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Kress <kressb@moose.net>
Cc: linux-lvm@msede.com

Good question - I ran into the same thing when I was appling devfs and lvm
to 2.2.14. that part didn't work :)

James

On Thu, 10 Feb 2000, Brian Kress wrote:

> Hi all,
> 	
> 	I'm curious.  Why does the 2.3.40 patch to 
> Configure.help for LVM mess with sound drivers?
> 
> -Generic OPL2/OPL3 FM synthesizer support
> -CONFIG_SOUND_ADLIB
> -  Answer Y if your card has a FM chip made by Yamaha (OPL2/OPL3/OPL4).
> -  Answering Y is usually a safe and recommended choice, however some
> -  cards may have software (TSR) FM emulation. Enabling FM support with
> -  these cards may cause trouble (I don't currently know of any such
> -  cards, however).
> -
> -  Please read the file Documentation/sound/OPL3 if your card has an
> -  OPL3 chip.
> -
> -  If unsure, say Y.
> -
> -
> 
> -  Answer Y here, unless you know you will not need the option.
> +  Answer Y if your card has a FM chip made by Yamaha (OPL2/OPL3/OPL4).
> +  Answering Y is usually a safe and recommended choice, however some
> +  cards may have software (TSR) FM emulation. Enabling FM support with
> +  these cards may cause trouble (I don't currently know of any such
> +  cards, however).
> +  Please read the file Documentation/sound/OPL3 if your card has an
> +  OPL3 chip.
> 
> +  If unsure, say Y.
> +
> 
