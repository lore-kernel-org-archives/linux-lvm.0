Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7FHnmXt025956
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 13:49:48 -0400
Received: from sr01-01.mta.terra.com.br (sr01-01.mta.terra.com.br
	[200.154.152.20])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7FHneLq029423
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 13:49:40 -0400
Received: from manticoke.hst.terra.com.br (manticoke.hst.terra.com.br
	[200.176.10.39])
	by bulimba.hst.terra.com.br (Postfix) with ESMTP id AFBCE35A0171
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 14:49:38 -0300 (BRT)
Received: from [192.168.2.207] (c90669ce.static.spo.virtua.com.br
	[201.6.105.206]) (authenticated user piterpk)
	by manticoke.hst.terra.com.br (Postfix) with ESMTP id 91EE33F4057
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 14:49:38 -0300 (BRT)
Message-ID: <46C33D37.7020001@terra.com.br>
Date: Wed, 15 Aug 2007 14:51:51 -0300
From: Piter PUNK <piterpk@terra.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Tool to manage LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

	I am writing an small app to manage LVM. Currently it supports:

	1. Create and Remove Physical Volumes
	2. Create, Remove, Extend and Reduce Volume Groups
	3. Create and Remove Logical Volumes

	It have two user interfaces, one in dialog and other with the
fdisk behavior. The letters used in commands in fdisk interface can
be used as shortcuts in dialog interface.

	The idea of this app isn't to manage complex LVM setups, is more
to aid the LVM creation in small environments (but, who knows the
future?). I before made a real public release i want to add:

	1. Logical Volume resizing (with filesystem support)
	2. Snapshots

	The (1) is already being coded. The (2) will wait a little.

	If someone can test or help with suggestions or bug reports
or fixing my terrible english i will be very happy.

					Thanks!

							Piter PUNK
-- 
     |        E-Mail: piterpk@terra.com.br        (personal)
    .|.               roberto.batista@ntux.com.br (professional)
    /V\
   // \\      UIN:116043354  Homepage:http://piterpunk.info02.com.br
  /(   )\
   ^`~'^         ----> Slackware Linux - The Best One! <----
  #105432
