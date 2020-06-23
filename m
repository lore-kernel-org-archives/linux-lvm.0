References: <1643811.X513TT2pbd@localhost.localdomain>
	<dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
	<bdaefe2a481fb2f830153dbef1496f16@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c175cc56-252b-d349-ebec-85e3683a7773@redhat.com>
Date: Tue, 23 Jun 2020 23:02:04 +0200
MIME-Version: 1.0
In-Reply-To: <bdaefe2a481fb2f830153dbef1496f16@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Removing VG mappings using dmsetup tool
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: nsoffer@redhat.com, Vojtech Juranek <vjuranek@redhat.com>

Dne 23. 06. 20 v 22:37 Gionatan Danti napsal(a):
> Il 2020-06-23 22:28 Zdenek Kabelac ha scritto:
>> Note - you cannot 'remove' mappings 'in-use'� (aka open count of a device
>> is higher then 0� - see 'dmsetup info -c' output for this).
>> However you can replace such mapping with 'error' target - so the
>> underlaying device is relaxed - although we do not support this
>> in lvm2 - you would need to use 'dmsetup' for this (and open lvm2 RFE
>> if there would be some serious justifaction).
> 
> Not related to oVirt, but I would find a means to set an error target with LVM 
> quite useful - think about immediately stopping IO to/from device in case some 
> serious error happended. Using lvm rather than dmsetup would be easier and 
> less error prone.

Hi

ATM skilled admin can always easily enforce:

'dmsetup remove --force   vg-lv'

for i.e. linear devices to achieve this goal - however resolving this at lvm2 
is actually way more complex task when you start to consider the situation
should be at least 'somehow' recoverable - it's quite complicated and
not really highly demanded functionality.
It's more simple if you have constrained world of known types of devices
and known use-case you are targeting to solve.

Regards

Zdenek
