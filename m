Return-Path: <root@srv.sistina.com>
Date: Wed, 11 Jul 2001 15:06:55 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Question about LVM
Message-ID: <20010711150655.A22925@sistina.com>
References: <Pine.LNX.4.31L2.0107110613260.30807-100000@theendoftime.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31L2.0107110613260.30807-100000@theendoftime.net>; from fox@theendoftime.net on Wed, Jul 11, 2001 at 06:43:09AM -0600
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

On Wed, Jul 11, 2001 at 06:43:09AM -0600, fox@theendoftime.net wrote:
> Hi;
> 
> I ran into this issue with AIX lvm.  A hard drive died and the IBM
> hardware monkeys removed the drive before mirroring could be broken
> (removing lv copies down to one, and reducing the volume group by the one
> dead drive)

Tren,

Linux LVM doesn't support mirroring so far.
Therefore the AIX case you faced is not possible today.

You can achive mirroring by using Multiple Devices as PVs or hardware
raid systems.


> 
> However, because the drive had been removed before this could be done, the
> VGDA still had the old PVID of the old hdisk and would not let me remove
> it by the cannonical hdisk name.  The eventual solution was to run the
> rmlvcopy command and reducevg command with the PVID instead of the
> cannonical hdisk name.  There is no such command as rmlvcopy (or anything
> related as far as I can tell with Linux) but the reducevg is the same as
> vgreduce.  I am wondering if it's possible for a PV to be removed from the
> VG in such a way that the PV path (device name?) no longer exists in the
> system and thus, you wouldn't be able to do a vgreduce with the PV path
> (device name?)
> In this case, is it possible to run the vgreduce command
> with the PVID of the removed drive?

vgreduce accesses the *empty* PV to be reduced from some VG by device node.
In case it doesn't exist -> mknod it again.

> Or does the Linux LVM handle this
> automagically?  Is this even a possible case under Linux?  I have to admit
> I'm still new to the Linux LVM after having worked with AIX LVM for years
> now.

It's not a big deal with Linux LVM. As mentioned, the PV needs to be empty
in order to remove it from a VG. If the device node doesn't exist when trying
vgreduce, the admin probably has removed it by accident.

> 
> Thanks,
> 
> Tren.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
