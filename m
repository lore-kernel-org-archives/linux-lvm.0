References: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
	<20190603132327.GA32187@reti>
	<512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
	<d831c385-b935-0c95-c900-f724468cec1f@service4.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <62bf5632-0cca-6bc8-191e-b931e12db827@redhat.com>
Date: Wed, 5 Jun 2019 12:31:42 +0200
MIME-Version: 1.0
In-Reply-To: <d831c385-b935-0c95-c900-f724468cec1f@service4.ru>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fast thin volume preallocation?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <mail@service4.ru>

Dne 03. 06. 19 v 23:12 Ilia Zykov napsal(a):
>>
>>> Presumably you want a thick volume but inside a thin pool so that you
>>> can used snapshots?
>>> If so have you considered the 'external snapshot' feature?
>>
>> Yes, in some cases they are quite useful. Still, a fast volume
>> allocation can be an handy addition.
>>
> 
> Hello.
> Can I use external snapshot for fast zero allocation?
>   "thpool" - is lvmthin with lvm zeroing disabled
> 
> # lvcreate -n ext2T -V 2TiB --thinpool thpool VG
> # lvchange --permission r VG/ext2T
> 
> # lvcreate -n zeroed_lve -s VG/ext2T --thinpool VG/thpool
> 
> Or it will be the same as zeroing enabled?


Hi

It's not clear what do you want to achieve.

External origin for thin-volume is always a read-only LV.

External origin can be of any type - i.e. even thinLV from another thin-pool
and single origin can be used for number of thin volumes with external origin.

For now you CANNOT 'merge' such thinLV with external origin - so the only way
to get 'writable' origin back is to drop all thins that are using it as 
external origin.

Now - how the 'zeroing' plays the role here ?

Zeroing is property of thin-pool that serves thinLV.
Unprovisioned blocks always do return 'zeroes'.

When block is provisioned - unwritten portions needs to be zeroed (depending 
on zeroing setting)  - the bigger the block the bigger the chance the zeroing 
will take more time - lvm2 does not recommend using thin-pool with zeroing and 
chunksize bigger then 512KB.

Most modern filesystem keep track of written pieces of a block device 
themselves, so zeroing has almost no practical use.

Regards

Zdenek
