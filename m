Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k49F09xU016402
	for <linux-lvm@redhat.com>; Tue, 9 May 2006 11:00:09 -0400
Received: from mail0.rawbw.com (mail0.rawbw.com [198.144.192.41])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k49Exw2a007173
	for <linux-lvm@redhat.com>; Tue, 9 May 2006 10:59:59 -0400
Received: from bicho.synchrodesign.com (m208-176.dsl.rawbw.com
	[198.144.208.176])
	by mail0.rawbw.com (8.11.6p2/8.11.6) with ESMTP id k49Exx731615
	for <linux-lvm@redhat.com>; Tue, 9 May 2006 07:59:59 -0700 (PDT)
Received: (from daniel@localhost)
	by bicho.synchrodesign.com (8.11.3nb1/8.11.3) id k49F1gI26292
	for linux-lvm@redhat.com; Tue, 9 May 2006 08:01:42 -0700 (PDT)
Date: Tue, 9 May 2006 08:01:42 -0700 (PDT)
From: Daniel Senderowicz <daniel@bicho.synchrodesign.com>
Message-Id: <200605091501.k49F1gI26292@bicho.synchrodesign.com>
Subject: [linux-lvm] Re: recovering the root partition under lvm
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I'm new to the list and also "very" new to lvm. I need some help
badly.

I installed FC5 on a VMware machine with the host being XP. The
installation went OK and as I said I didn't realize what the
installation was offering me in terms of the disk configuration.
Unfortunately at one point I stopped the virtual machine without
going through the proper linux shutdown sequence. So now the system
refuses the boot with a "kernel panic" message. After poking around
a bit I realised that the root partition was installed under an
LVM volume which I cannot access now. I booted the system with a
live-cd (gentoo) which has all the lvm tools. I need help in the
form of a recipe sequence on how I can fix the problem without
wiping it irreversibly.  Below is the output from running "lvdisplay".
Many thanks in advance.

Daniel

  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                BUx6ZG-QsMx-26hz-5iCv-0YF2-qm4B-ee0Mkw
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                95.00 GB
  Current LE             3040
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
   
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                R8uiEo-pCFO-MZd9-VTrr-To12-ZbGv-x5Pmbn
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                1.94 GB
  Current LE             62
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
