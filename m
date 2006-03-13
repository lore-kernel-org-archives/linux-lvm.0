Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2DI3F104364
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 13:03:15 -0500
Received: from priv-edtnes51.telusplanet.net (outbound04.telus.net
	[199.185.220.223])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2DI347b000503
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 13:03:04 -0500
Received: from p-squared.com ([137.186.214.78])
	by priv-edtnes51.telusplanet.net
	(InterMail vM.6.01.05.04 201-2131-123-105-20051025) with ESMTP id
	<20060313180222.KNZH19487.priv-edtnes51.telusplanet.net@p-squared.com>
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 11:02:22 -0700
Received: from apache by p-squared.com with local (Exim 4.54)
	id 1FIrN5-0000hi-Cr
	for linux-lvm@redhat.com; Mon, 13 Mar 2006 11:02:19 -0700
Message-ID: <34632.198.161.217.2.1142272939.squirrel@p-squared.com>
Date: Mon, 13 Mar 2006 11:02:19 -0700 (MST)
From: "Pete Pinter" <pinter@p-squared.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Apache <apache@p-squared.com>
Subject: [linux-lvm] Really hoping data is still there...
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

I had 3 identical maxtor 30GB's with the 2nd & 3rd *striped* into VolGroup01.

The 3rd drive died and my inadequate rescue attempts resulted in my
recreating VolGroup01/LogVol00 containing only my 2nd disk.

A 'df' shows:

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                      27932828   2396176  24094860  10% /
/dev/hde1               101086     13858     82009  15% /boot
tmpfs                   257916         0    257916   0% /dev/shm
/dev/mapper/VolGroup01-LogVol00
                          3963      1059      2700  29% /Data

Leading me to hope upon hope that 29% used means some of my data lives on.

That LV (/Data above) only contains a 'lost+found' folder, which is empty.

I have a vmware disk image on that drive that I would dearly love to get
back. It's beerworthy even.

Is there any hope for this lamer, or am I well and truly stuffed?
