Date: Wed, 14 Apr 2004 10:44:04 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Meaning of strict allocation
Message-ID: <20040414084404.GB22343@redhat.com>
References: <BAY16-DAV32wB0jTj7z000022e2@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY16-DAV32wB0jTj7z000022e2@hotmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com

On Thu, Apr 08, 2004 at 07:57:07PM -0700, sachin wrote:
> Hi
> 
> when I  executed the lvdisplay command  i get the following output
> 
> --- Logical volume ---
> LV Name                /dev/vg/lv1
> VG Name                vg
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                4 GB
> Current LE             1024
> Allocated LE           1024
> Stripes                4
> Stripe size (KByte)    16
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:0
> 
> Can any one tell  me what that ALLOCATION next free means
> and also what strict allocation means.

'Next free' allocates the next free physical extents it finds in
the VG while extending any logical volume.

There's no 'strict' allocation in LVM.
Your other option is 'contiguous' which means allocation of subsequent areas
of PEs.

> 
> I also tried lvdisplay  with -v option
> 
> it gives me read and writes
> What that exactly means 
>       1. No of read and write operation
>       2  No of blocks transferd 
>       3. No of sectors read or written 

1

> 
> One more thing  this io statics is from which time 
>      1. bootup time
>      2. lv creation time

3. VG activation time (vgchange -ay)

> 
> Thanks
> Sachin. 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
