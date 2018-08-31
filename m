Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B75A62664
	for <linux-lvm@redhat.com>; Fri, 31 Aug 2018 17:06:28 +0000 (UTC)
Received: from postol.eschenberg.eu (postol.eschenberg.eu [89.144.28.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37E1E7F6B0
	for <linux-lvm@redhat.com>; Fri, 31 Aug 2018 17:06:27 +0000 (UTC)
Received: from p57bcf60b.dip0.t-ipconnect.de ([87.188.246.11]
	helo=[192.168.0.110]) (Authed sender Sven 'DarKRaveR' Eschenberg)
	by postol.eschenberg.eu via ESMTPSA
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim)
	(envelope-from <sven@eschenberg.eu>) id 1fvmIG-0006Kz-J2
	for linux-lvm@redhat.com; Fri, 31 Aug 2018 18:29:08 +0200
From: Sven Eschenberg <sven@eschenberg.eu>
Message-ID: <427783b3-1ad1-7411-bfdc-b7054edac4b1@eschenberg.eu>
Date: Fri, 31 Aug 2018 18:28:58 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem activating lvm-raid
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi all,

I recently had to reboot one of my machines which is usually up 24/7. To 
my surprise the activation of the lvm-raid volume failed. I am kinda 
stuck finding the reason - the userland got updated regularly and 
everything used to work as expected.

Version of lvm being used: lvm2-2.02.181

lvchange -v -ay TsR1/port
     Activating logical volume TsR1/port exclusively.
     activation/volume_list configuration setting not defined: Checking 
only host tags for TsR1/port.
     Creating TsR1-port_rmeta_0
     Loading table for TsR1-port_rmeta_0 (253:0).
     Resuming TsR1-port_rmeta_0 (253:0).
     Creating TsR1-port_rimage_0
     Loading table for TsR1-port_rimage_0 (253:1).
     Resuming TsR1-port_rimage_0 (253:1).
     Creating TsR1-port_rmeta_1
     Loading table for TsR1-port_rmeta_1 (253:2).
     Resuming TsR1-port_rmeta_1 (253:2).
     Creating TsR1-port_rimage_1
     Loading table for TsR1-port_rimage_1 (253:3).
     Resuming TsR1-port_rimage_1 (253:3).
     Creating TsR1-port
     Loading table for TsR1-port (253:5).
   device-mapper: reload ioctl on  (253:5) failed: Invalid argument
     Removing TsR1-port (253:5)

dmsetup table:

TsR1-port_rmeta_1: 0 512 linear 8:50 512
TsR1-port_rmeta_0: 0 512 linear 8:34 512
TsR1-port_rimage_1: 0 8388608 linear 8:50 1024
TsR1-port_rimage_0: 0 8388608 linear 8:34 1024

Running lvchange again:
lvchange -v -ay TsR1/port
     Activating logical volume TsR1/port exclusively.
   Activation of logical volume TsR1/port is prohibited while logical 
volume TsR1/port_rimage_0 is active.

Since activation fails, shouldn't the changes done not be rolled back 
entirely? Usually one would expect identical behavior on a second 
invocation.

And thje master question: Why does the activation fail in the first place?
