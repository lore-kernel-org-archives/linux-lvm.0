MIME-Version: 1.0
In-Reply-To: <20170314140432.GB4723@redhat.com>
References: <CAB-bdyTrKbjREU_vRAHiLQvWBh=rt8Mh45CZ0_-3BsHKSkz_Nw@mail.gmail.com>
	<20170314140432.GB4723@redhat.com>
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Tue, 14 Mar 2017 15:40:56 -0700
Message-ID: <CAB-bdySA=nmmBn6uvhc9EOqmtgXA52Ot0=C38fZEwd-3+-8p1w@mail.gmail.com>
Subject: Re: [linux-lvm] vgcreate failed when using iscsi + dm-multipath +
	lvm
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
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Thank you David!

I grabbed lvm2 src (git://sourceware.org/git/lvm2.git)  and build from
tag v2_02_168.  It seems the basic "./configure" doesn't include a lot
of components such as lvmetad.  What are the config options you would
recommend to use?  Thanks.



-Shawn

On Tue, Mar 14, 2017 at 7:04 AM, David Teigland <teigland@redhat.com> wrote:
> On Mon, Mar 13, 2017 at 06:12:06PM -0700, Neutron Sharc wrote:
>> error 1:
>>  Physical volume '/dev/mapper/360000000557b690283509c3709c4fc0b' is
>> already in volume group 'vol8',
>>  Unable to add physical volume
>> '/dev/mapper/360000000557b690283509c3709c4fc0b' to volume group
>> 'vol14'.
>>
>> error 2:
>>  Found duplicate PV W9rMQ0GuoNw9rnzK8x47OVEY044A2mgT: using
>> /dev/mapper/360000000a1d91e849f66dd53a61d8fa9
>>  not /dev/mapper/360000000e2ddd2a9380e9159902d9f73,  Using duplicate
>> PV /dev/mapper/360000000a1d91e849f66dd53a61d8fa9 without holders,
>> replacing /dev/mapper/360000000e2ddd2a9380e9159902d9f73,
>>
>> error 3:
>> Can't open /dev/mapper/360000000e2ddd2a9380e9159902d9f73 exclusively.
>> Mounted filesystem?
>> Unable to add physical volume
>> '/dev/mapper/360000000e2ddd2a9380e9159902d9f73' to volume group
>> 'vol2'.
>
> Fairly common problem, lvm needs to see only the multipath device and not
> the components.  Make sure lvm.conf has multipath_component_detection
> enabled.  There was also a recent related fix:
>   lvmetad: use udev to ignore multipath components during scan
>
