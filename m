Date: Fri, 14 Sep 2001 10:00:21 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] diff. in striping between HP-UX and Linux LVM
Message-ID: <20010914100021.A4205@sistina.com>
References: <sba1bb05.067@lvnbb.brandenburg.de>
Mime-Version: 1.0
In-Reply-To: <sba1bb05.067@lvnbb.brandenburg.de>; from Stephan.Hendl@lds.brandenburg.de on Fri, Sep 14, 2001 at 08:08:22AM +0200
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

Stephan,

the alternation of the subalocated stripes isn't visible in "lvdisplay -v".

In principle the allocation looks like (assuming an exmaple LV with
3 stripes and 6 LE):

LE0 -> PEa on PV1
LE1 -> PEb on PV1

LE2 -> PEc on PV2
LE3 -> PEd on PV2

LE4 -> PEe on PV3
LE5 -> PEf on PV3


If the stripes have a size of 64K the accesses to the address space of
the LV go like:

1st 64k -> 1st 64K PEa
2nd 64k -> 1st 64K PEc
3rd 64k -> 1st 64K PEe
4th 64k -> 2nd 64K PEa
5th 64k -> 2nd 64K PEc
6th 64k -> 2nd 64K PEe
...


Regards,
Heinz    -- The LVM Guy --



On Fri, Sep 14, 2001 at 08:08:22AM +0200, Stephan Hendl wrote:
> Hi all,
> 
> I have to work with both systems an found some differences in the striping between the two kinds of LVM. I created a vg consisting of two disks on the HP-UX and on the linux system and a lv with the "-i 2 -I 64"-option.
> 
> In the case of HP-UX the first LE points to the first PE on the first disk, the second LE points to the first PE of the second disk and so on. 
> 
> In case of Linux LVM the LEs corrospond to the PEs, there is no alternation and therefore no enhancement of performance because only one disk will be used at the same time.
> 
> Where I am wrong?
> 
> ciao
> Stephan
> 
> HP-UX:
> --- Logical volumes ---
> LV Name                     /dev/vgmail/lvol1
> VG Name                     /dev/vgmail
> LV Permission               read/write
> LV Status                   available/syncd
> Mirror copies               0
> Consistency Recovery        MWC
> Schedule                    striped
> LV Size (Mbytes)            4096
> Current LE                  1024
> Allocated PE                1024
> Stripes                     2
> Stripe Size (Kbytes)        64
> Bad block                   NONE
> Allocation                  strict
> IO Timeout (Seconds)        default
> 
>    --- Distribution of logical volume ---
>    PV Name            LE on PV  PE on PV
>    /dev/dsk/c4t6d1    512       512
>    /dev/dsk/c6t6d2    512       512
> 
>    --- Logical extents ---
>    LE    PV1                PE1   Status 1
>    00000 /dev/dsk/c4t6d1    00000 current
>    00001 /dev/dsk/c6t6d2    00000 current
>    00002 /dev/dsk/c4t6d1    00001 current
>    00003 /dev/dsk/c6t6d2    00001 current
>    00004 /dev/dsk/c4t6d1    00002 current
>    00005 /dev/dsk/c6t6d2    00002 current
>    00006 /dev/dsk/c4t6d1    00003 current
>    00007 /dev/dsk/c6t6d2    00003 current
>   ...
> 
> Linux:
> --- Logical volume ---
> LV Name                /dev/vg00/lvol1
> VG Name                vg00
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                4 GB
> Current LE             1024
> Allocated LE           1024
> Stripes                2
> Stripe size (KByte)    64
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
>    --- Distribution of logical volume on 2 physical volumes  ---
>    PV Name                  PE on PV     reads      writes
>    /dev/sdb1                512          1536487    1472056
>    /dev/sdc1                512          1535960    1472315
> 
>    --- logical volume i/o statistic ---
>    3072447 reads  2944371 writes
> 
>    --- Logical extents ---
>    LE    PV                        PE     reads      writes
>    00000 /dev/sdb1                 00000  0          1008
>    00001 /dev/sdb1                 00001  0          1024
>    00002 /dev/sdb1                 00002  0          590
>    00003 /dev/sdb1                 00003  0          848
>    00004 /dev/sdb1                 00004  0          16
>    00005 /dev/sdb1                 00005  0          0
>    00006 /dev/sdb1                 00006  272        2594
>  
> 
> 
> --
> LDS Brandenburg
> Dr. Stephan Hendl
> fon: +49-(0)331-39 471
> fax: +49-(0)331-27548 1187
> EMail: stephan.hendl@lds.brandenburg.de
> 
> 
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
