From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] problem with vgcreate
Message-ID: <1178810000.1038163566@[192.168.200.4]>
In-Reply-To: <013101c293a8$fd403eb0$4700a8c0@bibixp>
References: <20021122200742.GE8618@rdlg.net>
 <013101c293a8$fd403eb0$4700a8c0@bibixp>
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
Date: Sun Nov 24 12:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>> I'm trying to create a LVM for a system.  I partitioned my drives,
>> rebooted and do my pvcreates but then it blows up on vgcreate.  The
>> drives are both 18Gig, I've duplicated the partitions so they're
>> identicle size even though they're going to be concats, not stripes.
>>
>> Here's a screen dump just made a bit readable.
>>
>> root@performance:/root# pvcreate /dev/sda2
>> pvcreate -- physical volume "/dev/sda2" successfully created
>>
>> root@performance:/root# pvcreate /dev/sdb2
>> pvcreate -- physical volume "/dev/sda2" successfully created

> Sure of that ???                               ^^^^

Just for the fun of it, if the physical volumes are still
unusable (this will wipe them out if you are using them:

	for file in /dev/sd[ab]2
	do
		dd if=/dev/null of=$file bs=1b count=1;

		pvcreate --force --verbose $file;

		pvdisplay $file;
	done

If you prefer to use devfs -- I do -- then replace
/dev/sd[ab]2 with /dev/scsi/hostX/target[01]/lun0/part2.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
