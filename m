References: <5735AEE4.4080402@assyoma.it> <20160516185518.GA3320@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <573AE007.7040603@redhat.com>
Date: Tue, 17 May 2016 11:10:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160516185518.GA3320@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Backup superblock for thin provision?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

On 16.5.2016 20:55, Mike Snitzer wrote:
> On Fri, May 13 2016 at  6:39am -0400,
> Gionatan Danti <g.danti@assyoma.it> wrote:
>
>> Hi all,
>> using thin provisioning in production machines (using it mostly for
>> its fast snapshot support, rather than for thin provision / storage
>> overcommit by itself), I wonder what to do if a critical metadata
>> corruption, as the loss of the superblock, should happen.
>>
>> Filesystems generally have some backup copy of the superblock;
>> should the primary one fail, another copy can be used.
>>
>> So I have the following questions:
>> - how about thin LVM? Has it a backup superblock somewhere?
>> - how can the metadata be reliable backupped without shutting down
>> the volume?
>> - more generally, how to deal with metadata backup? Does
>> vgcfgrestore works for thin volumes?
>>
>> Thank you all.
>
> There is more to the thinp metadata than just the metadata superblock.
>
> The DM thin-pool's metadata device was purposely split out from the data
> device to allow for additional metadata fault protection using RAID.
>
> I'll defer to the LVM developers for if/how LVM can be used to have
> thinp metadata redundancy even if you don't have multiple devices to be
> able to use a conventional RAID device.

There is always the option to take 'metadata' snapshot and just
thin_dump content of metadata to a file (located in some 'safe' place)

However validation of 'restore'  if there are some 'snapshots' is questionable 
as the b-tree describing mapped blocks may change significantly
so 'rescued' content may than reference lots of bad blocks.

If you want to just protect 'superblock' against disk fault - usage
of 'raid' could be an option - but ATM there are some 'related' costs with 
management of 'stacked' device tree.

Regards

Zdenek
