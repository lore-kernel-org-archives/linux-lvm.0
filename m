Received: from [10.34.130.176] (dhcp130-176.brq.redhat.com [10.34.130.176])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v269lcCZ001115
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2017 04:47:39 -0500
References: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
Date: Mon, 6 Mar 2017 10:47:37 +0100
MIME-Version: 1.0
In-Reply-To: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend does not change/fix stripes & stripesize
 for the whole LV?
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

Dne 4.3.2017 v 14:58 lejeczek napsal(a):
> right?
> Or it does?
> From man pages my understanding is - it does not, an expression "the
> extension" is used there.
>
> If I have a LV with 2 stripes and 64KiB stripesizes, then adding two more
> stripes, like this:
>
> $ lvextend h300Int1/0 -i 2 -I 16 /dev/sd3 /dev/sd4 (if it was to succeed)
>
> will change the LV into 4 stripes LV, but what would happened to stripesize(s)?
>

Hi

At this moment lvm2 supports extension only of the same types.
So extended/added segment will have some 'geometry' as the last/previous 
segment of your extended LV.

So if you do not add any 'striping' parameters - they will be automatically 
detected from LV, if you add them - they will be compared and in case of 
mismatch operation will be rejected.

Also if the allocation policy and free space in VG allows - extension will try 
first to extend existing segment before allocating new space somewhere else in VG.

Regards

Zdenek
