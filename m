Date: Tue, 24 Oct 2000 22:40:17 +0930
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: Re: [linux-lvm] swap lv
Message-ID: <20001024224017.E27491@ist.flinders.edu.au>
References: <Pine.LNX.4.21.0010240950001.22183-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0010240950001.22183-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Tue, Oct 24, 2000 at 09:51:53AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Rauch <Holger.Rauch@heitec.de>
Cc: linux-lvm@msede.com

Holger Rauch [Holger.Rauch@heitec.de] wrote:

> Is it possible to have only one swap partition that resides on an LV? If
> so, how can this be achieved? Are swap LVs resizable?

I'm not quite sure what you mean by your first question.  But yes, you
can have a single lv which acts as a swap partition.  You need to
create the partition.  Then use mkswap on it, and then mount it as
swap.  For example, I have the line:

/dev/main_vg/swap_lv    none   swap    sw     0   0

in my /etc/fstab file.

As for resizing a swap partition.  What I would do is as follows.
First unmount your swap partition so that you are not using it
anymore.  Then delete the partition.  Then create it again, making it
a different size.  Then run mkswap again and mount it again.

(Not that I have actually tried this myself, but I don't see why it
wouldn't work.)

Cheers,

Mark.

-- 
_/~~~~~~~~\___/~~~~~~\____________________________________________________
____/~~\_____/~~\__/~~\__________________________Mark_Phillips____________
____/~~\_____/~~\________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~\__/~~\APTAIN_____________________________________________
____/~~\______/~~~~~~\____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
