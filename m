Subject: Re: [linux-lvm] not enough free/allocatable physical extents to extend logical vo lume
Mime-Version: 1.0 (Apple Message framework v552)
From: AJ Lewis <lewis@sistina.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <C6B0A1AF05B7A04E9D8E784173AE3D2016300B@ausx2kmpc104.aus.amer.dell.com>
Message-Id: <49658C34-BEAC-11D7-A0A0-000393DC1896@sistina.com>
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
Date: Fri Jul 25 09:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm guessing you're trying to extend by too large a size.  Use 
pvdisplay on /dev/sde1 and note the number of physical extents free.  
Then try passing that to e2fsadm with the '-l' flag instead of passing 
33.91G with the '-L' flag.  This is just a guess though.  It's pretty 
hard to tell without all the commands you ran and the output they gave 
you.

On Thursday, Jul 24, 2003, at 23:14 US/Central, 
Taylor_Carpenter@Dell.com wrote:

> I am trying to add a 4th disk to an existing lv.  I am following the
> directions in
>
> http://tldp.org/HOWTO/LVM-HOWTO/x802.html
>
> but It is complaing about free physical extents when trying to extend 
> during
> the e2fsadm portion.
>
>
> root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "Scratch" [33.91 GB / 240 MB 
> free]
> pvscan -- ACTIVE   PV "/dev/sdc1" of VG "Scratch" [33.91 GB / 240 MB 
> free]
> pvscan -- ACTIVE   PV "/dev/sdd1" of VG "Scratch" [33.91 GB / 240 MB 
> free]
> pvscan -- ACTIVE   PV "/dev/sde1" of VG "Scratch" [33.91 GB / 33.91 GB 
> free]
> pvscan -- total: 4 [135.65 GB] / in use: 4 [135.65 GB] / in no VG: 0 
> [0]
>
>
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
>
>
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: 
lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint = D638 9C01 D08F 29A4 5D50  D064 F6A6 0ED6 E386 
E6EB
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...

A program is a device used to convert data into error messages.
