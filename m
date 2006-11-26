Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAQFBS7Q001658
	for <linux-lvm@redhat.com>; Sun, 26 Nov 2006 10:11:28 -0500
Received: from ms-smtp-04.southeast.rr.com (ms-smtp-04.southeast.rr.com
	[24.25.9.103])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAQFBRK2028389
	for <linux-lvm@redhat.com>; Sun, 26 Nov 2006 10:11:28 -0500
Message-ID: <4569AE95.3070201@poochiereds.net>
Date: Sun, 26 Nov 2006 10:11:17 -0500
From: Jeff Layton <jlayton@poochiereds.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Update to lvm2create_initrd
References: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
	<20061114170247.GD30653@agk.surrey.redhat.com>
	<20061114174907.GA15269@qube.mayle.org>
	<A6195709-81DE-4F00-996F-6490A367593C@mayle.org>
	<20061121223919.GZ4409@agk.surrey.redhat.com>
	<20061121224454.GA4409@agk.surrey.redhat.com>
In-Reply-To: <20061121224454.GA4409@agk.surrey.redhat.com>
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
To: Douglas Mayle <douglas@mayle.org>, LVM general discussion and development <linux-lvm@redhat.com>, Jeff Layton <jtlayton@poochiereds.net>

Alasdair G Kergon wrote:
> On Tue, Nov 21, 2006 at 10:39:19PM +0000, Alasdair G Kergon wrote:
>> Well I was waiting for confirmation from someone using Debian that the changes
>> don't break anything.  But I think I've waited long enough now so I'll just
>> commit it, and if anything does break we'll fix it later.
>  
> See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324162 :-)
> 
> Reported over a year ago.
> 
> Alasdair

Sorry I haven't chimed in sooner. This patch seems reasonable to me. I 
haven't used this script for some time as I don't have any Debian 
machines at the moment. Doug, you're welcome to take over maintainership 
of it if you're willing :-)

-- Jeff
