References: <trinity-fec29f23-aa03-442b-b6d6-84dece8ba273-1560313085888@3c-app-gmx-bs14>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4f1dedd7-2a1d-b266-a173-bda24a19347f@redhat.com>
Date: Wed, 12 Jun 2019 12:56:48 +0200
MIME-Version: 1.0
In-Reply-To: <trinity-fec29f23-aa03-442b-b6d6-84dece8ba273-1560313085888@3c-app-gmx-bs14>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question on vgconvert
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Steve Keller <keller.steve@gmx.de>

Dne 12. 06. 19 v 6:18 Steve Keller napsal(a):
> I want to convert from LVM1 to LVM2 using vgconvert on a server.  Is
> vgconvert -M2 <vg-name> considered a risky operation?  Should I switch
> the server into single-user mode and make a backup before running
> vgconvert?
> 
> And will vgconvert take a long time?  May PEs be moved on the disk or
> is only the meta-data rewritten?
> 
Wow :) where you've been hiding for last ~15 years when format V2 exists ;)
V1 is considered obsolete for very looong time and it's been even dropped
from support from version 2.03.

So you need version 2.02.X.

Operation should be instant (it's only metadata rewrite).

AFAIK no PE should be influenced.

Of course it's wise idea to backup header portion of your device
(unsure what sort of metadata you have there - and the test coverage
for this operation likely might need some 'extra care')
But if you will copy 1st. MiB - you can restore back
and report bug if you would find any problem.


Regards

Zdenek
