Date: Tue, 3 Jun 2008 15:15:40 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] Can't get rid of INACTIVE read/write snapshot
In-Reply-To: <48443B86.DB9C.0010.0@milprog.ch>
Message-ID: <Pine.LNX.4.64.0806031513430.20514@engineering.redhat.com>
References: <48443B86.DB9C.0010.0@milprog.ch>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marcel Gsteiger <Marcel.Gsteiger@milprog.ch>

> Hi all
>
> I'm using lvm2-2.01.08-2.1 on fc4, kernel 2.6.16-1 with linux-vserver 
> patches.
>
> A while ago, I mistakenly created a 39GB read-write snapshot of my 
> /vservers partition (which, btw, seemed to work). But after some time 
> this partition got to an overflow and since then I can't get rid of it 
> anymore. See the lvdisplay output below.
>
> lvchange -an or --refresh gives me a message "Can't change snapshot 
> logical volume "vservers_snapshot"".
>
> lvremove lets me wait, then "top" shows 100% IO-Wait but does not come 
> to an end (at least after an hour). I don't know how much patience I 
> would need, this box is rather fast otherwise (dual xeon 2.8GHz w/ SATA 
> drives).

Hi

It looks like an unknown bug in lvremove. Send a strace of lvremove while 
it waits for that long amount of time.

Mikulas

> Rebooting does not help anything.
>
> Is there a safe way to simply get rid of this snapshot? Any help would 
> much be appreciated.
>
> Regards
> --Marcel
>
> --- Logical volume ---
>  LV Name                /dev/vg00/lv00_vservers
>  VG Name                vg00
>  LV UUID                9oELP3-2l7d-gTML-2xg2-unTu-znP0-qVd3Mc
>  LV Write Access        read/write
>  LV snapshot status     source of
>                         /dev/vg00/vservers_snapshot [INACTIVE]
>  LV Status              available
>  # open                 1
>  LV Size                39,06 GB
>  Current LE             625
>  Segments               1
>  Allocation             contiguous
>  Read ahead sectors     0
>  Block device           253:9
>
>  --- Logical volume ---
>  LV Name                /dev/vg00/vservers_snapshot
>  VG Name                vg00
>  LV UUID                cQEj3z-V2jD-QOCl-3Yea-ETQZ-Egj9-2B7nd2
>  LV Write Access        read/write
>  LV snapshot status     INACTIVE destination for /dev/vg00/lv00_vservers
>  LV Status              available
>  # open                 0
>  LV Size                39,06 GB
>  Current LE             625
>  Segments               1
>  Snapshot chunk size    4,00 KB
>  Allocated to snapshot  100,00%
>  Allocation             inherit
>  Read ahead sectors     0
>  Block device           253:8
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
