Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FJMFQL006163
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 14:22:15 -0500
Received: from pd2mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1FJLihL021467
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 14:21:45 -0500
Received: from pd2mr1so.prod.shaw.ca
	(pd2mr1so-qfe3.prod.shaw.ca [10.0.141.110]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JWA00H4TOFG2GB0@l-daemon> for linux-lvm@redhat.com; Fri,
	15 Feb 2008 12:21:16 -0700 (MST)
Received: from pn2ml7so.prod.shaw.ca ([10.0.121.151])
	by pd2mr1so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JWA00LQQOFGPP80@pd2mr1so.prod.shaw.ca> for
	linux-lvm@redhat.com; Fri, 15 Feb 2008 12:21:17 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JWA00162OFG7Z10@l-daemon> for linux-lvm@redhat.com; Fri,
	15 Feb 2008 12:21:16 -0700 (MST)
Received: from exchange.activenetwerx.com (localhost.localdomain [127.0.0.1])
	by mail.activenetwerx.com (Postfix) with ESMTP id 5738E17805B	for
	<linux-lvm@redhat.com>; Fri, 15 Feb 2008 11:23:30 -0700 (MST)
Date: Fri, 15 Feb 2008 12:21:12 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] pvmove safety
In-reply-to: <C3E4CC38-3764-4EC3-910E-9FBD91667701@redhat.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BD6@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1@an-ex.ActiveNetwerx.int>
	<C3E4CC38-3764-4EC3-910E-9FBD91667701@redhat.com>
Content-Transfer-Encoding: 8bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

>pvmove is pretty reliable.  However, I would probably make a backup before doing any sort of operation that would grow/shrink/move a file system.
>
>brassow

Brassow,
Thanks for the reply, I was beginning to think it was a silly question <grin>. I couldn't find any reliable info regarding pvmove and the specifics of the actual command. I ended up just trying it and it worked.

I am also a little unsure about how IO to the LV in transit is handled, is it paused at any point?

If the pvmove is stopped at any point and an -abort is given, are all the PE's that *were* reserved automatically freed up? Also, I assume the old PE's aren't freed up until everything is copied over and in sync?>


Thanks!
jlc
