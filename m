Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEN8qr27963
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 18:08:52 -0500
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAEN8kd3005208
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 18:08:51 -0500
Received: from [127.0.0.1] (leviathan [131.128.51.64])
	by leviathan.ele.uri.edu (8.12.9/8.12.9) with ESMTP id iAEN8hAO003428
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 18:08:43 -0500 (EST)
From: Ming Zhang <mingz@ele.uri.edu>
Message-Id: <1100473722.3776.5.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Sun, 14 Nov 2004 18:08:43 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to know snapshot internal structure?
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi folks,

a snapshot on an existing lv keeps all the delta right? i guess snapshot
will keep a in memory look up table for this. but during system reboot,
this information should have a on-disk copy as well. is there any doc or
hint about the on disk location and structure? i guess it is part of the
snapshot area.

open the lv will read all new data and all unchanged data. open the
snapshot will read all old data. so is there any quick way to know what
exactly the delta are?

thanks a lot.


ming
