Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1G8jjit031394
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 03:45:45 -0500
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1G8jhdK012787
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 03:45:43 -0500
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id E10A7331E22
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 09:45:36 +0100 (CET)
Received: from [192.94.163.17] (santalis.cesca.es [192.94.163.17])
	by carlit.cesca.es (Postfix) with ESMTP id 317B7330E9C
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 09:45:35 +0100 (CET)
Message-ID: <45D56FD4.7060908@cesca.es>
Date: Fri, 16 Feb 2007 09:48:20 +0100
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvscan/vgscan/lvscan error
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi all,
I've found that all vgscan is giving me an error. This is the output:

# vgscan -v
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
  /dev/dm-4: read failed after 0 of 4096 at 12989693952: Input/output error
  /dev/dm-4: read failed after 0 of 4096 at 0: Input/output error
    Finding volume group "padicat"
  Found volume group "padicat" using metadata type lvm2
    Finding volume group "vg_bbdd"
  Found volume group "vg_bbdd" using metadata type lvm2
    Finding volume group "vg_ordal"
  Found volume group "vg_ordal" using metadata type lvm2

Any idea what this "Input/output error" on /dev/dm-4 does it means? What 
is causing this error?

Thank you!

-- 
......................................................................
         __
        / /          Jordi Prats
  C E / S / C A      Dept. de Sistemes
      /_/            Centre de Supercomputaci� de Catalunya

  Gran Capit�, 2-4 (Edifici Nexus) � 08034 Barcelona
  T. 93 205 6464 � F.  93 205 6979 � jprats@cesca.es
...................................................................... 
