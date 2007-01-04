Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l044UcB9024453
	for <linux-lvm@redhat.com>; Wed, 3 Jan 2007 23:30:38 -0500
Received: from mta06.sannet.ne.jp (mta06.sannet.ne.jp [134.180.49.76])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l044UaZk030652
	for <linux-lvm@redhat.com>; Wed, 3 Jan 2007 23:30:37 -0500
Received: from [192.168.0.77] (eaa1-ppp746.west.sannet.ne.jp [211.133.178.238])
	by mta06.sannet.ne.jp (Postfix) with ESMTP id BA7A828C0
	for <linux-lvm@redhat.com>; Thu,  4 Jan 2007 13:30:29 +0900 (JST)
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <ED3062F2-3141-4767-AB70-3E9096A54E1C@sannet.ne.jp>
References: <ED3062F2-3141-4767-AB70-3E9096A54E1C@sannet.ne.jp>
Message-Id: <7FACFEC6-64AA-4896-8457-39D98E1D45DC@sannet.ne.jp>
Content-Transfer-Encoding: 7bit
From: Joel Rees <joel_rees@sannet.ne.jp>
Subject: Re: [linux-lvm] recovering volumes
Date: Thu, 4 Jan 2007 13:30:29 +0900
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

For the record:

I finally had a full day or two that I could sit quietly and think. I  
noticed on /. last night that some people were mentioning Christophe  
Grenier's photorec as a tool for digging out image files, so I  
downloaded it last night and it did find all my files in the lost  
physical partition that I had attached to the botched volume group.  
All 70,000+ of them, scattered across 170 or so directories. Had to  
sacrifice a partition I'd been playing with freebsd in to hold the 11G 
+ of recovered files.

The photorec download comes with testdisk, which can find blown  
partitions, so I played with that as well. It saw the missing LVM  
partitions. I'm not sure if writing the results on the disk with the  
main volume group (/hda2) helped or not, but finding them was re- 
assuring, and this morning I was able to recover the volumes  
completely. (Yeah, psychological, I know.)

The way I did it was to sacrifice the remains of an old install of  
FC4 in another partition on /hda to install a second (very minimal)  
FC5 in a single base partition, no LVM. Then I booted back up in FC6  
on /hde2 to edit /boot/grub/grub.conf in the boot partition in /hda1  
so that grub would see the new install of FC5. Then I booted the new  
FC5 and started reading the man for lvm again.

pvdisplay, I think it was, saw the missing physical volumes.

So I mounted the old boot partition under /oldfc5 and cd-ed into / 
oldfc5/etc/lvm and looked at the stuff in backup and archive. The  
uuids in the most recent archive of the lost fc5 volume group and the  
backup were the same.

So I did a pvcreate --restorefile backup/fc5 --uuid <long uuid> /dev/ 
hde3 to re-create the physical volume on the other disk. It  
complained that it didn't find the physical volume, but then it said  
volume created.

So I continued with a pvcreate --restorefile backup/fc5 --uuid <other  
long uuid> /dev/hda2 and this time it created the physical volume  
with no complaints.

So I did the vgcfgrestore --file backup/fc5 (I think it was, too bad  
I didn't save the shell.) and that gave me a message that indicated  
success. So I looked at the file system with the graphical lvm  
manager widget and it now showed all my lost logical partitions.

I had to get rid of some cruft in /etc/fstab for the old fc5, but it  
boots, and all my files are there.

I'm probably leaving out a step or two, I really should have saved  
the text of the terminal session so I would have a record.

I haven't tried booting FC6 to see if it survived the process.

On 2006/12/24, at 18:40, Joel Rees wrote:

> Using Fedora Core 5 I had a volume group on /dev/hda3 and added a  
> logical volume on /dev/hde3. Didn't read the how to, didn't know  
> it's a no-no. Decided to play with Ubuntu, and thought I'd set up  
> logical volumes for it on /dev/hde2. Apparently, I wiped out the  
> headers on /dev/hde3 and then the entire logical group for FC5  
> refused to mount. In attempting to recover the headers I've  
> apparently wiped out the headers for the whole volume group --  
> pvcreate using a recovery option or something that I failed to  
> follow with some generate command, if I remember right. Also, I set  
> up a volume group on /dev/hde2 and loaded FC6 into that since I was  
> feeling burned by Ubuntu at the time.
>
> Any guesses at how badly I'm screwed? or pointers to more  
> information than can be found on the how-to pages?
>
> Not really life-or-death data lost, but I had been using it to back  
> up the digital camera and there were about a months worth of my  
> kids experiments that I don't have a backup of. Also, it would be a  
> useful exercise for me, in terms of gaining confidence in lvm, if  
> there were some way to recover the headers just from the stuff in / 
> etc/lvm .
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
