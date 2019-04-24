References: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
	<20190423142744.GA9541@redhat.com>
	<a68614d8-6efe-b00a-e40b-210235a58ad7@redhat.com>
	<20190424153533.GB3218@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <29e58765-79fc-90ea-1f7b-1184dad8e91d@redhat.com>
Date: Wed, 24 Apr 2019 21:43:07 +0200
MIME-Version: 1.0
In-Reply-To: <20190424153533.GB3218@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvscan: /dev/sdc: open failed: No medium found
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>, Gang He <ghe@suse.com>

Dne 24. 04. 19 v 17:35 David Teigland napsal(a):
> On Wed, Apr 24, 2019 at 10:37:26AM +0200, Zdenek Kabelac wrote:
>> Dne 23. 04. 19 v 16:27 David Teigland napsal(a):
>>> On Mon, Apr 22, 2019 at 11:15:53PM -0600, Gang He wrote:
>>>> Hello List,
>>>>
>>>> One user complained this error message.
>>>> The user has a usb sd card reader with no media present.  When they issue a pvscan under lvm2-2.02.180 the device is opened which results in 'No medium found' being reported.
>>>> But lvm2-2.02.120 did not do this (the device appears to get filtered out earlier). The customer views the 'No medium found' message as an issue/bug.
>>>> Any suggest/comments for this error message?
>>>>
>>>> The detailed information is as below,
>>>> lvm2 2.02.180-9.4.2
>>>> OS: SLES12 SP4
>>>> Kernel 4.12.14-95.3-default
>>>> Hardware: HP ProLiant DL380 Gen10
>>>>
>>>> After upgrade from sles12SP3 to SP4, customer is reporting the following error message:
>>>>
>>>>    # pvscan
>>>>    /dev/sdc: open failed: No medium found
>>>>    PV /dev/sdb   VG Q11vg10         lvm2 [5.24 TiB / 2.00 TiB free]
>>>>    Total: 1 [5.24 TiB] / in use: 1 [5.24 TiB] / in no VG: 0 [0   ]
>>>
>>> I've heard this a few times now, I guess we should drop it, it's probably
>>> more trouble than help.
>>>
>>
>> This hotfix patch:
>>
>> https://www.redhat.com/archives/lvm-devel/2019-April/msg00067.html
>>
>> is unfortunately faulty and should be reverted.
>>
>> The core problem is - the filtering layer is somehow bypassed where cdrom
>> used be recognized as unsuitable device for opening.
>>
>> So the error reported by lvm2 is really an error where lvm2 should not be
>> trying to even open such device.
> 
> I don't believe opening is the problem; most filters need the device open.
> I suspect the difference is that filter-usable once used
> dev_open_readonly_quiet itself, which suppressed the warning, to use with
> dev_get_size.  Now the filter relies on dev_get_size to open the dev if
> necessary (it's often already open), and that does not use the quiet flag.
> 
> This might be an effective alternative to suppressing all open warnings
> (I can't say for certain in this case until seeing which open triggered
> the warning.)


The core principle should be that lvm2 should always open minimal needed set 
of devices - and always use as much other system hints to avoid opening 
something we know it can't be a PV.

AKA in case of cdrom - it can cause annoying clicking sound - in some other 
cases opening of device that used to be filtered before can even cause unwated 
disk wake-up, delays and in some obscure case maybe even long delays.

So preferable fix is to correct list devices that are going to be opened.

Zdenek
