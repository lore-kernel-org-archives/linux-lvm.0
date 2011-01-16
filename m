Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0GJ1i7S008648
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2011 14:01:44 -0500
Received: from eastrmmtao105.cox.net (eastrmmtao105.cox.net [68.230.240.47])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0GJ1YA1001544
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2011 14:01:34 -0500
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao105.cox.net
	(InterMail vM.8.01.03.00 201-2260-125-20100507) with ESMTP
	id <20110116190133.GBXL9900.eastrmmtao105.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Sun, 16 Jan 2011 14:01:33 -0500
Message-ID: <4D33408D.2000102@cox.net>
Date: Sun, 16 Jan 2011 13:01:33 -0600
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <FB3E421C-2DDC-4BBE-9736-53762F26B425@ualr.edu>
	<20110114135444.108565bd@bettercgi.com>
In-Reply-To: <20110114135444.108565bd@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] moving LVMs to another machine
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 01/14/2011 01:54 PM, Ray Morris wrote:
>> I did not actively deactivate any volume groups or logical volumes
>> before I made this move.
>
[snip]
>
> Since you said you "did not actively deactivate any volume groups",
> I'm assuming you did not use "vgexport" and therefore don't need to
> use "vgimport".

I read that to mean that he did not do this on the old machine:
# lvchange -an foo/bar
# vgchange -an foo

-- 
Famous University Professor says...
"Of course 5 years from (1992) everyone will be running free GNU on
their 200 MIPS, 64M SPARCstation-5."
