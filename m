Date: Tue, 7 Nov 2000 12:16:00 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM 2.2 snapshot bug
Message-ID: <20001107121600.A18914@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <Pine.LNX.4.05.10011071151180.21541-100000@humbolt.nl.linux.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.05.10011071151180.21541-100000@humbolt.nl.linux.org>; from riel@conectiva.com.br on Tue, Nov 07, 2000 at 11:55:42AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@msede.com


Hi Rik,

this is already fixed in the LVM 0.9 source.

Thanks,
Heinz      -- The LVM guy --

On Tue, Nov 07, 2000 at 11:55:42AM +0100, Rik van Riel wrote:
> Hi,
> 
> I think I found an {easy to fix, very annoying} bug in the
> 2.2.<ver>aa derived kernel LVM drivers (which, most likely,
> is also in Heinz' drivers).
> 
> On snapshot creation, the snapshot block device (/dev/vg0/snap1)
> is NOT made a read-only device, so ext3 tries to do journal
> recovery when the snapshot device is mounted...
> 
> (leading to all kinds of nasty oopses)
> 
> It should be easy enough to do an set_device_ro() on the LVM
> snapshot, shouldn't it?

Yes, that's what i do in 0.9.

> 
> That would fix the oopses I've been seeing and would make
> the snapshot "more useful" ... I hope a fix will be available
> soon since I want to use this feature for NL.linux.org :)

I'll take care of that.

> 
> regards,
> 
> Rik
> --
> The Internet is not a network of computers. It is a network
> of people. That is its real strength.
> 
> http://www.conectiva.com/		http://www.surriel.com/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
