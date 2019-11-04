References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
Date: Mon, 4 Nov 2019 11:07:01 +0100
MIME-Version: 1.0
In-Reply-To: <5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 04. 11. 19 v 6:54 Tomas Dalebjörk napsal(a):
> Hi
> 
> I have some additional questions related to this.
> regarding this statement:
> “ While the merge is in progress, reads or writes to the origin appear as they 
> were directed to the snapshot being merged. ”
> 
> What exactly does that mean?
> 
> Will that mean that before changes are being placed on the origin device, it 
> has to first:
> read the data from the snapshot back to origin, copy the data back from origin 
> to the snapshot, and than after that allow changes to happen?
> if that is the case, does it keep track of that this block should not be 
> copied again?

Hi

When the 'merge' is in progress -  your 'origin' is no longer accessible
for your normal usage. It's hiddenly active and only usable by snapshot-merge 
target)

So during 'merging' - you can already use you snapshot like if it would be and
origin - and in the background there is a process that reads data from 
'snapshot' COW device and copies them back to hidden origin.
(this is what you can observe with 'lvs' and copy%)

So any 'new' writes to such device lends at right place -  reads are either 
from COW (if the block has not yet been merged) or from origin.

Once all blocks from 'COW' are merged into origing - tables are remapped again
so all 'supportive' devices are removed and only your 'now fully merged' 
origin becomes present for usage (while still being fully online)

Hopefully it gets more clear.


For more explanation how DM works - probably visit:
http://people.redhat.com/agk/talks/

> and will the ongoing merge priorities this block before the other background 
> copying?
> 
> how about read operations ?
> will the requested read operations on the origin volume be prioritized before 
> the copying of snapshot data?

The priority is that you always get proper block.
Don't seek there the 'top most' performance - the correctness was always the 
priority there and for long time there is no much devel effort on this ancient 
target - since  thin-pool usage is simply way more superior....

1st. note - major difficulty comes from ONLINE usage. If you do NOT need 
device to be online (aka you keep 'reserve' copy of device) - you can merge 
things directly into a device - and I simply don't see why you would want to 
complicate this whole with extra step of transforming data into COW format 
first and the do online merge.

2nd. note - clearly one cannot start 'merge' of snapshot into origin while 
such origin device is in-use (i.e. mounted) - as that would lead to 
'modification' of such filesystem under its hands.

Regards

Zdenek
