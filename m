Return-Path: <root@srv.sistina.com>
Date: Wed, 25 Apr 2001 11:47:59 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
Message-ID: <20010425114759.A4514@sistina.com>
References: <000901c0cd36$a80064a0$7d80a8c0@dyndns.org> <01042510065800.15131@workstation>
Mime-Version: 1.0
In-Reply-To: <01042510065800.15131@workstation>; from fabian.herschel@suse.de on Wed, Apr 25, 2001 at 10:06:58AM +0200
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

On Wed, Apr 25, 2001 at 10:06:58AM +0200, fabian herschel wrote:
> On Wednesday 25 April 2001 05:20, you wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Have you tried a vgimport?
> 
> Yes I did. vgimport does not want to import the VG, because it is not an 
> exported one :((.
> 
> On an other machine I had the same problem and I tried to make a vgexport.
> The _export_ went well (the VG was exported but I could not re-import it ).
> 
> I tried some things last night... 
>   - First I have saved the heder blocks (VGDA) with dd (dd if=/dev/sda1   \
>      of=/root/HEAD_sda1 count=4596 bs=512) 
>   - Then I called a vgcfgrestore -n sysvg /dev/sda1.
>   - Now pvscan tells me both PVs are in the VG sysvg. 
>   - "vgchange -ay sysvg" activated the VG and the LVs could me mounted 
> 
> BUT
>   - vgscan does NOT find the sysvg!!!
>   - After a reboot the sysvg is not available.
>   - Every time I have to call a vgcfgrestore :((
> 
> I have written a C-program which could retrieve all data from a LV, if pvdata 
> -E reports correctly, but the LV could not be activated. But this is only a 
> very bad work arround to retrieve my data. But I need a way to reactivate my 
> VG, so it could be found by vgscan.
> 
> I'm hopeful we will find a solution.

These "vgscan can't find my..." errors still show up on a too regular base :-(
They absolutely need to be fixed before the 1.0 release.

Could you please send your two VGDAs compressed email attached to mee in order
to be able to investigate more.

Add the "vgscan -d" output for the fail case as well, please.

> Fabian Herschel
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
