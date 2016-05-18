Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IIsutl031062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 14:54:56 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70B32552D3
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 18:54:55 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b36cQ-0001mm-Hb
	for linux-lvm@redhat.com; Wed, 18 May 2016 18:54:54 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 6833B182F58
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 15:44:04 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 06837-01-5 for <linux-lvm@redhat.com>;
	Wed, 18 May 2016 15:44:03 -0400 (EDT)
Date: Wed, 18 May 2016 15:44:03 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20160518194403.GA6878@bdmcc-us.com>
References: <20160518002234.GA13276@bdmcc-us.com> <573C6BDF.4090209@redhat.com>
	<20160518145650.GA3394@bdmcc-us.com>
	<20160518183948.GA4143@bdmcc-us.com>
	<20160518184301.GA6299@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160518184301.GA6299@bdmcc-us.com>
Subject: Re: [linux-lvm] Unable to find device with UUID XXX.
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


This is not looking good.

I have tried to re-attach the old ( probably failing ) drive to the test
machine, and I see this in dmesg:

[ 4566.743139] usb 1-5: new high-speed USB device number 27 using
ehci_hcd
[ 4566.861622] usb 1-5: New USB device found, idVendor=0bc2,
idProduct=3320
[ 4566.861625] usb 1-5: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[ 4566.861627] usb 1-5: Product: Expansion Desk
[ 4566.861628] usb 1-5: Manufacturer: Seagate
[ 4566.861629] usb 1-5: SerialNumber: 2HC015KJ
[ 4566.862054] scsi8 : usb-storage 1-5:1.0
[ 4567.865494] scsi 8:0:0:0: Direct-Access     Seagate  Expansion Desk
0711 PQ: 0 ANSI: 6
[ 4567.866036] sd 8:0:0:0: Attached scsi generic sg4 type 0
[ 4567.869533] sd 8:0:0:0: [sdd] Spinning up disk..............ready
[ 4578.911055] sd 8:0:0:0: [sdd] 732566645 4096-byte logical blocks:
(3.00 TB/2.72 TiB)
[ 4609.862126] usb 1-5: reset high-speed USB device number 27 using
ehci_hcd
[ 4624.964140] usb 1-5: device descriptor read/64, error -110
[ 4640.167241] usb 1-5: device descriptor read/64, error -110
[ 4640.370138] usb 1-5: reset high-speed USB device number 27 using
ehci_hcd
[ 4655.472298] usb 1-5: device descriptor read/64, error -110
[ 4665.690010] sd 8:0:0:0: [sdd] Test WP failed, assume Write Enabled
[ 4672.640209] sd 8:0:0:0: [sdd] Asking for cache data failed
[ 4672.640211] sd 8:0:0:0: [sdd] Assuming drive cache: write through
[ 4672.643323] sd 8:0:0:0: [sdd] Spinning up
disk.......................................................................................................not
responding...
[ 4773.042814] sd 8:0:0:0: [sdd] 732566645 4096-byte logical blocks:
(3.00 TB/2.72 TiB)
[ 4779.990875] sd 8:0:0:0: [sdd] Test WP failed, assume Write Enabled
[ 4786.941084] sd 8:0:0:0: [sdd] Asking for cache data failed
[ 4786.941086] sd 8:0:0:0: [sdd] Assuming drive cache: write through


This is a Seagate ( as you can see ) packaged USB external drive.

With these errors, would it be worthwhile trying to extract the drive
from the case and try it either internally or in another case?


Thank you,
Brian
