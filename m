Message-Id: <199904162148.AA09281@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Swap/DB devices
Date: Fri, 16 Apr 1999 23:47:06 METDST
In-Reply-To: <14103.41220.857159.602916@dukat.scot.redhat.com>; from "Stephen C. Tweedie" at Apr 16, 99 9:43 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sct@redhat.com
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> On Thu, 15 Apr 1999 16:24:10 METDST, Heinz Mauelshagen
> <mauelsha@ez-darmstadt.telekom.de> said:
> 
> > There is a raw device patch available by Stephen Tweedie.
> > IIRC it will make it into the 2.3 kernel (what do you say Stephen?).
> 

On Fri, 16 Apr 1999 21:43:48 +0100 (BST), Stephen Tweedie
<sct@redhat.com> said:
>
> That's the plan; Linus has approved it in principle.
> 
> > LVM has to be enhanced a little bit to support that patch.
> 
> I'm curious: why?  I would have thought that LVM should support any
> requests coming in through ll_rw_block already.
> 

It's simply a matter of userland (lv_create_node() and friends in lvmlib)
to create the LVM 'raw' device specials.
Only regular buffer cached device specials are created up to 0.6.

Regards,
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
