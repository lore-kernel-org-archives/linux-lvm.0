Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAEMvF6v008745
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 17:57:15 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAEMv0Nw020675
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 17:57:01 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAEMuxOq015819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 17:57:00 -0500
Message-ID: <4CE0693B.3020509@bmsi.com>
Date: Sun, 14 Nov 2010 17:56:59 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>	<20101113230310.GH14546@barkeeper1-xen.linbit>
	<AANLkTinXXW_QFHa7wEM-rb8rvO-8iXmAzK3yEL1j79uL@mail.gmail.com>
In-Reply-To: <AANLkTinXXW_QFHa7wEM-rb8rvO-8iXmAzK3yEL1j79uL@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 11/13/2010 10:56 PM, Stirling Westrup wrote:
>
>> Then dd_rescue copy the disk image from bad-old to new, including
>> everything (partition table, if any, LVM signature, the full image).
>>
>> Remove bad-old drive, have all other old and the new plugged,
>> reboot normally
> Thanks. I did consider this, but the new drive is twice the size of
> the old one, so I would need to make sure I had created a partition on
> the new drive the exact size of the old one, and had dd-ed everything
> correctly. Even then, I wasn't sure if it would work, because I don't
> know what the metadata records in terms of the drive configurations.
The partition can be bigger.  Just run pvresize on the new partition
when done.  The metadata goes by UUID and doesn't
care what drive it is on (which results in a FAQ when cloning VGs via SAN).
