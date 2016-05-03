Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43GRHXe006654
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 12:27:17 -0400
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
	<57287570.5090509@redhat.com>
	<CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
	<5728BA8A.3040009@redhat.com> <f56c5af2e35182a73de542adb66e3af5@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5728D164.9080906@redhat.com>
Date: Tue, 3 May 2016 18:27:16 +0200
MIME-Version: 1.0
In-Reply-To: <f56c5af2e35182a73de542adb66e3af5@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Lvm think provisioning query
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

On 3.5.2016 17:51, Xen wrote:
> Zdenek Kabelac schreef op 03-05-2016 16:49:
>
>> Expecting you run out-of-space in thin-pool and nothing bad can
>> happens is naive ATM - we are cooperating at least with XFS/ext4
>> developers to solve some corner case, but there is still a lot of work
>> to do as we exercise quite unusual error paths for them.
>
> You also talked about seeing if you could have these filesystems work more in
> alignment with block (extent) boundaries, right?

Yes it's mostly about 'space' efficiency.

i.e.  it's inefficient to  provision  1M thin-pool chunks and then filesystem
uses just 1/2 of this provisioned chunk and allocates next one.
The smaller the chunk is the better space efficiency gets (and need with 
snapshot), but may need lots of metadata and may cause fragmentation troubles.

ATM thin-pool support a single chunksize - so again up to admin to pick the 
right one for its needs.

For Read/Write alignment still the physical geometry is the limiting factor.


Zdenek
