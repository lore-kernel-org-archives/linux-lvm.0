Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2TJ2qj20581
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 14:02:52 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2TJ2q1X022787
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 14:02:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id D90FA7993
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 14:02:50 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27513-07 for <linux-lvm@redhat.com>;
	Mon, 29 Mar 2004 14:02:50 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 4DED9796D
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 14:02:50 -0500 (EST)
Subject: Re: [linux-lvm] LVM2 over RAID-5 (AMD64)
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <20040329152509.GA27@fi.muni.cz>
References: <20040329152509.GA27@fi.muni.cz>
Message-Id: <1080586970.1133.32.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Mon, 29 Mar 2004 14:02:50 -0500
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Mon, 2004-03-29 at 10:25, Jan Kasprzak wrote:
> 	Hello,
> 
> 	I have problems creating a LV on top of SW RAID-5 volume.
> I have Fedora Core 1/AMD64, and LVM2 utils 2.00.08-5 RPM from the latest
> Fedora Core beta (1.90, I think). My kernel is 2.6.4. The problem is that
> 1) Metadata version 2 does not work at all, and

This is a little sparse on details, but you may have the problem I hit,
which was not having set up lvm.conf to exclude the underlying devices.
LVM2 (at least its current iteration) doesn't automagically exclude
devices that underly an MD set. 

You might try setting a filter in lvm.conf that excludes everything but
MD devices, e.g.:

filter = [ "a|^/dev/md|", "r|.*|" ]

Not sure if this works at all with LVM1, though.

Of course, I could be completely wrong here, and your problem is
something else entirely...

-- Jeff
