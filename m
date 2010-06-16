Received: from dhcp-0-185.brq.redhat.com (dhcp-0-185.brq.redhat.com
	[10.34.0.185])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5G9U8wV018779
	for <linux-lvm@redhat.com>; Wed, 16 Jun 2010 05:30:08 -0400
Message-ID: <4C18999F.9000903@redhat.com>
Date: Wed, 16 Jun 2010 11:30:07 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>	<20100615164709.GG15698@agk-dp.fab.redhat.com>	<4C17BC76.7090506@cfl.rr.com>
	<4C17D1BF.9010103@redhat.com>	<4C17E16B.8000708@cfl.rr.com>
	<4C17E56D.5010808@redhat.com> <4C181C07.9080001@cfl.rr.com>
In-Reply-To: <4C181C07.9080001@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching every
	pv?
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

Dne 16.6.2010 02:34, Phillip Susi napsal(a):
> On 06/15/2010 04:41 PM, Takahiro Yasui wrote:
>> As for accessing block devices, you can limit accesses to those
>> devices by filter option in lvm.conf. This is an example which
>> allows accesses only to /dev/sd*
>>
>>       filter = [ "a|/dev/sd|", "r|.*|" ]
>>
>> You can specify more strict rule like
>>
>>       filter = [ "a|/dev/sd[a-z]|", "r|.*|" ]
>
> What if I don't want ANY devices to be scanned every time an lvm command
> is run?  Shouldn't they be scanned once when udev first detects they
> have been attached, and no more?  I thought removing /dev from the scan=
> line would do that, but it didn't.
>

I'd have say - this is work-in-progress for now - yes, udev should handle all 
this for lvm - but we are not yet there...

Meanwhile - you may write few scripts which will pass exact filters for your 
lvm commands if you know you do not need to touch those devices.

Zdenek
