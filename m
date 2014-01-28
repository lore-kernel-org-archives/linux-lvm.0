Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0SCYVNU016859
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 07:34:31 -0500
Received: from xenon20.um.es (xenon20.um.es [155.54.212.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0SCYSie015255
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 07:34:28 -0500
Received: from localhost (localhost [127.0.0.1])
	by xenon20.um.es (Postfix) with ESMTP id A0D551FE0A
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 13:34:26 +0100 (CET)
Received: from xenon20.um.es ([127.0.0.1])
	by localhost (xenon20.um.es [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KzZ+YH1GGQAs for <linux-lvm@redhat.com>;
	Tue, 28 Jan 2014 13:34:26 +0100 (CET)
Received: from [155.54.194.132] (vpn_um-194-132.inf.um.es [155.54.194.132])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: amateo@um.es)
	by xenon20.um.es (Postfix) with ESMTPSA id 287AF1FC8E
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 13:34:25 +0100 (CET)
Message-ID: <52E7A3CC.9000406@um.es>
Date: Tue, 28 Jan 2014 13:34:20 +0100
From: "Angel L. Mateo" <amateo@um.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Mounting a read only disk
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello guys,

     I'm having a problem I don't know how to solve.

     I have a running system with its disk under LVM2. Physical disks 
are in a SAN and we have no problems with them. Now we have configured 
an automated snapshots of our disks from our SAN to another one (both 
are HP 3par) and we want now the snapshot to be mounted in another 
system. This system has connected the snapshot disk without any problem 
but we can't mount the FS, because we can't activate volumes in it. The 
"only" difference between original disks and snaptshot ones are that 
this are seen by the OS as read only disks, so they can't be written.

     In the system trying to mount the snapshot I could see PVs, VGs and 
LVs, as:

amateo_adm@myotis52fa:~$ sudo pvs
   PV         VG          Fmt  Attr PSize    PFree
   /dev/sda5  Disk1       lvm2 a-      6.76g      0
   /dev/sdb   IndexesDisk lvm2 a-     69.98g  20.00g
   /dev/sdc   UsersDisk   lvm2 a-      2.50t      0
   /dev/sdd   UsersDisk   lvm2 a-   1023.98g 499.97g
amateo_adm@myotis52fa:~$ sudo vgs
   VG          #PV #LV #SN Attr   VSize  VFree
   Disk1         1   2   0 wz--n-  6.76g      0
   IndexesDisk   1   1   0 wz--n- 69.98g  20.00g
   UsersDisk     2   1   0 wz--n-  3.50t 499.97g
amateo_adm@myotis52fa:~$ sudo lvs
   LV          VG          Attr   LSize   Origin Snap%  Move Log Copy%  
Convert
   root        Disk1       -wi-ao 5.82g
   swap_1      Disk1       -wi-ao 956.00m
   vol_indexes IndexesDisk -wi-d- 49.98g
   vol_users   UsersDisk   -wi-d- 3.01t

     but I can't activate LVs:

amateo_adm@myotis52fa:~$ sudo lvchange -a y UsersDisk/vol_users
   device-mapper: reload ioctl failed: Invalid argument

     and in the logs I get:

Jan 28 13:32:41 myotis52fa kernel: [ 1789.845945] device-mapper: table: 
252:0: linear: dm-linear: Device lookup failed
Jan 28 13:32:41 myotis52fa kernel: [ 1789.846047] device-mapper: ioctl: 
error adding target to table

     the original system and the one trying to mount the snapshot are 
both ubuntu 12.04 with same kernel (3.4.0-030400-generic) and version of 
lvm2 (2.02.66-4ubuntu7.4, the packaged by ubuntu).

     Any help?

-- 
Angel L. Mateo Mart�nez	
Secci�n de Telem�tica
�rea de Tecnolog�as de la Informaci�n
y las Comunicaciones Aplicadas (ATICA)
http://www.um.es/atica
Tfo: 868887590
Fax: 868888337
