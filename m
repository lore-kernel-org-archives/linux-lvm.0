MIME-Version: 1.0
In-Reply-To: <20170420162411.GC29033@redhat.com>
References: <CAB-bdyR1cNqWzbvFxXqb1+HRcK7Kq0y5Jafj+yJXBdcutrbb0A@mail.gmail.com>
	<20170420160432.GB29033@redhat.com> <20170420162411.GC29033@redhat.com>
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Fri, 21 Apr 2017 19:13:32 -0700
Message-ID: <CAB-bdySA2L6JhbDTPPcinKCXzwv8H9aW1EbZ2khczKS6vBmX+Q@mail.gmail.com>
Subject: Re: [linux-lvm] new multipath device mistakenly replaced another PV
 in existing volume group
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

Thank you David for replying.

The problem turns out to be caused by stale read buffer at backend.

When lvm read a fresh iscsi LUN2 at backend, the read will miss.  So
the read buffer isn't updated, and it contains previous data which may
be metadata of other LUN1.  LVM receives this data and think lun2 has
the same metadata as lun1, and starts to get confused.

I made a fix to zero out read buffer on a read miss at backend.  Now
the problem is gone.

btw,  I'm running centos 6.5 with lvm 2.02.143.   The latest lvm is
2.02.169 (or later?).  How to upgrade to the latest lvm2 on centos
6.5?








On Thu, Apr 20, 2017 at 9:24 AM, David Teigland <teigland@redhat.com> wrote:
> On Thu, Apr 20, 2017 at 11:04:32AM -0500, David Teigland wrote:
>> On Wed, Apr 19, 2017 at 02:53:19PM -0700, Neutron Sharc wrote:
>> > Please note that all these vol3_[0-3] are fresh, without any LVM
>> > metadata on them, as shown by pvscan::
>> > sudo pvscan --cache /dev/mapper/vol3_0
>> >   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
>> >   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
>> >   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
>>
>> That error indicates there is LVM metadata on them.
>>
>> >   Found duplicate PV 9F6vU9NVBfEq1w3e04T5UreO6fDVPJNy: using
>> > /dev/mapper/vol1_3 not /dev/mapper/vol3_0
>>
>> That error indicates it's the same LVM metadata on them.
>>
>> Perhaps you're exporting the same data source on the back end via separate
>> devices, or have copied the data sources, or are using snapshots of them.
>
> Also, if you upgrade to a new version of lvm, there is better checking and
> reporting for these conditions.
>
