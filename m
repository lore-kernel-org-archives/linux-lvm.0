Date: Tue, 10 Aug 1999 22:59:55 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] bug in liblvm 0.7 [added on 11/15/1998]
Message-ID: <19990810225955.A14275@cyberhqz.com>
References: <19990731135859.C30729@cyberhqz.com> <199908020957.AA21641@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199908020957.AA21641@mailgate1b.telekom.de>; from Heinz Mauelshagen on Mon, Aug 02, 1999 at 11:57:11AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Aug 02, 1999 at 11:57:11AM +0000, Heinz Mauelshagen wrote:

> the simple idea behind this was to avoid not neccessary accesses in case of
> a regular /dev layout (no trouble in case of devfs anyway).

"regular" seems to vary from distribution to distribution,
unfortunately.

> If we put to much effort into holding up this concept i'ld rather say
> "let's throw it away and open all existing device special nodes in turn".

That may be the best bet.  Although it would be nice if it was smart
enough to throw away what it's already done.  If /dev/hda doesn't exist,
don't do any /dev/hda's.  And if /dev/hda is a full LVM drive, you may
as well not check partitions.  At this point, it's caused more problems
than majorly noted speed improvements, for me.

For now, I've created fifteen md and loop devices, even though I use 0.  I
suppose I could just remove them all...

> 
> Any opinions?

It's either got to be ripped out, or made *really* smart.  At this
point, I think it's why vgscan is failing.  Which brings me to my next
point, it would be nice if vgscan would say something on partial volume
groups, ie: "only 9/20 drives found for volume group "vg00", leaving
offline"

I think this code is what caused vgscan to fail for me.  Going to try it
now that I've added all the device files...

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
