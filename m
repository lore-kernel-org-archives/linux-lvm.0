Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8R7wLr16802
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 03:58:21 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8R7wHB5000318
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 03:58:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 346AC1800BB
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 20:02:01 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 03876-01 for <linux-lvm@redhat.com>;
	Mon, 27 Sep 2004 20:02:00 +1200 (NZST)
Received: from [127.0.0.1] (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 613A7180095
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 20:02:00 +1200 (NZST)
Message-ID: <4157C813.90401@myself.gen.nz>
Date: Mon, 27 Sep 2004 19:58:11 +1200
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which files, which physical volumes?
References: <41538691.2040807@myself.gen.nz>	<20040924061754.GD13943@percy.comedia.it>	<4153BF33.6030008@myself.gen.nz>	<20040926202757.GG32455@omnifarious.org>
	<20040927003042.GO11810@agk.surrey.redhat.com>
In-Reply-To: <20040927003042.GO11810@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:
> On Sun, Sep 26, 2004 at 01:27:57PM -0700, Eric Hopper wrote:
> 
[snip]
>   Test mode works a different way in LVM2 - it's designed for testing
>   and simply disables all writes at the lowest level of the code 
>   (to guarantee safety) - but reports success to the calling function.  
>   Many code paths don't yet say 'stop here if this is test mode' so
>   they stop instead with an error when they find an inconsistency
>   because they thought they changed something, but it got read back
>   unchanged.

wow it makes a lot more sense now.

This could really do with going into the pvmove man page, which is a bit 
sparse as it is...
