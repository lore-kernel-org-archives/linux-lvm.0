Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8O6VOr20632
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 02:31:24 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8O6VImD005729
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 02:31:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 4E25A180098
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 18:34:50 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 11218-07 for <linux-lvm@redhat.com>;
	Fri, 24 Sep 2004 18:34:49 +1200 (NZST)
Received: from [127.0.0.1] (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 9ECCC180095
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 18:34:49 +1200 (NZST)
Message-ID: <4153BF33.6030008@myself.gen.nz>
Date: Fri, 24 Sep 2004 18:31:15 +1200
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which files, which physical volumes?
References: <41538691.2040807@myself.gen.nz>
	<20040924061754.GD13943@percy.comedia.it>
In-Reply-To: <20040924061754.GD13943@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: steve@myself.gen.nz,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Luca Berra wrote:

> On Fri, Sep 24, 2004 at 02:29:37PM +1200, Steve Wray wrote:
> 
>> Or maybe pvmove is *still* broken, in which case I need to find the 
>> files which occupy that physical volume, move them to a different 
>> logical volume altogether and then forcibly remove that physical 
>> volume without regard to the files that are no longer on it... and 
>> hopefuly this won't cause corruption on the filesystem on that logical 
>> volume.
> 
> this will certainly cause corruption.

So is there any other way to decomission that physical volume that 
doesn't involve pvmove?

Actually, this just got more interesting because after the last
pvmove --abort I now get this error out of pvmove -tv;

Insufficient contiguous allocatable extents (780) for logical volume 
pvmove0: 1292 required
Allocation for temporary pvmove LV failed

which is new.

I am guessing here, but if I moved some of the larger files out of that 
logical volume, might pvmove be able to work around this?
