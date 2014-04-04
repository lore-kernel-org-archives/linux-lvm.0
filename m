Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s34J6dM8014129
	for <linux-lvm@redhat.com>; Fri, 4 Apr 2014 15:06:39 -0400
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s34J6aEa023225
	for <linux-lvm@redhat.com>; Fri, 4 Apr 2014 15:06:36 -0400
Received: by mail-ve0-f176.google.com with SMTP id db11so1798879veb.35
	for <linux-lvm@redhat.com>; Fri, 04 Apr 2014 12:06:36 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 4 Apr 2014 15:06:35 -0400
Message-ID: <CACOqYckH6iQTyUY0-BU6d3b3gY3yHOUxLv7-Sh9VasODibiagQ@mail.gmail.com>
From: Jeremy Smith <jeremy@esilo.com>
Subject: [linux-lvm] Cannot activate thin volumes. are they lost forever?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Greetings. As mentioned previously, I may have ruined all thin volumes
on a thin pool of mine due to the metadata overflow problem.

I am running LVM version 2.02.98 on kernel 3.11.0-19-generic.

I managed to compile LVM version 2.02.99 in order to get the metadata
resize feature as described in the ChangeLog:

  "Add lvresize support for online thin pool metadata volume resize."

I performed the metadata resize which seemed to work fine, but none of
my thin volumes will activate.

I would like to know whether the thin volumes are recoverable or not,
but I have been unable to determine my next step. Here's what I have
so far:


jeremy@data-pool:~$ sudo lvdisplay ssmirrors/ThinPool
  --- Logical volume ---
  LV Name                ThinPool
  VG Name                ssmirrors
  LV UUID                DzHi2N-Wle2-MpdN-9VEm-FeYw-pQI4-q6PKnd
  LV Write Access        read/write
  LV Creation host, time data-pool, 2014-02-19 15:22:38 -0500
  LV Pool transaction ID 47
  LV Pool metadata       ThinPool_tmeta
  LV Pool data           ThinPool_tdata
  LV Pool chunk size     2.00 MiB
  LV Zero new blocks     yes
  LV Status              NOT available
  LV Size                12.14 TiB
  Current LE             3181356
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto


jeremy@data-pool:~$ sudo lvs
  LV           VG        Attr      LSize   Pool     Origin Data%  Move
Log Copy%  Convert
  ThinPool     ssmirrors twi---tz-  12.14t
  ss51mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss51mirrorv0 ssmirrors Vwi---tz- 735.00g ThinPool
  ss51mirrorv1 ssmirrors Vwi---tz- 735.00g ThinPool
  ss51mirrorv2 ssmirrors Vwi---tz- 735.00g ThinPool
  ss53mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss53mirrorv0 ssmirrors Vwi---tz- 687.00g ThinPool
  ss53mirrorv1 ssmirrors Vwi---tz- 687.00g ThinPool
  ss53mirrorv2 ssmirrors Vwi---tz- 687.00g ThinPool
  ss53mirrorv3 ssmirrors Vwi---tz- 687.00g ThinPool
  ss54mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss54mirrorv0 ssmirrors Vwi---tz- 917.00g ThinPool
  ss54mirrorv1 ssmirrors Vwi---tz- 917.00g ThinPool
  ss54mirrorv2 ssmirrors Vwi---tz- 917.00g ThinPool
  ss55mirror   ssmirrors -wi------   4.00g
  ss55mirrorv0 ssmirrors -wi------ 909.00g
  ss55mirrorv1 ssmirrors -wi------ 909.00g
  ss56mirror   ssmirrors -wi------   4.00g
  ss56mirrorv0 ssmirrors -wi------ 909.00g
  ss56mirrorv1 ssmirrors -wi------ 909.00g
  ss57mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss57mirrorv0 ssmirrors Vwi---tz- 407.00g ThinPool
  ss57mirrorv1 ssmirrors Vwi---tz- 407.00g ThinPool
  ss58mirror   ssmirrors -wi------   4.00g
  ss58mirrorv0 ssmirrors -wi------ 407.00g
  ss58mirrorv1 ssmirrors -wi------ 407.00g
  ss60mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss60mirrorv0 ssmirrors Vwi---tz- 900.00g ThinPool
  ss60mirrorv1 ssmirrors Vwi---tz- 900.00g ThinPool
  ss61mirror   ssmirrors -wi------   4.00g
  ss61mirrorv0 ssmirrors -wi------ 920.00g
  ss61mirrorv1 ssmirrors -wi------ 920.00g
  ss61mirrorv2 ssmirrors -wi------ 920.00g
  ss61mirrorv3 ssmirrors -wi------ 920.00g
  ss62mirror   ssmirrors -wi------   4.00g
  ss62mirrorv0 ssmirrors -wi------ 408.00g
  ss62mirrorv1 ssmirrors -wi------ 408.00g
  ss63mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss63mirrorv0 ssmirrors Vwi---tz- 909.00g ThinPool
  ss63mirrorv1 ssmirrors Vwi---tz- 909.00g ThinPool
  ss64mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss64mirrorv0 ssmirrors Vwi---tz- 924.00g ThinPool
  ss64mirrorv1 ssmirrors Vwi---tz- 924.00g ThinPool
  ss64mirrorv2 ssmirrors Vwi---tz- 924.00g ThinPool
  ss64mirrorv3 ssmirrors Vwi---tz- 924.00g ThinPool
  ss64mirrorv4 ssmirrors Vwi---tz- 924.00g ThinPool
  ss64mirrorv5 ssmirrors Vwi---tz- 924.00g ThinPool
  ss65mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss65mirrorv0 ssmirrors Vwi---tz- 444.00g ThinPool
  ss65mirrorv1 ssmirrors Vwi---tz- 444.00g ThinPool
  ss66mirror   ssmirrors Vwi---tz-   4.00g ThinPool
  ss66mirrorv0 ssmirrors Vwi---tz- 444.00g ThinPool
  ss66mirrorv1 ssmirrors Vwi---tz- 444.00g ThinPool
  root         system    -wi-ao---  14.90g
  swap         system    -wi-ao---   3.81g
  var          system    -wi-ao---  16.00g


