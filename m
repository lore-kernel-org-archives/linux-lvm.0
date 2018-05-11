References: <CA+p0dM=1BmTA3LyPwGFMH0gO6G7bVa-FUVs-Z8Z8vcRPqHODMQ@mail.gmail.com>
	<20180511082128.jabbpuxnq4c7ypxr@reti>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <6546b6c6-14fb-3180-9b4d-62aa638a2fb3@redhat.com>
Date: Fri, 11 May 2018 10:54:23 +0200
MIME-Version: 1.0
In-Reply-To: <20180511082128.jabbpuxnq4c7ypxr@reti>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] inconsistency between thin pool metadata
 mapped_blocks and lvs output
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
To: john.l.hamilton@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

On 05/11/2018 10:21 AM, Joe Thornber wrote:
> On Thu, May 10, 2018 at 07:30:09PM +0000, John Hamilton wrote:
>> I saw something today that I don't understand and I'm hoping somebody can
>> help.  We had a ~2.5TB thin pool that was showing 69% data utilization in
>> lvs:
>>
>> # lvs -a
>>    LV                    VG       Attr       LSize  Pool Origin Data%
>> Meta%  Move Log Cpy%Sync Convert
>>    my-pool         myvg twi-aotz--  2.44t             69.04  4.90
>>    [my-pool_tdata] myvg Twi-ao----  2.44t
>>    [my-pool_tmeta] myvg ewi-ao---- 15.81g

Is this everything? Is this a pool used by docker, which does not (did 
not) use LVM to manage thin-volumes?

>> However, when I dump the thin pool metadata and look at the mapped_blocks
>> for the 2 devices in the pool, I can only account for about 950GB.  Here is
>> the superblock and device entries from the metadata xml.  There are no
>> other devices listed in the metadata:
>>
>> <superblock uuid="" time="34" transaction="68" flags="0" version="2"
>> data_block_size="128" nr_data_blocks="0">
>>    <device dev_id="1" mapped_blocks="258767" transaction="0"
>> creation_time="0" snap_time="14">
>>    <device dev_id="8" mapped_blocks="15616093" transaction="27"
>> creation_time="15" snap_time="34">
>>
>> That first device looks like it has about 16GB allocated to it and the
>> second device about 950GB.  So, I would expect lvs to show somewhere
>> between 950G-966G Is something wrong, or am I misunderstanding how to read
>> the metadata dump?  Where is the other 700 or so GB that lvs is showing
>> used?
> 
> The non zero snap_time suggests that you're using snapshots.  I which case it
> could just be there is common data shared between volumes that is getting counted
> more than once.
> 
> You can confirm this using the thin_ls tool and specifying a format line that
> includes EXCLUSIVE_BLOCKS, or SHARED_BLOCKS.  Lvm doesn't take shared blocks into
> account because it has to scan all the metadata to calculate what's shared.

LVM just queries DM, and displays whatever that provides. You could see 
that in `dmsetup status` output, there are two pairs of '/' separated 
entries - first is metadata usage (USED_BLOCKS/ALL_BLOCKS), second data 
usage (USED_CHUNKS/ALL_CHUNKS).

So the error lies somewhere between dmsetup and kernel.

What is kernel/lvm version?
Is thin_check_executable configured in lvm.conf?

-- Martian
