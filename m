Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1671h1b002884
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 02:01:43 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.170])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1671R1K007224
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 02:01:27 -0500
Received: by wf-out-1314.google.com with SMTP id 25so693660wfc.6
	for <linux-lvm@redhat.com>; Thu, 05 Feb 2009 23:01:27 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Feb 2009 02:01:27 -0500
Message-ID: <cfe2fc960902052301y82ca7b1g4c88815b16358c0d@mail.gmail.com>
From: Shawn Hood <shawnlhood@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Accidental relabeling of LVM PV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I mistakenly ran parted mklabel on an LVM PV (/dev/sdg1).  Presumably,
this damaged the metadata area of the PV.  Will `pvcreate
--restorefile <backup> --uuid <old_uuid> /dev/sdg1` solve my problems
if it executes successfully, or have I damaged?  I've tried running it
but receive the following error:

  Couldn't find device with uuid '6LivE9-tYvi-H8Tm-yQbP-f7tE-OlDO-Nn5jJH'.
  Can't open /dev/sdg1 exclusively.  Mounted filesystem?

/dev/sdg1 is not mounted.  I assume a reboot may take care of this
problem, but I'm afraid I won't be able to remount the filesystem that
exists in the LV on this partition.


-- 
Shawn Hood
