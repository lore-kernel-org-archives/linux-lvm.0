Return-Path: <raheesom@navpoint.com>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEMHIOAA.steve.wray@the.net.nz>
References: <NBBBKLKHMJHIJLHOGAOJIEMHIOAA.steve.wray@the.net.nz>
Date: 22 May 2001 19:53:57 -0400
Message-Id: <990575643.1151.0.camel@localhost>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Many thanks for the 2 replies!

Well, since I had the same problem as Steve, I implemented his solution.

Tnx, Steve for the easy howto of your's below.
BTW, what on earth is that "mount -o loop" command?

As I tap on my keyboard, I am working inside of my new LVol, so it
worked, guys!

Since my LVol is on my 2nd disk, next, I think I'll try extending my
Lvol back to cover my 1st disk as well.

One more bit of help, if you can? -

I want to pvmove the file contents of my 2nd disk (/dev/sdb) to my 1st
disk (/dev/sda).  My 1st disk is nice & quiet!  Now the lvm-howto
specifies my next step (adding the "old partition" into the Lvol) as --

pvcreate /dev/sda   <using my device names>
vgextend vg /dev/sda

---  Seeing as I want to do a pvmove of data from /dev/sdb to /dev/sda,
when would I do the pvmove?   As I understand LVM, I need to have the PV
created and integrated into the VG before I can use pvmove - is this
correct?   Then, once pvmove is used, I can then extend the LV & file
system to cover both PVs using e2fsadm, right?


On 23 May 2001 10:56:39 +1200, Steve Wray wrote:
> AHA!
> you too, huh?
> You'll have to add sed to the initial ramdisk.
> 
> Its in /boot/initrd<something>.gz
> unzip it and mount it with
> mount -o loop /boot/initrd<something> /mnt/<somewhere>
> 
> then simply 
> cp /bin/sed /mnt/<somewhere>/bin/
> 
> then unmount it, re-gzip it and away you go!
> 
> And what *I'd* like to know is why isn't sed on the 
> initrd in the first plade if the scripts need it??

Well, it seems not all had the same problem, so I don't know!!??

-- 
regs
rupert
