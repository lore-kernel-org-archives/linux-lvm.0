Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9H5sSV29797
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 01:54:28 -0400
Received: from prmckinney.com (VDSL-130-13-242-7.PHNX.QWEST.NET [130.13.242.7])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9H5sC27023362
	for <linux-lvm@redhat.com>; Mon, 17 Oct 2005 01:54:22 -0400
Received: from www.prmckinney.com (prmckinney.com [127.0.0.1])
	by prmckinney.com (Postfix) with ESMTP id 4F19E8B769
	for <linux-lvm@redhat.com>; Sun, 16 Oct 2005 18:16:05 -0700 (MST)
Message-ID: <1489.130.13.242.7.1129511765.squirrel@www.prmckinney.com>
Date: Sun, 16 Oct 2005 18:16:05 -0700 (MST)
From: "Patrick McKinney" <linux-lvm@prmckinney.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: 
In-Reply-To: 
Subject: [linux-lvm] Problem reading/writing to disk
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

I'm having problems with reads and writes to my LVM disks stalling after
transferring a bit of data.

I have 2 250G SATA disks in a logical volume.  I initially only had one of
the drives in the LV with JFS, the other was stand alone with XFS.  I was
able to transfer all of the data (~90% full) off the standalone drive onto
the LV, and then I changed the partition to Linux LVM, and extended my
LG/LV to include both drives.  I remounted,resized the JFS partition, and
confirmed the additional space with df.  But now I see problems
reading/writing data.  If I try to transfer a 1Gig file from root (PATA
disk with ext3) to my LV it copies the 1st ~400M at nice fast transfer
speed, but then it seems to stall out, and xfer rate drops to ~1M/s!  I
see the same behavior if I try to copy a file from LVM to my root, except
it gets about 600M before stalling.

Any ideas what is going on here??  I've tried moving the disks to a
different computer (using a sata_piix controller vs sata_sil).  So I don't
think it is the SATA controller, and like I said the drives worked fine
independently.  So I think probably has something to do with LVM, but I'm
not sure how to go about debugging this problem (I don't see any errors in
the logs).

BTW, this is a x86 box running fedora core 4 (2.6.13-1.1526_FC4 kernel)
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.4.0

Thanks,
Patrick
