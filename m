From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Automatically GROW an LV to max size
Message-Id: <20020124133211.A8222@sistina.com>
References: <20020123172346.L8275@ultraviolet.org>
MIME-Version: 1.0
In-Reply-To: <20020123172346.L8275@ultraviolet.org>; from
    treed@ultraviolet.org on Wed, Jan 23, 2002 at 05:23:46PM -0800
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
Date: Thu Jan 24 06:36:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Tracy,
here's a simple script with a CL check to cut what you want.

Regards,
Heinz    -- The LVM Guy --

#!/bin/sh
cmd=`basename $0`
if [ $# -ne 1 ]; then
   echo -e "$cmd -- please call with just one logical volume path\n"
   exit 1
fi
LVNAME=$1
VGNAME=`echo $LVNAME|sed 's!/dev/!!;s!/.*$!!'`

FREE_PE=`vgdisplay $VGNAME|sed '/Free.*PE/!d;s!^.*Size !!;s!^ *!!;s! .*$!!'`
lvextend -l+$FREE_PE $LVNAME


On Wed, Jan 23, 2002 at 05:23:46PM -0800, Tracy R Reed wrote:
> I'm the system administrator for MP3.com. I talked to some Sistina
> developers who visited the office a year or so ago but don't recall their
> names now, sorry. One if the things I asked for in LVM (and would still
> like to see) is a switch to create an LV that is as big as the remaining
> disk space available. 
> 
> We have a redhat based kickstart install that sets up a basic / and then
> creates an LV out of the rest of the disk. Currently we have hard coded
> the size of the remaining disk but it would be really slick if we could
> just pass an option to lvcreate which would just create an lv with the
> most space possible. 
> 
> Right now if we ever install on anything other than one of our standard
> 36G disks we have to delete the lv that was made and resize it or if the
> disk is smaller than 36G the hard coded lvcreate size will fail due to
> lack of space. 
> 
> There's got to be a cleaner way to do it.
> 
> -- 
> Tracy Reed      http://www.ultraviolet.org


*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
