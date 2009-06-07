Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n57FFkGi012079
	for <linux-lvm@redhat.com>; Sun, 7 Jun 2009 11:15:46 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n57FFU3U027929
	for <linux-lvm@redhat.com>; Sun, 7 Jun 2009 11:15:30 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090607151531.UIJH23066.eastrmmtao106.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Sun, 7 Jun 2009 11:15:31 -0400
Message-ID: <4A2BD9CA.3030104@cox.net>
Date: Sun, 07 Jun 2009 11:16:26 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Random file system errors
References: <20090429061910.348CD31402A@mail.idrift.no>
	<34798D56CB2CB9B45352017A@LEYLA>
In-Reply-To: <34798D56CB2CB9B45352017A@LEYLA>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 06/07/2009 07:44 AM, Gaute Lund wrote:
> Thanks again Clyde, Geoff and f-lvm@media.mit.edu and others who gave 
> advice. Turns out it was a RAM issue.
>
> Just to close off this threadm, even if it's old. This is "only" a 
> private/testing box, and I've been busy, so I've only been able to 
> test stuff every now and then.
>
> A few runs of memtest86 found no errors. I turned to the "md5sums of 
> parts of disks" approach. If I read large chunks (5 GB), from 
> different places on the disks, with 5+ iterations with each chunk, I 
> got errors occasionally (diverging md5sums). But this is 10 disks 
> across two controllers and all but two gave errors several times, 
> albeit seldomly.
>
> I started swapping hardware, and with different RAM I am OK. I guess 
> clean runs of memtest shouldn't be trusted 100%. I can even say, the 
> way these errors have crept up on me gradually over months(!), it 
> means the RAM stick(s) have failed gradually, without being touched or 
> anything. Scary!
>
> <snip>
FWIW, there is a bad version of memtest out there.  I don't recall the 
version number and don't recall the problem, but, for you, its moot.
