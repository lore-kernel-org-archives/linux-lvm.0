From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] Automatically GROW an LV to max size
Message-Id: <20020124021457.GA15661@balu.kawo2.rwth-aachen.de>
References: <20020123172346.L8275@ultraviolet.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020123172346.L8275@ultraviolet.org>
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
Date: Wed Jan 23 20:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 23, 2002 at 05:23:46PM -0800, Tracy R Reed wrote:
> 
> We have a redhat based kickstart install that sets up a basic / and then
> creates an LV out of the rest of the disk. Currently we have hard coded
> the size of the remaining disk but it would be really slick if we could
> just pass an option to lvcreate which would just create an lv with the
> most space possible. 
>
[...]
>
> There's got to be a cleaner way to do it.

Maybe not cleaner, but more flexible (and as it's only used for an
installer, where the output of vgdisplay is kind of defined, maybe
usable):

--- snip ---

#!/bin/bash

VG="vg0"  # Name of the volume group
LV="data" # Name of the logical vol.

FREE_PEs=$(vgdisplay $VG|grep "^Free  PE"|sed "s/^[a-zA-Z /]\+\([0-9]\+\).*/\\1/")
lvcreate -l $FREE_PEs -n $LV $VG

--- snip ---

You may want to doublecheck the regex before using this. And yes, a
switch in lvmcreate would be nicer, too. Just in case, you need a
solution *now*.

Regards, Markus

-- 
Free the Fluffy Bunny.
