Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1146240603.23548.106.camel@localhost.localdomain>
References: <1146240603.23548.106.camel@localhost.localdomain>
Message-Id: <01309aa0302de7b36b75ce2612b38706@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] vgchange -ay Killed
Date: Fri, 28 Apr 2006 17:09:31 -0500
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, mingz@ele.uri.edu

You mean:
1) lvcreate -L 3k -n lv vg
2) vgchange -an vg
3) vgchange -ay vg

or do you mean something else?

  brassow

On Apr 28, 2006, at 11:10 AM, Ming Zhang wrote:

> This is what i get when try to active a VG with 3K LVs. repeatable.
>
>   LVM version:     2.02.01 (2005-11-23)
>   Library version: 1.02.02 (2006-01-04)
>   Driver version:  4.4.0
>
>
> [root@dualxeon ~]# vgchange -ay
> Killed
>
>
> seem that "Locking memory" only appear once, and then stuck till 
> killed.
>
> --------some debug output if i use vgchang -ay -vvv--------------
>     Found volume group "vg1"
>         Getting device info for vg1-v678
>         dm info
> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N
> [16384]
>         Locking LV
> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 (R)
>       Finding volume group for uuid
> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
>     Found volume group "vg1"
>         Getting device info for vg1-v679
>         dm info
> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 N
> [16384]
>         Locking LV
> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 (R)
>       Finding volume group for uuid
> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
>       /dev/md0: lvm2 label detected
>       /dev/md1: lvm2 label detected
>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
>     Found volume group "vg1"
>         Getting device info for vg1-v680
>         dm info
> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
> [16384]
>         dm info
> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
> [16384]
>         dm info vg1-v680  N   [16384]
>       Locking memory
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
