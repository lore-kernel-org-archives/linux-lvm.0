Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8B53DWE005474
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2010 01:03:14 -0400
Received: from luna.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8B532Z2005180
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2010 01:03:03 -0400
Received: from c213-100-252-251.swipnet.se
	([213.100.252.251] helo=nerv.dolda2000.com ident=root)
	by luna.dolda2000.com with esmtp (Exim 4.69)
	(envelope-from <fredrik@dolda2000.com>) id 1OuIIM-0005pP-Ei
	for linux-lvm@redhat.com; Sat, 11 Sep 2010 07:06:34 +0200
Received: from [IPv6:2002:d564:fcfb:200:21d:7dff:fea1:197]
	([IPv6:2002:d564:fcfb:200:21d:7dff:fea1:197]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	o8B52x1C021570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2010 07:03:00 +0200
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Sat, 11 Sep 2010 07:02:58 +0200
Message-ID: <1284181378.3968.14.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Errors from a mirrored LV
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
To: linux-lvm@redhat.com

Hi list,

Having a disk that's going awry, I'm glad I've got the data in a
mirrored LV so that I can replace it.

However, now that I still haven't got a new disk to replace it with, it
seems that LVM is nevertheless returning I/O errors for reads from the
broken sectors, as evidenced by logs like these:

ata4.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x0
ata4.00: BMDMA2 stat 0xc0009
ata4.00: cmd 25/00:08:a7:1c:84/00:00:27:00:00/e0 tag 0 dma 4096 in
         res 51/40:00:aa:1c:84/00:00:27:00:00/e0 Emask 0x9 (media error)
ata4.00: status: { DRDY ERR }
ata4.00: error: { UNC }
ata4.00: configured for UDMA/100
sd 3:0:0:0: [sdd] Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE,SUGGEST_OK
sd 3:0:0:0: [sdd] Sense Key : Medium Error [current] [descriptor]
Descriptor sense data with sense descriptors (in hex):
        72 03 11 04 00 00 00 0c 00 0a 80 00 00 00 00 00 
        27 84 1c aa 
sd 3:0:0:0: [sdd] Add. Sense: Unrecovered read error - auto reallocate
failed
end_request: I/O error, dev sdd, sector 662969514
ata4: EH complete
I/O error in filesystem ("dm-3") meta-data dev dm-3 block 0x27841ae8
("xfs_trans_read_buf") error 5 buf count 4096

Note that last line of log, emitted by XFS.

Shouldn't LVM, when a read fails in a mirror, try to fetch that data
from the second disk instead?

--

Fredrik Tolf
