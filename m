Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBIBjQ125193
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:45:26 -0500
Received: from skippy.fini.net (skippy.fini.net [205.166.143.75])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBIBjFcB013447
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:45:20 -0500
Received: from skippy.fini.net (localhost.localdomain [127.0.0.1])
	by skippy.fini.net (8.13.4/8.13.4) with ESMTP id jBIBirDY021457
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:44:58 -0500
Received: from localhost (chicks@localhost)
	by skippy.fini.net (8.13.4/8.13.4/Submit) with ESMTP id jBIBir0k021453
	for <linux-lvm@redhat.com>; Sun, 18 Dec 2005 06:44:53 -0500
Date: Sun, 18 Dec 2005 06:44:53 -0500 (EST)
From: Christopher Hicks <chicks@chicks.net>
Subject: Re: [linux-lvm] Re: If one disk fails i loose everything?
In-Reply-To: <1134502870.14744.51.camel@seki.nac.uci.edu>
Message-ID: <Pine.LNX.4.63.0512180641350.20680@skippy.fini.net>
References: <200512131624.jBDGO5ui009897@cichlid.com> <439F07E3.80804@cox.net>
	<1134502870.14744.51.camel@seki.nac.uci.edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 13 Dec 2005, Dan Stromberg wrote:
> It really shouldn't work that way.  RAID 5 is based on XOR, and I'm 
> pretty sure XOR can only recover from a single-number failure.
>
> -But-, if you had a hot spare or warm spare configured, then it would've 
> been possible for one drive to die, the RAID 5 to be resync'd, another 
> drive to die, and then still be OK.

Correct.  One thing to keep in mind when doing these sort of things is 
that drives from the same manufacturer and lot are more like to fail 
around the same time than random drives.  We've had two drives fail within 
a week of each other in the same raid array multiple times.  I've had a 
couple of raid arrays where it felt like I spent every other week for six 
months doing some part of a drive replacement and ending up replacing the 
whole array my the time its done.  Now if I have two drives fail in an 
array in short I proactively replace the entire thing.  Don't forget the I 
in raid means you're trying to make cheap sh*t reliable.

-- 
</chris>

The significant problems we face cannot be solved by the same level of
thinking that created them.

-- Albert Einstein
