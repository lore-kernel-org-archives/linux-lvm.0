From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and Network Block Device (problem sollution)
Message-ID: <20031103111449.G1850@sistina.com>
References: <1419914140.20031101053847@tnonline.net> <212842093.20031101062735@tnonline.net>
Mime-Version: 1.0
In-Reply-To: <212842093.20031101062735@tnonline.net>; from spam@tnonline.net on Sat, Nov 01, 2003 at 06:27:35AM +0100
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
Date: Mon Nov  3 04:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 01, 2003 at 06:27:35AM +0100, Spam wrote:
> 
>   The sollution to the problem was simple. The lvm tools are hardcoded
>   (from  lvm_dir_cache.c)  to  only look for specific directories when
>   scaning  for  lvm disks. For network block devices lvm looks only in
>   /dev/nb/*, while my Gentoo kernel created /dev/nbd/*.
> 
>   A  simple  fix was to make a link /dev/nb->/dev/nbd and it worked. I
>   did not find anything about this in the howto or man-pages.

In LVM2 we don't have hard-coded device namespace like this any more.
You can set up filters in /etc/lvm/lvm.conf, run vgscan and devices
conforming to your filters are used/excluded.

Want to give LVM2 a try ? ;)
(It is LVM1 metadata compatible)

> 
>   //Anders
> 
> >   Hello,
> 
> >   How can I make lvm to recognize my network block devices? They are
> >   listed in /dev/nbd/* and I can access them fine with fdisk or dd.
> 
> >   But when I try pvdisplay /dev/nbd/0 I get the following error:
> 
> >   pvdisplay - ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID
> >               physical volume "/dev/nbd/0"
> 
> >   I get no errors in the logs either so I am not sure where to start.
> 
> >   From what I see lvmdiskscan etc looks in /proc/partitions and never
> >   scans /dev/ for valid blockdevices?
>   
> >   Thanks for any input,
> >   Anders
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
