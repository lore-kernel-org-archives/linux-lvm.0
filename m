Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3FIYDj31038
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 14:34:13 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3FIYD87014322
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 14:34:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id C99E6A65D
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 14:34:11 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00536-10 for <linux-lvm@redhat.com>;
	Thu, 15 Apr 2004 14:34:11 -0400 (EDT)
Received: from localhost (salusa.poochiereds.net [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 2A376975E
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 14:34:11 -0400 (EDT)
Subject: Re: [linux-lvm] lvmcreate_initrd missing in lvm2?
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <20040415124853.GC15877@tangerine.coulon.evette>
References: <407C0C40.2040905@irisinfo.net>
	<1081954010.2323.32.camel@localhost>
	<20040415124853.GC15877@tangerine.coulon.evette>
Message-Id: <1082054050.13034.15.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Thu, 15 Apr 2004 14:34:11 -0400
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


On Thu, 2004-04-15 at 08:48, Jean-Luc Coulon (f5ibh) wrote:
> Hello,
> 
> The mentionned script creates an symlink to busybox from linuxrc.
> In this case what is the contents / action of such a script ?
> 
> --
> Regards
> 		- Jean-Luc

It won't do anything since it creates the symlink under /bin on the
initrd image. A quick look at the busybox sources seems to indicate that
it will behave like a mini-implementation of 'init'. So if you created
an /etc/inittab and make the link a /linuxrc it would prob. behave like
'init'.

Most of what I've read seems to indicate that the /linuxrc thingy is
being deprecated though, and that most things should use '/sbin/init'
instead. That's what this script does. Not sure what the kernel does if
you have a /linuxrc _and_ a /sbin/init though...

I'll go ahead and remove the linuxrc link from my hosted copy of the
script...

-- Jeff
