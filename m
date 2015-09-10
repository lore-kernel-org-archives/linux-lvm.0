Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8ADmQwU011573
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 09:48:27 -0400
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<55F17EC1.6070903@redhat.com>
	<CAAxjCEw1Jv_UUc81H_dWVVyfkiR_C9rZaRD6ioXOxddpuzZB4g@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F18A2A.8010305@redhat.com>
Date: Thu, 10 Sep 2015 15:48:26 +0200
MIME-Version: 1.0
In-Reply-To: <CAAxjCEw1Jv_UUc81H_dWVVyfkiR_C9rZaRD6ioXOxddpuzZB4g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Strange dm-cache activity at startup
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

Dne 10.9.2015 v 15:11 Stefan Ring napsal(a):
> On Thu, Sep 10, 2015 at 2:59 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>> Please first try to use the latest kernel.
>> Kernel 3.17 is almost a year old.
>>
>> Lots of optimizations went in meanwhile.
>> It's pointless to hunt already fixed bug.
>
> No problem. I'll soon upgrade to 4.2 because I'm eager to try smq.
> I've been held back by a zfsonlinux bug that has prevented an upgrade
> and has only very recently been fixed.


For playing with smq - you definitely need the latest lvm2 version as well.

Zdenek
