Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8QKcKr03707
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 16:38:20 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8QKcDJn009468
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 16:38:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 34C611800BB
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 08:41:55 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 03717-10 for <linux-lvm@redhat.com>;
	Mon, 27 Sep 2004 08:41:54 +1200 (NZST)
Received: from [127.0.0.1] (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 3B909180095
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 08:41:54 +1200 (NZST)
Message-ID: <415728B1.6030607@myself.gen.nz>
Date: Mon, 27 Sep 2004 08:38:09 +1200
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which files, which physical volumes?
References: <41538691.2040807@myself.gen.nz>	<20040924061754.GD13943@percy.comedia.it>	<4153BF33.6030008@myself.gen.nz>
	<20040926202757.GG32455@omnifarious.org>
In-Reply-To: <20040926202757.GG32455@omnifarious.org>
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

Eric Hopper wrote:
> On Fri, Sep 24, 2004 at 06:31:15PM +1200, Steve Wray wrote:
> 
>>So is there any other way to decomission that physical volume that
>>doesn't involve pvmove?
> 
> 
> I end up using lvcreate (with some options) to create a new logical
> volume that has no extents on the physical volume you want to move off
> of, and has the exact same number of extents as the logical volume you
> want to move.

Unfortunately I don't have enough disk for this... nice idea though!

> It's ugly and stupid.  But, since pvmove doesn't seem to work yet, I
> think that's the best that can be done.  I'm sorely disappointed that
> LVM2 was even put into the production kernel without pvmove working.
> :-(

Phew! At least I am not the only one who feels like that!
This is for my home system, but at work, since discovering the 
non-workingness of pvmove, I have tried to make sure that we don't have 
to use it...

> I know LVM2 and the device mapper concept are much better than LVM1.
> But, pvmove is a core piece of functionality.  It's like releasing a
> filesystem for which the lstat call doesn't work or something similar.
> 
> *sigh*,

Absolutely. I am actually amazed that its still like this after so long.
I mean, whats the problem? Is Redhat blocking it somehow or what?
(I sort of sniff a scenario where Redhat have some proprietary volume 
management system in the pipeline and want to discourage people from 
using LVM2 so that they will be more likely to but into Redhat 
Enterprise Server or whatever, but maybe thats just paranoia speaking 
and I should just take the tinfoil hat off and let the rays in)
