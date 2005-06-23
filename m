Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5N627u01517
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 02:02:07 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.194])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5N62176025090
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 02:02:01 -0400
Received: by zproxy.gmail.com with SMTP id 18so819792nzp
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 23:01:51 -0700 (PDT)
Message-ID: <3cd4d993050622230165d45269@mail.gmail.com>
Date: Thu, 23 Jun 2005 16:01:50 +1000
From: Jeff Ewing <jeffiewing@gmail.com>
In-Reply-To: <3cd4d99305062218025d6c3059@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <3cd4d99305062204374db9549@mail.gmail.com>
	<20050622141522.GD22056@null.msp.redhat.com>
	<3cd4d99305062218025d6c3059@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: PV segments corrupted in vg1 : LVM corrupted
Reply-To: Jeff Ewing <jeffiewing@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: AJ Lewis <alewis@redhat.com>

Noticed that pvdisplay works, and looks bad (0 Allocated PE)
 --- Physical volume ---
  PV Name               /dev/md1
  VG Name               vg1
  PV Size               25.40 GB / not usable 59.38 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              811
  Free PE               811
  Allocated PE          0
  PV UUID               EW1NJk-11h8-GVOX-zmcn-2l3V-fg0G-RWNyod

also mdadm cannot find an md superblock(not sure what this means):

mdadm --detail --query /dev/md1
/dev/md1: 25.40GiB raid1 2 devices, 0 spares. Use mdadm --detail for
more detail.
/dev/md1: No md super block found, not an md component.

lvmdiskscan looks ok.
lvm dumpconfig looks ok. 

Re-install of OS looks likely, just dont know why things got corrupted.  
Dont know where the pv volume information is stored.
