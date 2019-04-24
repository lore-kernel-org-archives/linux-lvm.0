Message-Id: <5CBFD6B1020000F90006183A@prv1-mh.provo.novell.com>
Date: Tue, 23 Apr 2019 21:23:29 -0600
From: "Gang He" <ghe@suse.com>
References: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
	<9cd91b48-408b-f7a9-c4bc-df05d55376e6@redhat.com>
In-Reply-To: <9cd91b48-408b-f7a9-c4bc-df05d55376e6@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: prajnoha@redhat.com, teigland@redhat.com
Cc: linux-lvm@redhat.com

Hello Peter and David,

Thank for your quick responses.
How do we handle this behavior further?
Fix it as an issue, filter this kind of disk silently. 
or keep the current error message printing, looking a bit unfriendly, but the logic is not wrong.


Thanks
Gang




>>> On 2019/4/23 at 23:24, in message
<9cd91b48-408b-f7a9-c4bc-df05d55376e6@redhat.com>, Peter Rajnoha
<prajnoha@redhat.com> wrote:
> On 4/23/19 7:15 AM, Gang He wrote:
>> Hello List,
>> 
>> One user complained this error message.
>> The user has a usb sd card reader with no media present.  When they issue a 
> pvscan under lvm2-2.02.180 the device is opened which results in 'No medium 
> found' being reported. 
>> But lvm2-2.02.120 did not do this (the device appears to get filtered out 
> earlier). The customer views the 'No medium found' message as an issue/bug.
>> Any suggest/comments for this error message?
>> 
>> The detailed information is as below,
>> lvm2 2.02.180-9.4.2
>> OS: SLES12 SP4
>> Kernel 4.12.14-95.3-default
>> Hardware: HP ProLiant DL380 Gen10
>> 
>> After upgrade from sles12SP3 to SP4, customer is reporting the following 
> error message:
>> 
>>  # pvscan
>>  /dev/sdc: open failed: No medium found
>>  PV /dev/sdb   VG Q11vg10         lvm2 [5.24 TiB / 2.00 TiB free]
>>  Total: 1 [5.24 TiB] / in use: 1 [5.24 TiB] / in no VG: 0 [0   ]
>> 
>> 
> 
> See also https://github.com/lvmteam/lvm2/issues/13 
> 
> -- 
> Peter
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
