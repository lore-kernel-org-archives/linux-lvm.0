Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3E89bCK026768
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 04:09:37 -0400
Message-ID: <534B97C0.30306@redhat.com>
Date: Mon, 14 Apr 2014 10:09:36 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CACOqYckH6iQTyUY0-BU6d3b3gY3yHOUxLv7-Sh9VasODibiagQ@mail.gmail.com>
In-Reply-To: <CACOqYckH6iQTyUY0-BU6d3b3gY3yHOUxLv7-Sh9VasODibiagQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot activate thin volumes. are they lost forever?
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

Dne 4.4.2014 21:06, Jeremy Smith napsal(a):
> Greetings. As mentioned previously, I may have ruined all thin volumes
> on a thin pool of mine due to the metadata overflow problem.
>
> I am running LVM version 2.02.98 on kernel 3.11.0-19-generic.
>
> I managed to compile LVM version 2.02.99 in order to get the metadata
> resize feature as described in the ChangeLog:
>
>    "Add lvresize support for online thin pool metadata volume resize."
>
> I performed the metadata resize which seemed to work fine, but none of
> my thin volumes will activate.
>
> I would like to know whether the thin volumes are recoverable or not,
> but I have been unable to determine my next step. Here's what I have
> so far:
>
>
> jeremy@data-pool:~$ sudo lvdisplay ssmirrors/ThinPool
>    --- Logical volume ---
>    LV Name                ThinPool
>    VG Name                ssmirrors
>    LV UUID                DzHi2N-Wle2-MpdN-9VEm-FeYw-pQI4-q6PKnd
>    LV Write Access        read/write
>    LV Creation host, time data-pool, 2014-02-19 15:22:38 -0500
>    LV Pool transaction ID 47
>    LV Pool metadata       ThinPool_tmeta
>    LV Pool data           ThinPool_tdata
>    LV Pool chunk size     2.00 MiB
>    LV Zero new blocks     yes
>    LV Status              NOT available
>    LV Size                12.14 TiB
>    Current LE             3181356
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>
>
> jeremy@data-pool:~$ sudo lvs
>    LV           VG        Attr      LSize   Pool     Origin Data%  Move
> Log Copy%  Convert
>    ThinPool     ssmirrors twi---tz-  12.14t
>    ss51mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss51mirrorv0 ssmirrors Vwi---tz- 735.00g ThinPool
>    ss51mirrorv1 ssmirrors Vwi---tz- 735.00g ThinPool
>    ss51mirrorv2 ssmirrors Vwi---tz- 735.00g ThinPool
>    ss53mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss53mirrorv0 ssmirrors Vwi---tz- 687.00g ThinPool
>    ss53mirrorv1 ssmirrors Vwi---tz- 687.00g ThinPool
>    ss53mirrorv2 ssmirrors Vwi---tz- 687.00g ThinPool
>    ss53mirrorv3 ssmirrors Vwi---tz- 687.00g ThinPool
>    ss54mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss54mirrorv0 ssmirrors Vwi---tz- 917.00g ThinPool
>    ss54mirrorv1 ssmirrors Vwi---tz- 917.00g ThinPool
>    ss54mirrorv2 ssmirrors Vwi---tz- 917.00g ThinPool
>    ss55mirror   ssmirrors -wi------   4.00g
>    ss55mirrorv0 ssmirrors -wi------ 909.00g
>    ss55mirrorv1 ssmirrors -wi------ 909.00g
>    ss56mirror   ssmirrors -wi------   4.00g
>    ss56mirrorv0 ssmirrors -wi------ 909.00g
>    ss56mirrorv1 ssmirrors -wi------ 909.00g
>    ss57mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss57mirrorv0 ssmirrors Vwi---tz- 407.00g ThinPool
>    ss57mirrorv1 ssmirrors Vwi---tz- 407.00g ThinPool
>    ss58mirror   ssmirrors -wi------   4.00g
>    ss58mirrorv0 ssmirrors -wi------ 407.00g
>    ss58mirrorv1 ssmirrors -wi------ 407.00g
>    ss60mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss60mirrorv0 ssmirrors Vwi---tz- 900.00g ThinPool
>    ss60mirrorv1 ssmirrors Vwi---tz- 900.00g ThinPool
>    ss61mirror   ssmirrors -wi------   4.00g
>    ss61mirrorv0 ssmirrors -wi------ 920.00g
>    ss61mirrorv1 ssmirrors -wi------ 920.00g
>    ss61mirrorv2 ssmirrors -wi------ 920.00g
>    ss61mirrorv3 ssmirrors -wi------ 920.00g
>    ss62mirror   ssmirrors -wi------   4.00g
>    ss62mirrorv0 ssmirrors -wi------ 408.00g
>    ss62mirrorv1 ssmirrors -wi------ 408.00g
>    ss63mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss63mirrorv0 ssmirrors Vwi---tz- 909.00g ThinPool
>    ss63mirrorv1 ssmirrors Vwi---tz- 909.00g ThinPool
>    ss64mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss64mirrorv0 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss64mirrorv1 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss64mirrorv2 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss64mirrorv3 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss64mirrorv4 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss64mirrorv5 ssmirrors Vwi---tz- 924.00g ThinPool
>    ss65mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss65mirrorv0 ssmirrors Vwi---tz- 444.00g ThinPool
>    ss65mirrorv1 ssmirrors Vwi---tz- 444.00g ThinPool
>    ss66mirror   ssmirrors Vwi---tz-   4.00g ThinPool
>    ss66mirrorv0 ssmirrors Vwi---tz- 444.00g ThinPool
>    ss66mirrorv1 ssmirrors Vwi---tz- 444.00g ThinPool
>    root         system    -wi-ao---  14.90g
>    swap         system    -wi-ao---   3.81g
>    var          system    -wi-ao---  16.00g
>
>
> jeremy@data-pool:~$ sudo lvscan
>    ACTIVE            '/dev/system/swap' [3.81 GiB] inherit
>    ACTIVE            '/dev/system/root' [14.90 GiB] inherit
>    ACTIVE            '/dev/system/var' [16.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss55mirrorv0' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss55mirrorv1' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss55mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss56mirrorv0' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss56mirrorv1' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss56mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss58mirrorv0' [407.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss58mirrorv1' [407.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss58mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss62mirrorv0' [408.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss62mirrorv1' [408.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss62mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss61mirrorv0' [920.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss61mirrorv1' [920.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss61mirrorv2' [920.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss61mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss61mirrorv3' [920.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ThinPool' [12.14 TiB] inherit
>    inactive          '/dev/ssmirrors/ss60mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss60mirrorv0' [900.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss60mirrorv1' [900.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv0' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv1' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv2' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv3' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv4' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss64mirrorv5' [924.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss57mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss57mirrorv0' [407.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss57mirrorv1' [407.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss63mirrorv0' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss63mirrorv1' [909.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss63mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss66mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss66mirrorv0' [444.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss66mirrorv1' [444.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss65mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss65mirrorv0' [444.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss65mirrorv1' [444.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss51mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss51mirrorv0' [735.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss51mirrorv1' [735.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss51mirrorv2' [735.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss53mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss53mirrorv0' [687.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss53mirrorv1' [687.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss53mirrorv2' [687.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss53mirrorv3' [687.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss54mirror' [4.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss54mirrorv0' [917.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss54mirrorv1' [917.00 GiB] inherit
>    inactive          '/dev/ssmirrors/ss54mirrorv2' [917.00 GiB] inherit
>
>
> jeremy@data-pool:~$ ls -l /dev/mapper/
> total 0
> crw------- 1 root root 10, 236 Apr  4 14:24 control
> lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-root -> ../dm-15
> lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-swap -> ../dm-14
> lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-var -> ../dm-16
>
>
> jeremy@data-pool:~$ sudo lvchange -a y /dev/ssmirrors/ss51mirror
>    Thin pool transaction_id=40, while expected: 46.
>    Unable to deactivate open ssmirrors-ThinPool_tmeta (252:0)
>    Unable to deactivate open ssmirrors-ThinPool_tdata (252:1)
>    Failed to deactivate ssmirrors-ThinPool-tpool


What have you been doing here ?

Have you used  'live' thin-pool metadata for resize ?
(i.e. you were operating with active thin-pool volume,
while  using command  thin_repair on  _tmeta device ?


You could eventually try to   vgcfgbackup  your VG,
manually edit pool's transaction id to match kernel number,
but you've been warned - that there were most probably
6 other transaction which are lost ?

This may also mean - the changes in chunks are also lost -
so if your volumes were allocating/releasing chunks - it's all lost
(depending on what have you been doing - hard to guess...)

You should be able to active pool with matching transaction_id,
but it's somewhat unpredictable if all LVs will have the right content.
(restore operation is going to be improved to add more validation)

Zdenek
