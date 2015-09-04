Received: from [10.34.131.206] (dhcp131-206.brq.redhat.com [10.34.131.206])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t84B5YaT030409
	for <linux-lvm@redhat.com>; Fri, 4 Sep 2015 07:05:35 -0400
References: <CAFBvFDAwXs=JQ3eBDdUSYLQ8ja+McY38VC0WiGK1bTQRgjZB2g@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55E97AFE.6010009@redhat.com>
Date: Fri, 4 Sep 2015 13:05:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAFBvFDAwXs=JQ3eBDdUSYLQ8ja+McY38VC0WiGK1bTQRgjZB2g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does LVM always do 'dm suspend' when lvcreating a
	thin snapshot?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 4.9.2015 v 00:04 Mike McCracken napsal(a):
> When creating a thin snapshot of a thin volume, does LVM always freeze the FS?
>
> I see when I run lvcreate with -vvv that it sends the 'dm suspend' message to
> the origin lv, but on looking at the code I wasn't quite able to convince
> myself that it will always do that, or under what circumstances it won't.
>

Hi

Yes - suspend of thin's snapshot origin is always enforced
as you normally want snapshot FS to be in consistent state.

Zdenek
