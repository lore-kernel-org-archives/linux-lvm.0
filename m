Return-Path: <jweber@valinux.com>
Date: Thu, 10 May 2001 00:22:37 -0700 (PDT)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] Max logical volume size 1TB or 2TB?
In-Reply-To: <200105100633.f4A6XbAr021289@webber.adilger.int>
Message-ID: <Pine.LNX.4.30.0105100021270.5294-100000@shells.valinux.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hmm, I could help out on this one also, since I've access to larger 72G
disks which require filling less space. :)

I'll give this a go soon hopefully and see if we can't sort this one out.
I'd definately be interested in getting all we can out of it. :)

On Thu, 10 May 2001, Andreas Dilger wrote:

> Date: Thu, 10 May 2001 00:33:37 -0600 (MDT)
> From: Andreas Dilger <adilger@turbolinux.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Max logical volume size 1TB or 2TB?
>
> Andrew Patterson writes:
> > I patched LVM 0.9.1_beta7 lvm.h source a little to get past the system
> > defined limits.
> >
> > These are the changes I made:
> >
> > #define LVM_LV_SIZE_MAX(a)      ( ( long long) LVM_PE_T_MAX * (a)->pe_size > (
> > long long) 1024*1024/SECTOR_SIZE*1024*1024*2 ? ( long long)
> > 1024*1024/SECTOR_SIZE*1024*1024*2 : ( long long) LVM_PE_T_MAX * (a)->pe_size)
> >
> > #define LVM_MAX_SIZE            ( 1024LU * 1024 / SECTOR_SIZE * 1024 * 1024*2)
>
> I presume the originals should not have the *2 on them?
>
> > goes to:
> >
> > #define LVM_LV_SIZE_MAX(a)      ( ( long long) LVM_PE_T_MAX * (a)->pe_size > (
> > long long) 1024*1024/SECTOR_SIZE*1024*1024*2 ? ( long long)
> > 1024*1024/SECTOR_SIZE*1024*1024*2 : ( long long) LVM_PE_T_MAX * (a)->pe_size)
> >
> > #define LVM_MAX_SIZE            ( 1024LU * 1024 / SECTOR_SIZE * 1024 * 1024*2)
>
> You probably want to go to something like (i.e. slightly less than 2GB):
>
> #define LVM_LV_SIZE_MAX(a)      ( ( long long) LVM_PE_T_MAX * (a)->pe_size > (
> long long) 1024*1024/SECTOR_SIZE*1024*2047 ? ( long long)
> 1024*1024/SECTOR_SIZE*1024*2047 : ( long long) LVM_PE_T_MAX * (a)->pe_size)
>
> #define LVM_MAX_SIZE            ( 1024LU * 1024 / SECTOR_SIZE * 1024 * 2047)
>
> The reason is that since we are talking about 512-byte sectors here, your
> original values are exactly 2^32, so this is probably overflowing a 32-bit
> value somewhere.  Since the Linux block layer limits you to 2TB anyways,
> it is not a real issue for the LVM limit to be slightly less than 2TB.
> How much less depends on how many more disks you have...  Probably any
> value <= 2^32-1 should be OK.
>
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
