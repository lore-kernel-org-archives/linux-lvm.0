From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Kernel PANIC after partition change on RedHat 8.0
Message-ID: <153740000.1042959120@[192.168.200.4]>
In-Reply-To: <Pine.LNX.4.44.0301190820040.24491-100000@keoma.mobiltel.bg>
References: <Pine.LNX.4.44.0301190820040.24491-100000@keoma.mobiltel.bg>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sun Jan 19 00:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Yuliy Minchev <yuliy@mobiltel.bg>

> On Sat, 18 Jan 2003, Steven Lembark wrote:
>
>>
>> > I have installed Red Hat Linux 8.0. I've made volume group (rootvg)
>> > from /dev/md1 (which is raid1). I've put my /boot on /dev/md0.
>> >
>> > As you already have noticed - I have two disks.
>> > After installation I'm making new partiotion /dev/sdb5 i.e.
>> > And if I change its to type to 8e after reboot kernel panics.
>> > If I change type of this partition to something different - the system
>> > boots fine.
>> >
>> > I cannot understand where can be the problem.
>> > I have to say that I made the same configuration on this machine and
>> > everything was ok. But now I cannot see any difference.
>>
>> sdb5 => sub-partition. Are you accidentally carving out
>> a piece of an existing PV? For example, if you had partitioned
>> the disk into /dev/sdb[1234] when it was built with sdb4 taking
>> up most of the device as 8e (i.e., for LVM), then adding sdb5
>> w/in the area of sdb4 would certianly break things -- and scramble
>> your LV's during pvcreate on the new partition.
>
> I have
>
> /dev/sdb1 /boot (member of md0,raid1)
> /dev/sdb1 member of md1, raid1, on md1 is my volume group
> /dev/sdb3 fat32
> /dev/sbd4 extend partion
> /dev/sdb5 is defined as 8e within sdb4
>
> Sorry, but I did not understand your point :(

One thing people have zapped themselves with in the past
is something like:

/dev/sdb4 == one partition
/dev/sdb5 == another partition whose space is
             contained w/in /dev/sdb4

	pvcreate -ff /dev/sdb4;
	vgcreate vg00 /dev/sdb4;
	lvcretate ... vg00;

	<later in time>

	pvcreate -ff /dev/sdb5;
	vgcreate vg01 /dev/sdb5;
	lvcreate ... vg01;

at this point the creation of vg01 has overwritten
data in vg00 becuase the partition /dev/sda5 uses
disk realestate contained within /dev/sda4. This is
a matter purely caused by having moultiple partitions
w/in the same spindle.

That is why I wondered if you had made the mistake
of creating a partition w/in an already-existing
partition which was used as a PV at the time when
your new partition was created and used.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 773 252 1080
