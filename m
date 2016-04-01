Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3188hII017257
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2016 04:08:43 -0400
References: <CAAYit8QYf0yTHSumcpTdVBRN6uvwNj3v4NHyThKOZen92WZY-Q@mail.gmail.com>
	<56FD151C.8060500@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56FE2C8A.5040309@redhat.com>
Date: Fri, 1 Apr 2016 10:08:42 +0200
MIME-Version: 1.0
In-Reply-To: <56FD151C.8060500@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bugs in DM_DEVICE_STATUS ioctl no_flush flag
	settings
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

Dne 31.3.2016 v 14:16 Zdenek Kabelac napsal(a):
> Dne 21.3.2016 v 13:06 Ming-Hung Tsai napsal(a):
>> Hi,
>
> Hi
>> ------------------------------------------------------------------
>> 3. Fix _metadatapercent_disp to not to handle thin volumes
>>
>
>
> Actually I always planned to 'display' highest_mapped_sector -
> so I did now upstreamed it now (as it seemed arg was unused).
>
> So "Meta%" shows what's been the highest written sector as percent.
> We do plan to add either switch or new field to show those '%' in
> form of byte sizes in future...
>
> Not yet sure how useful or confusing this info is for now...
> But i.e. it's interesting to see  how much data is written
> by mkfs.ext4/xfs/reiserfs  and how far writes goes on a thin device.
>
> Time for complains...
>

Following here on myself - after longer debate how this would be
understandable by a user - we've concluded we will rather introduce
a new field and leave  "Meta%" empty - so there will
be rather a new field  'highest_size/HSize' instead.

Regards

Zdenek
