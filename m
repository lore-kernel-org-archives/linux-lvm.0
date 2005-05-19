Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4J9xZO06061
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 05:59:35 -0400
Received: from breemxgw3s01.ras (relay1.rasnet.it [213.156.34.249])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4J9xXRx015531
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 05:59:34 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 19 May 2005 11:58:09 +0200
Message-ID: <BFCF159FFD14F444B205968F32DBD5BB01700405@MAILEX01.rasgroup.ita.localnet>
From: "Magni Fabrizio" <Fabrizio.Magni@rasnet.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] same LV UUID after vgmerge
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,
I recently tested vgmerge on a SLES9 trying to merge 12 volume groups
into a single one.

Everything seemed fine but the I discovered that in my /dev/mapper I had
the devices for the logical volumes only for the target volume group.

The other appear using lvscan and lvdisplay.

I tried to generate the missing devices with vgmknodes without luck.

Now the strange part: all the logical volumes have duplicated LV UUID.

Here is an example:

  --- Logical volume ---
  LV Name                /dev/oradata1_a/oraredo1_1_2
  VG Name                oradata1_a
  LV UUID                000000-0000-0000-0000-0000-0000-000001
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                104.00 MB
  Current LE             26
  Segments               1
  Allocation             next free
  Read ahead sectors     120
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/oradata1_a/orablob102
  VG Name                oradata1_a
  LV UUID                000000-0000-0000-0000-0000-0000-000001
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                3.91 GB
  Current LE             1001
  Segments               1
  Allocation             next free
  Read ahead sectors     120
  Block device           253:0

(volumes are 141 so I'm not pasting the complete result lvdiplay
output).

Any idea how to solve this issue?

Thanks
Fabrizio
