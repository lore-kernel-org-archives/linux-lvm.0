Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v09DJdmE024668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 9 Jan 2017 08:19:39 -0500
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0094.outbound.protection.outlook.com [104.47.41.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 945AD8124B
	for <linux-lvm@redhat.com>; Mon,  9 Jan 2017 13:19:38 +0000 (UTC)
From: Tyler Hains <Tyler.Hains@mob.ingenico.com>
Date: Mon, 9 Jan 2017 13:19:35 +0000
Message-ID: <MWHPR06MB2813D43FFC9B3706554098EDD0640@MWHPR06MB2813.namprd06.prod.outlook.com>
References: <07fb8e78-2050-a2ba-3e71-c21e989d57f3@knebb.de>
In-Reply-To: <07fb8e78-2050-a2ba-3e71-c21e989d57f3@knebb.de>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [DRBD-user] LVM on top of DRBD
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
To: =?utf-8?B?Q2hyaXN0aWFuIFbDtmxrZXI=?= <cvoelker@knebb.de>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>, "drbd-user@lists.linbit.com" <drbd-user@lists.linbit.com>

> I can not get working LVM  on top of drbd- I am getting I/O erros followed by "diskless" state.

The process I have used to do this requires that you initialize the DRBD meta-data before you create the file system. Use "drbdadm create-md myresourcename" after your lvcreate command, and before the mkfs.ext4 command.

Tyler Hains
MySQL Consultant



The information contained in this email and any attachments is private and is the confidential property of ROAM Data, Inc. If you are not the intended recipient(s) or have otherwise received this email in error, please delete this email and inform the sender as soon as possible. Neither this email nor the information contained in any attachments may be disclosed, stored, used, published or copied by anyone other than the intended recipient(s). All orders for ROAM Data, Inc. products and services are accepted by ROAM Data, Inc. subject to the terms and conditions of sale set forth on the ROAM Data, Inc. website, as such terms and conditions of sale may be changed from time to time without notice.
