Message-ID: <51712EFE.2000300@redhat.com>
Date: Fri, 19 Apr 2013 13:48:14 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAH5g024xgwq43FN11Wr5AgYEJKhWZQyXd3KZhqwoqceWNF5MCQ@mail.gmail.com>
In-Reply-To: <CAH5g024xgwq43FN11Wr5AgYEJKhWZQyXd3KZhqwoqceWNF5MCQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] (LONG) Delay when writing to LVM after boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Likely a question for ext4 forum - I guess FS is reading[1] and 
caching[2] additional metadata to find suitable block.

[1] explains the delay on first write
[2] explains no delay on subsequent writes

-- Marian

On 04/19/2013 03:16 AM, Ken Bass wrote:
> I have one LVG with one LV consisting of several physical drives, ranging
> from 500G to 3T, with a total size of 6.5T, formatted with ext4.
>
> After I boot the system, when anything writes a file to that LV, the write
> hangs for 1 minute or more, then continues at full speed with no errors.
> Some apps, though can't handle the delay, and report that the write fails.
>
> This does not occur with a small file ( < 50M or so ). But the first time a
> larger file is written, then the delay. And this delay occurs only one time.
>
> I have noticed something similar in the past with smaller LVs ( < 1T ), but
> the delay was insignificant then.  But as I grew this LV, the delay
> increased.
>
> I can run e2fsck on the LV, and even optimize directories (-D option), with
> no delay occurring.
>
> I have tried googling, but have not found any mention of something like
> this (maybe not using the right key words?). So, does this sound familiar
> to any LVM experts out there? Any suggestions?
>
> FWIW: I'm currently running Fedora 17 (64 bit), kernel
> 3.8.4-102.fc17.x86_64 (although I have seen this problem on 32 bit
> kernels/machines as well). I have 4 physical drives (500G, 1T, 1.5T, 3T),
> and non-raid configured.
>
> Some other info:
>
> [root@elmer ken]# lvmdiskscan
>    /dev/vg_elmer/lv_swap [       3.62 GiB]
>    /dev/sda1             [     500.00 MiB]
>    /dev/vg_elmer/lv_root [      23.81 GiB]
>    /dev/sda2             [      27.47 GiB] LVM physical volume
>    /dev/VG_NAS/LV_NAS    [       5.46 TiB]
>    /dev/sdb1             [       2.73 TiB] LVM physical volume
>    /dev/sdc1             [     465.76 GiB] LVM physical volume
>    /dev/sdd1             [     931.51 GiB] LVM physical volume
>    /dev/sde1             [       1.36 TiB] LVM physical volume
>    3 disks
>    1 partition
>    0 LVM physical volume whole disks
>    5 LVM physical volumes
> [root@elmer ken]# lvdisplay
>    --- Logical volume ---
>    LV Path                /dev/VG_NAS/LV_NAS
>    LV Name                LV_NAS
>    VG Name                VG_NAS
>    LV UUID                IO93PY-kFF2-19u7-33lX-m7Mg-8BZC-q12ttn
>    LV Write Access        read/write
>    LV Creation host, time ,
>    LV Status              available
>    # open                 1
>    LV Size                5.46 TiB
>    Current LE             1430794
>    Segments               5
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           253:2
> [root@elmer ken]#
>
> (note: sda is separate physical drive with system/kernel only - vg_elmer-*)
>
> T IA
>
> ken
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
