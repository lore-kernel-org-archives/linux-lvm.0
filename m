Date: Thu, 06 Sep 2001 18:14:12 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Feature : Merge two LV
Message-ID: <12570000.999818052@dizzy>
In-Reply-To: <20010906220553.Z32553@turbolinux.com>
References: <Pine.LNX.4.30.0109062137150.11080-100000@x14.informatik.uni-brem
 en.de> <20010906220553.Z32553@turbolinux.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Andreas Dilger <adilger@turbolabs.com>

> On Sep 06, 2001  21:51 +0200, Henk Birkholz wrote:
>> It would have been easier (without moving the date manually) if some kind
>> of lvmerge would exist, which would merge the lv and thier fs
>> automatically. Maybe there is ia wayto do it, i simply don't know.
>> In that case i would be glad to know that way from you. (and be added to
>> you FAQ).
>
> What you ask for is very complex.  It is not so much an issue of LVM
> (which could do such a thing relatively easily), but a filesystem issue
> (which is _very_ hard to do.  Even with a tree-based filesystem like
> reiserfs or XFS, there are all sorts of duplicate identifiers stored in
> the filesystem, like block numbers, inode numbers, etc, which would make
> it complex to resolve.


	lvcreate -l somesize vgXX;
	mkfs.ext2 -b4096 -i10240 /dev/vgXX/lvolY;
	mount /dev/vgXX/lvolY /mnt;
	find /lvolA/mount/point /lvolB/mount/point -xdev | cpio -pd --dot /mnt;
	vi /etc/fstab;
	<remove lvolA and lvolB, add in lvolY>
	umount /mnt;
	mount -a;

If at this point you have what you want then lvremove lvolA & lvolB.
Nice thing about it is that nothing gets removed until the new file
system looks clean.

If you're tight on space create a smaller volume, archive onto it
instead of tape w/ bzip2 -9 (i.e., seriously squish the data), blow
off the lvol's and recover from disk.

--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