jeremy@data-pool:~$ sudo lvscan
  ACTIVE            '/dev/system/swap' [3.81 GiB] inherit
  ACTIVE            '/dev/system/root' [14.90 GiB] inherit
  ACTIVE            '/dev/system/var' [16.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss55mirrorv0' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss55mirrorv1' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss55mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss56mirrorv0' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss56mirrorv1' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss56mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss58mirrorv0' [407.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss58mirrorv1' [407.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss58mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss62mirrorv0' [408.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss62mirrorv1' [408.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss62mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss61mirrorv0' [920.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss61mirrorv1' [920.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss61mirrorv2' [920.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss61mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss61mirrorv3' [920.00 GiB] inherit
  inactive          '/dev/ssmirrors/ThinPool' [12.14 TiB] inherit
  inactive          '/dev/ssmirrors/ss60mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss60mirrorv0' [900.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss60mirrorv1' [900.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv0' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv1' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv2' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv3' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv4' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss64mirrorv5' [924.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss57mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss57mirrorv0' [407.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss57mirrorv1' [407.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss63mirrorv0' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss63mirrorv1' [909.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss63mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss66mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss66mirrorv0' [444.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss66mirrorv1' [444.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss65mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss65mirrorv0' [444.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss65mirrorv1' [444.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss51mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss51mirrorv0' [735.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss51mirrorv1' [735.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss51mirrorv2' [735.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss53mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss53mirrorv0' [687.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss53mirrorv1' [687.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss53mirrorv2' [687.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss53mirrorv3' [687.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss54mirror' [4.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss54mirrorv0' [917.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss54mirrorv1' [917.00 GiB] inherit
  inactive          '/dev/ssmirrors/ss54mirrorv2' [917.00 GiB] inherit


jeremy@data-pool:~$ ls -l /dev/mapper/
total 0
crw------- 1 root root 10, 236 Apr  4 14:24 control
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-root -> ../dm-15
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-swap -> ../dm-14
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-var -> ../dm-16


jeremy@data-pool:~$ sudo lvchange -a y /dev/ssmirrors/ss51mirror
  Thin pool transaction_id=40, while expected: 46.
  Unable to deactivate open ssmirrors-ThinPool_tmeta (252:0)
  Unable to deactivate open ssmirrors-ThinPool_tdata (252:1)
  Failed to deactivate ssmirrors-ThinPool-tpool


jeremy@data-pool:~$ ls -l /dev/mapper/
total 0
crw------- 1 root root 10, 236 Apr  4 14:24 control
lrwxrwxrwx 1 root root       7 Apr  4 14:55 ssmirrors-ThinPool_tdata -> ../dm-1
lrwxrwxrwx 1 root root       7 Apr  4 14:55 ssmirrors-ThinPool_tmeta -> ../dm-0
lrwxrwxrwx 1 root root       7 Apr  4 14:55 ssmirrors-ThinPool-tpool -> ../dm-2
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-root -> ../dm-15
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-swap -> ../dm-14
lrwxrwxrwx 1 root root       8 Apr  4 14:26 system-var -> ../dm-16



Any ideas?
Thank you for any assistance,


-- 
Jeremy Smith
Systems Administrator
eSilo, LLC.
1530 Cypress Drive, Suite H
Jupiter, FL. 33469
561-747-6880 x 412 (Phone)
800-747-9255 x 412 (Toll Free)
866-598-1358 (After Hours)
561-747-6488 (Fax)
jeremy@esilo.com
