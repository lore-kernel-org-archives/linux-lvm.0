Message-ID: <3EC0225A.8010606@inode.at>
From: Manfred Gschweidl <m.gschweidl@inode.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount root filesystem on lvm
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>	 <3EBD22B3.4090808@inode.at>	 <1052607008.1489.2.camel@chtephan.cs.pocnet.net>	 <3EBDAFF0.5090608@inode.at> <1052647076.580.9.camel@chtephan.cs.pocnet.net>		  <3EBE8FCC.10302@inode.at>	 <1052680419.1131.8.camel@chtephan.cs.pocnet.net>	 <3EBEA6CA.7050500@inode.at> <1052683220.1786.9.camel@chtephan.cs.pocnet.net>
In-Reply-To: <1052683220.1786.9.camel@chtephan.cs.pocnet.net>
Content-Transfer-Encoding: 7bit
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
Date: Mon May 12 17:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com

thanks for your help.

after more than one week, now my system boots cleanly without problems, 
and everything is ok now.

greetings from austria,

manfred





Christophe Saout wrote:
> Am Son, 2003-05-11 um 21.38 schrieb Manfred Gschweidl:
> 
> 
>>uupps...sorry, maybe i should carefully read my mails, after writing 
>>them. ;-)
>>i mean only one entry exists in "/dev/mapper", and this is "control", 
>>but no other entry.
> 
> 
> Ah, ok, I'm seeing. Well, I think that's a problem with LVM2. At the
> moment the device files are created either when a volume group gets
> activated or when it is already active and you add a logical volume.
> 
> But when the volume group got activated by the ramdisk and the system
> switches the root filesystem, you now don't have the devices files.
> 
> I think that's where "lvm mknodes" should kick it, but... not
> implemented yet. And you can't deactivate and reactivate the volume
> group because the root filesystem on it is mounted.
> 
> Great. :D
> 
> So it looks like you must create the device files manually.
> 
> cd /dev/mapper
> mknod volumegroupname-logicalvolumename b 254 0
> mknod volumegroupname-logicalvolumename b 254 1
> ...
> 
> After that you also should create the symlinks
> 
> cd /dev/volumegroupname
> ln -s ../mapper/volumegroupname-logicalvolumename logicalvolumename
> ...
> 
> Since you already put an ls command into the ramdisk before you should
> know which minor got assigned to which volume.
> 
> Or, perhaps this should work: AFAIK if you have a directory /initrd on
> your root filesystem, the old ramdisk should be moved there after the
> root filesystem is mounted, so you can just copy the directories and
> device files that got create there in /dev (/initrd/dev/mapper and
> /initrd/dev/volumegroupname) to your /dev. But I have never tested this.
> 
> This sounds rather ugly and complicated, but it only occurs when
> switching from LVM1 to LVM2 while having it mounted (because you can't
> activate it via LVM2 while running on the real filesystem where the
> device nodes should be created correctly. Or wait until the mknodes
> command is finished or implement it yourself. ;-)
> 
