Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 14:21:43 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find VGs
Message-ID: <20010725142143.A25531@sistina.com>
References: <996061897.15463.19.camel@pc-16>
Mime-Version: 1.0
In-Reply-To: <996061897.15463.19.camel@pc-16>; from terje.eggestad@scali.no on Wed, Jul 25, 2001 at 01:51:37PM +0200
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 25, 2001 at 01:51:37PM +0200, Terje Eggestad wrote:
> NB: I'm using 0.9.1 B2 in case this problem is already fixed!
> (also RH 7.1 with stock 2.4.3).
> 
> But since At the bottom of http://www.sistina.com/lvm/doc/KNOWN_BUGS
> is says:
> 
> - there still seems to be a rare condition when vgscan(8) fails
>   to find your VGs.
>   Basically you only need to run vgscan if your disk
>   configuration changed or your lost your /etc/lvmtab* entries.
> 
> So it still may not be fixed.
> 
> Anyway i figured out that vgscan fails if there is a CD in the CD
> player, doesn't matter if's a audio or iso9660 CD.
> 

That error is only returned, if the read from the device fails (the CD ro drive)
and pv_read_all_pv() continues with looping through all found device specials.

After the loop the return code is zeroed *if* at least one PV has been found,
which should be the case (I assume you use a partition on hda as a PV).

Shouldn't make it fail.

In regard to your debug output:

What is XXX in the lines 
"pv_read_all_pv -- avoiding multiple entries"
in case of MD; np: XXX"? (np is the number of found PVs before deleting multiple
entries in the list of PVs).

What is YYY in the line "pv_read_all_pv -- LEAVING with ret: YYY"?

Regards,
Heinz    -- The LVM Guy --

> if you run vgscan -d 
> you get way down:
> <333> pv_read -- going to read /dev/hdc
> <333> pv_read -- LEAVING with ret: -282
> <22> pv_read_all_pv -- pv_read returned: -282
> 
> I only have hda and hdc, no scsi. 
> 
> TJ
> 
> --
> _________________________________________________________________________
> 
> Terje Eggestad                  terje.eggestad@scali.no
> Scali Scalable Linux Systems    http://www.scali.com
> 
> Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
> P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
> N-0621 Oslo                     fax:    +47 22 62 89 51
> NORWAY            
> _________________________________________________________________________
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
