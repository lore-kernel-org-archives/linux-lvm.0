Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MJTHj00937
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:29:17 -0500
Received: from mx2.nwlehighsd.org (nwlehighsd.org [209.50.139.56] (may be
	forged))
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MJTGWA008373
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:29:16 -0500
Received: from amavis by mx2.nwlehighsd.org with scanned-ok (Exim 3.35 #1
	(Debian)) id 1B5V6k-0002tz-00
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:29:10 -0500
Received: from mx2.nwlehighsd.org ([127.0.0.1])
	by localhost (oddprocess [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10609-05 for <linux-lvm@redhat.com>;
	Mon, 22 Mar 2004 14:29:10 -0500 (EST)
Received: from matt by mx2.nwlehighsd.org with local (Exim 3.35 #1 (Debian))
	id 1B5V6k-0002ts-00
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:29:10 -0500
Date: Mon, 22 Mar 2004 14:29:10 -0500
From: Matthew Daubenspeck <matt@oddprocess.org>
Message-ID: <20040322192910.GA10671@oddprocess.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm or lvm2?
Reply-To: matt@oddprocess.org,
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I am in the process of planning out a medium sized server (500 users,
500GB) to host user accounts in our school district. I will be using
Samba...

Do you think using LVM is a reliable method of sharing home directories?
I have been reading the lists, and I notice that in a lot of cases, if
one drive dies, you usually lose a lot of information.

If so, should I be looking at LVM or LVM2? I haven't seen a comparison
sheet on what 2 offers over the standard...

Thanks for your help.
-- 
  Matthew Daubenspeck
  http://www.oddprocess.org

14:26:00 up 1 day, 5:44, 1 user, load average: 0.06, 0.02, 0.00
