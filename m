Message-ID: <3B8F9E7E.9AEA4EB0@bellsouth.net>
Date: Fri, 31 Aug 2001 10:26:06 -0400
From: Jeff Layton <laytonjb@bellsouth.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and SPL
References: <20010831084053.A24948@otto.plogic.internal>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com
Cc: rlatham@plogic.com

Rob Latham wrote:

> sistina this week switched the license for the GFS tools from the GPL
> to the SPL
>
> http://www.sistina.com/Sistina%20Public%20License%201.0.pdf
>
> I'm worried now that Sistina will switch the license for LVM.
> However, considering there was almost a fork of the project (mostly)
> because of something as "simple" as mailing list policy, i guess
> openLVM would pop up again pretty quickly in that case...   Is it
> concievable that the kernel patches will stay GPL'ed but a more
> restrictive license applied to the userspace tools ?
>
> ==rob

I hate to say it - time to fork the code. We could also jump ship to
IBM's opensource EVMS. To be honest, I don't want to do either thing
because I really like LVM, I've had very good luck with it, and I use
it in production systems. However, changing licenses like this, while
not on LVM, is not a good sign to me (call it a bad feeling if you like).

Unfortunately, I'm not a low-level coder, otherwise I'd jump it and fork
the code. Anyone want to volunteer? Anyone from Suse?

However, before parting company, I'd like to say thank you to all of
the developers who have put in very long hours and lots of work into
LVM. It was a much needed piece to the Linux puzzle.

Thanks!

Jeff Layton

Lockheed-Martin


>
>
> --
> [ Rob Latham <rlatham@plogic.com>         Developer, Admin, Alchemist ]
> [ Paralogic Inc. - www.plogic.com                                     ]
> [                                                                     ]
> [ EAE8 DE90 85BB 526F 3181                   1FCF 51C4 B6CB 08CC 0897 ]
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
