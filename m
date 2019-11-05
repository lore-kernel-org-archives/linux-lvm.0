Date: Tue, 5 Nov 2019 11:40:01 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="185206533-1230804827-1572972002=:14929"
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: =?ISO-8859-15?Q?Tomas_Dalebj=F6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-1230804827-1572972002=:14929
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 4 Nov 2019, Tomas Dalebjörk wrote:

> Thanks for feedback.
> 
> Let me try to type different scenarios:
> 
> We have an origin volume, lets call it: /dev/vg00/lv00
> We convert a snapshot volume to origin volume, lets call it: /dev/vg00/lv00-snap
> - all blocks has been changed, and are represented in the /dev/vg00/lv00-snap, when we start the lvconvert process
> 
> I assume that something reads the data from /dev/vg00/lv00-snap and copy that to /dev/vg00/lv00
> It will most likely start from the first block, to the last block to copy.

Merging starts from the last block on the lv00-snap device and it proceeds 
backward to the beginning.

> The block size is 1MB on /dev/vg00/lv00-snap, and we have for simplicity the same block size on the origin /dev/vg00/lv00
> 
> Scenario 1: A read comes want to read block LP 100, but lvconvert has not yet copied that LP block.
> Will the read comes from /dev/vg00/lv00-snap directly and delivered to requestor?

Yes.

> Or will lvconvert prioritize to copy data from /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block, and let the requestor wait until the copying has been completed, so
> that a read operation can happen from origin?
> Or will the requestor have to wait until the copy data from /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block has been completed, without any prioritization?

It only waits if you attempt to read or write the block that is currently 
being copied.

If you read data that hasn't been merged yet, it reads from the snapshot, 
if you read data that has been merged, it reads from the origin, if you 
read data that is currently being copied, it waits.

> Scenario 2: A write comes want to write block LP 100, but lvconvert has not yet copied that LP block (yes, I do understand that origin is hidden now)
> Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to /dev/vg00/lv00 for that block, and let the requestor write the changes directly on the origin after the
> copying has been performed?

No.

> Or will the write be blocked until lvconvert has finished the copying of the requested block, and than a write can be accepted to the origin?
> Or where will the changes be written?

The changes will be written to the lv00-snap device.

If you write data that hasn't been merged yet, the write is redirected to 
the lv00-snap device. If you write data that has already been merged, the 
write is directed to the origin device. If you write data that is 
currently being merged, it waits.

> It is important for me to understand, as the backup device that I want to map as a COW device is a read only target, and is not allowed to be written to.

You can't have read-only COW device. Both metadata and data on the COW 
device are updated during the merge.

> If read happends from the backup COW device, and writes happends to the origin, than it is possible to create an instant recovery.
> If writes happends to the backup COW device, than it not that easy to implement a instance reovery solution, as the backup device is write protected.
> 
> Thanks in advance.

Mikulas
--185206533-1230804827-1572972002=:14929--
