From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002111057.LAA15964@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Patch to 2.3.40
In-Reply-To: <38A338A3.13861967@moose.net> from Brian Kress at "Feb 10, 2000  5:16: 3 pm"
Date: Fri, 11 Feb 2000 11:57:11 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Brian Kress <kressb@moose.net>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi all,
> 	
> 	I'm curious.  Why does the 2.3.40 patch to 
> Configure.help for LVM mess with sound drivers?

It's just my fault.
Nobody complained so far ;-{)

Will make a better one and release it this weekend.

Heinz

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


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
