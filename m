From: pamvdam@ramoth.xs4all.nl
Date: Sun, 22 Aug 1999 17:07:13 +0200
Subject: Re: [linux-lvm] LVM in stock kernel!?
Message-ID: <19990822170713.A18493@ladystrange.bluehorizon.nl>
References: <19990822081621.A13324@ladystrange.bluehorizon.nl> <199908221116.AA20083@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199908221116.AA20083@mailgate1b.telekom.de>; from Heinz Mauelshagen on Sun, Aug 22, 1999 at 01:14:36PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: pamvdam@ramoth.xs4all.nl, mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

On Sun, Aug 22, 1999 at 01:14:36PM +0000, Heinz Mauelshagen wrote:
> 
> Hi Pascal,
> 
> saw your mail today concerned with writes beyond the end of the device,
> Have seen this a couple of times before 8*(
> 
> It was a kernel problem in the block i/o layer these days not forced
> by the LVM but brougt to the surface by the heavy i/o load LVM striped 
> LVs pushed to the system.

It was a problem.... Mmmm. In 2.3.14 it still is.

> 
> Do you see the same trouble with LVM 0.7 in older kernel releases?

2.3.13 and the 2.3.14-pre release gave the same problem. I don't
know about earlier releases. Shall we bring this up to the linux kernel list? The MD users should have noticed it too. Indeed there was VERY heavy I/O
on the stripes.

BTW: 2.3.14 needed a little extra patch wrt the 2.3.13 LVM patch. Some-
body will have ported it too, if not say so, and I'll mail you the diff.

Best regards,

	Pascal





> 
> Regards,
> Heinz
