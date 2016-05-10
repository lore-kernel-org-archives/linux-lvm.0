Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4A8RHLd006950
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 04:27:17 -0400
References: <CAFTDQfBd3s4iohq7sb_1puC37mTTh2VUmWVAyF7Ud0auADZOoQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57319B65.3060402@redhat.com>
Date: Tue, 10 May 2016 10:27:17 +0200
MIME-Version: 1.0
In-Reply-To: <CAFTDQfBd3s4iohq7sb_1puC37mTTh2VUmWVAyF7Ud0auADZOoQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Not informative error message,
 when trying to change unallocatable physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 8.5.2016 17:01, Илья Бока wrote:
> #lvcreate -L600M -n test vg-arch
>    Insufficient free space: 150 extents needed, but only 0 available
>
> but fixed with|
> #pvchange --allocatable y /dev/mapper/lvm
> |
> |maybe possibly change message to more usable?
>

Hi

Thanks for report.

I'd say that making PV not allocatable should also be then reflected in 
vgs/pvs  as not a 'free' space  (e.g. having a VG with non-allocatable PVS 
should show 0 empty space)
But this change would be surely for a discussion since various
backward compatibility issue needs to be though through...

Recent lvm2 tool shows  'pvs' attribute 'u' with non-allocatable PVs
so at least 'quick' look at pvs output shows this easily.

(that's why I think it would be quite 'straightforward' to see 0 free space in 
"VG" and then check  'pvs' and seeing 'u' flag)


The error message you would like to see changed is however at different level.
Its deeply embedded in allocator - so  either we would need to provide some
'hint' message checking if there is  0 free allocatable size, but still some 
space in (u)sed but not allocatable PV  - or the allocator would need to know 
about extra 'unallocatable' space and reflect this in error message.


Anyway  - please open BZ as it's not a simple change and needs some thinking.

https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper


Regards

Zdenek
