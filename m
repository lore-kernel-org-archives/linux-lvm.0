From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm und promise fasttrack
Message-ID: <20011026101802.B32377@sistina.com>
References: <3BD849C6.7060308@gmx.de> <20011026081326.A18287@dragon.blacknet.de>
Mime-Version: 1.0
In-Reply-To: <20011026081326.A18287@dragon.blacknet.de>; from bock@blacknet.de on Fri, Oct 26, 2001 at 08:13:26AM +0200
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
Date: Fri Oct 26 03:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 08:13:26AM +0200, Goetz Bock wrote:
> 
> Hallo Jens,
> > > ich hab schon wieder ein "Problem".
> Well, it might be a good idea to write your requests to an international
> mailing list in english ...

Well, Jens probably wanted to send it to me personally :-)

> so let's translate your questions (not a strict translation)
> 
> > > Auf meinem Mainboard ist ein Promise Fasttrack 100 Controller.
> > > Die Festplatten kann ich ueber /dev/hd[e-h] ansprechen.
> > My mainboard features a Promise Fasttrack 100 Controller, and I can
> > access my harddrives as /dev/hd[e-h]
> > 
> > > Es gibt aber auch die Moeglichkeit das Hardware Raid anzuspechen ueber
> > > /dev/ataraid/d[0-2]px , mit x als Partitionsnummer.
> > But there is also the option to use the hardware raid as
> > /dev/ataraid/d[0-2]px, with x beeing the partition number
> > 
> > > Beim Aufruf von vgcreate passiert folgendes :
> > when calling vgcreate like this:
> > vgcreate gl_lvm /dev/ataraid/d0p1
> > vgcreate -- physical volume name "/dev/ataraid/d0p1" is invalid
> For this to work, you must first use pvcreate to add the LVM's PV
> information to your device:
> pvcreate /dev/ataraid/d0p1
> 
> But this will not help you, as pvcreate checls the device name against a
> list of valid devices, and /dev/ataraid is not port of this (at last not
> in the way outdated 0.9.1beta5 src I've on this system)
> 
> OOTH you should not trust the bios based softraid of any of the consumer
> raid devices, it is no hardware raid (not just MHO). If you want to do raid
> with IDE devices, I'd suggest using the kernel based MD drivers, and putting 
> every IDE disk on it's own channel.   

Yes, but if Jens still wants it, "atatraid" needs to be added to the _devdir
array in lvm_dir_cache.c.
In future LVM you just change/add an entry to a central config file.

> 
> -- 
> Goetz Bock                                              IT Consultant
> Dipl.-Inf. Univ.



-- 

Regards,
Heinz    -- The LVM Guy --

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
