Subject: Re: [linux-lvm] cache buffer size
Message-ID: <OF442EBFE4.3A4EDB03-ON85256C69.005AF60C@pok.ibm.com>
From: "Steve Best" <sbest@us.ibm.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Nov  6 11:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Miwako Nakai wrote:
>Thank you, Mr.Mauelshagen
>
>JFS can not have fixed block size. But I heard from JFS group in IBM
>that on 2.5 or later it will be improved. I do not know JFS will have
>fixed block size or not. They said 'improved'.

This isn't right, JFS block size is fixed at 4k. Do you only have this
problem if you snapshot? Could you explain some more about your setup.
Are all of your LVs JFS?

Heinz is it possible that the 1k is coming from the snapshot?

>
>I think LVM(2?) will be able to handle non-consitant block size on
>2.5 well.

>"Heinz J . Mauelshagen" wrote:
>>
>> On Fri, Nov 01, 2002 at 12:07:40PM +0900, Miwako Nakai wrote:
>> > I'm using jfs on lvm/raid5 with snapshot.
>> >
>> > When I copy file, it happens frequently
>> > 'raid5: switching cache buffer size XXX -> XXX'.
>> > This message appears to syslog. It caused speed down to access disks.
>> > So, I cut this message. It's seemed ok.
>>
>> Could be filesystems with different blocksizes accessing the underlying
>> raid5 md through LVM constantly forcing the raid5 stripe cache to be
flushed.
>> If that's the case, you want to put filesystems of the _same_ blocksize
>> onto all of the logical volumes allocated to the raid5 device.
>>
>> Regards,
>> Heinz    -- The LVM Guy --
>>
>> >
>> > But it's still going to switch cache buffer size. I think it cost
>> > some cpu time. When switching buffer cache size, it always happen
>> > reflushing memories.
>> >
>> > I want to fix buffer size. What shall I do?
>> > I asked JFS group. But they do nothing about cache buffer.
>> >
>> > kernel 2.4.20-pre10-ac2
>> > lvm    1.0.5
>> > jfs    1.0.23
>> >
>> > --
>> > nakai@ezinc.com
>>

Steve
JFS for Linux http://oss.software.ibm.com/jfs
