Received: from localhost.localdomain (radish.cambridge.redhat.com
	[172.16.18.90])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4JIoG005403
	for <linux-lvm@redhat.com>; Wed, 19 May 2004 14:50:16 -0400
Received: from radish.cambridge.redhat.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.10/8.12.7) with ESMTP id
	i4JIoFm1004662
	for <linux-lvm@redhat.com>; Wed, 19 May 2004 19:50:15 +0100
Received: (from jorton@localhost)
	by radish.cambridge.redhat.com (8.12.10/8.12.10/Submit) id
	i4JIoFnn004661
	for linux-lvm@redhat.com; Wed, 19 May 2004 19:50:15 +0100
Date: Wed, 19 May 2004 19:50:15 +0100
From: Joe Orton <jorton@redhat.com>
Message-ID: <20040519185015.GA4623@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm2 migration issue
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I'm trying to upgrade one of my Fedora Core 1 boxes to FC2, which has
the root filesystem on LVM.  The installer won't allow me to ugprade
because, it seems, vgscan is returning an error.

The output of "lvm vgscan -v -d" from a VC whilst running the installer
is:

  1 PV(s) found for VG mainvg: expected 2
  Volume group "mainvg" not found
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "mainvg"

"lvm pvscan" gives:

  1 PV(s) found for VG mainvg: expected 2
  Logical volume (usrvol) contains an incomplete mapping table.
    Wiping cache of LVM-capable devices
    Wiping internal cache
    Walking through all physical volumes
  PV /dev/hda7   VG mainvg   lvm1 [19.82 GB / 0    free]
  Total: 1 [19.82 GB] / in use: 1 [19.82 GB] / in no VG: 0 [0   ]

so it doesn't recognise /dev/hda2 as a PV, for some reason.

When booted into FC1, /proc/lvm/global has:

LVM module LVM version 1.0.5+(22/07/2002)

Total:  1 VG  2 PVs  2 LVs (1 LV open 1 times)

Global: 105960 bytes malloced   IOP version: 10   0:30:18 active

VG:  mainvg  [2 PV, 2 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 25907200 /6325 total  25907200 /6325 used  0 /0 free
  PVs: [AA] hda2                   5120000 /1250     5120000 /1250           0 /0     
       [AA] hda7                  20787200 /5075    20787200 /5075           0 /0     
    LVs: [AWDL  ] usrvol                     5120000 /1250     1x open
         [AWDL  ] storevol                  20787200 /5075     close

and back booted into the FC2 installer, 

# lvm pvdisplay  /dev/hda2
  Failed to read physical volume "/dev/hda2"

Any ideas how I can get round this?

Regards,

joe
