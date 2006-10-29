Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9TF6s11023237
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 10:06:54 -0500
Received: from karakal.cosy.sbg.ac.at (karakal.cosy.sbg.ac.at [141.201.2.175])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9TF6qJt001645
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 10:06:52 -0500
Received: from webmail.cosy.sbg.ac.at (localhost.localdomain [127.0.0.1])
	by karakal.cosy.sbg.ac.at (Postfix) with ESMTP id 35C458D4751
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 16:07:01 +0100 (CET)
Message-ID: <3377.62.99.165.114.1162134421.squirrel@webmail.cosy.sbg.ac.at>
In-Reply-To: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
References: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
Date: Sun, 29 Oct 2006 16:07:01 +0100 (CET)
Subject: Re: [linux-lvm] Lost partition table --> Lost 4th PV partition on 
	disk - how to find the partition bounderies
From: gklima@cosy.sbg.ac.at
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Tried gpart -f -n s
    --> force full diskscan  +  address by sectors

gave me the following after a long time waiting:

dev(/dev/hda) mss(512) chs(12161/255/63)(LBA) #s(195366465) size(95393mb)
Primary partition(1)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Primary partition(2)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Primary partition(3)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Primary partition(4)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00


Begin scan...
Possible partition(Windows NT/W2K FS), size(14001mb), offset(0mb)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(63-28676022)
   chs:  (0/1/1)-(1023/254/63)d (0/1/1)-(1784/254/61)r
   hex:  00 01 01 00 07 FE FF FF 3F 00 00 00 78 8F B5 01

Possible partition(Windows NT/W2K FS), size(14001mb), offset(14001mb)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(28676024-57351983)
   chs:  (1023/254/63)-(1023/254/63)d (1784/254/63)-(3569/253/60)r
   hex:  00 FE FF FF 07 FE FF FF B8 8F B5 01 78 8F B5 01

Possible partition(Windows NT/W2K FS), size(15267mb), offset(15267mb)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 15267mb #s(31268096) s(31268159-62536254)
   chs:  (1023/254/63)-(1023/254/63)d (1946/89/63)-(3892/178/61)r
   hex:  00 FE FF FF 07 FE FF FF 3F 1D DD 01 00 1D DD 01

Possible partition(Windows NT/W2K FS), size(9730mb), offset(15267mb)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 9730mb #s(19928152) s(31268160-51196311)
   chs:  (1023/254/63)-(1023/254/63)d (1946/90/1)-(3186/209/55)r
   hex:  00 FE FF FF 07 FE FF FF 40 1D DD 01 58 14 30 01

Possible partition(Windows NT/W2K FS), size(9730mb), offset(24998mb)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 9730mb #s(19928152) s(51196319-71124470)
   chs:  (1023/254/63)-(1023/254/63)d (3186/209/63)-(4427/74/54)r
   hex:  00 FE FF FF 07 FE FF FF 9F 31 0D 03 58 14 30 01

Possible partition(Linux ext2), size(36mb), offset(24998mb)
   type: 131(0x83)(Linux ext2 filesystem)
   size: 36mb #s(75600) s(51196320-51271919)
   chs:  (1023/254/63)-(1023/254/63)d (3186/210/1)-(3191/134/63)r
   hex:  00 FE FF FF 83 FE FF FF A0 31 0D 03 50 27 01 00

Possible partition(Linux swap), size(1500mb), offset(26059mb)
   type: 130(0x82)(Linux swap or Solaris/x86)
   size: 1500mb #s(3072000) s(53369456-56441455)
   chs:  (1023/254/63)-(1023/254/63)d (3322/24/15)-(3513/81/8)r
   hex:  00 FE FF FF 82 FE FF FF 70 5A 2E 03 00 E0 2E 00

End scan.

Checking partitions...

* Warning: Discarded 5 overlapping partition guesses.
Partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX): primary
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(63-28676022)
   chs:  (0/1/1)-(1023/254/63)d (0/1/1)-(1784/254/61)r
   hex:  00 01 01 00 07 FE FF FF 3F 00 00 00 78 8F B5 01

Partition(OS/2 HPFS, NTFS, QNX or Advanced UNIX): primary
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(28676024-57351983)
   chs:  (1023/254/63)-(1023/254/63)d (1784/254/63)-(3569/253/60)r
   hex:  00 FE FF FF 07 FE FF FF B8 8F B5 01 78 8F B5 01

Ok.

Guessed primary partition table:
Primary partition(1)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(63-28676022)
   chs:  (0/1/1)-(1023/254/63)d (0/1/1)-(1784/254/61)r
   hex:  00 01 01 00 07 FE FF FF 3F 00 00 00 78 8F B5 01

Primary partition(2)
   type: 007(0x07)(OS/2 HPFS, NTFS, QNX or Advanced UNIX)
   size: 14001mb #s(28675960) s(28676024-57351983)
   chs:  (1023/254/63)-(1023/254/63)d (1784/254/63)-(3569/253/60)r
   hex:  00 FE FF FF 07 FE FF FF B8 8F B5 01 78 8F B5 01

Primary partition(3)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Primary partition(4)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00


regards
georg
