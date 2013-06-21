Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5L7W7pb021415
	for <linux-lvm@redhat.com>; Fri, 21 Jun 2013 03:32:07 -0400
Received: from nm2.access.bullet.mail.mud.yahoo.com
	(nm2.access.bullet.mail.mud.yahoo.com [66.94.237.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5L7W6oU003109
	for <linux-lvm@redhat.com>; Fri, 21 Jun 2013 03:32:06 -0400
Message-ID: <1371799924.59763.YahooMailBasic@web181506.mail.ne1.yahoo.com>
Date: Fri, 21 Jun 2013 00:32:04 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51C3F636.6030900@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM high availability
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

if you turn off caching in lvm.conf then you don't have to explicitly call vgscan or lvscan since it will happen automatically. However, any operation that changes LV or VG metadata must be single-entry. That's what XenServer does, they elect a "LVM master" and only that host is allowed to issue VG/LV commands. I believe it's worthwhile to get the full cluster stack running on your storage nodes, but you can probably use something far lighter like CARP/VRRP and get away with it.
