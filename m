Message-ID: <3D31D180.4050304@creative-realms.net>
From: Andy Baillie <andyb@creative-realms.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Extending an LVM-Partition
References: <20020714190504.GA880@glorybox.de> <20020714212214.A22165@zealot.blacknet.de>
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
Date: Sun Jul 14 14:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Goetz Bock wrote:

>On Sun, Jul 14 '02 at 21:05, Kai Weber wrote:
>
>>Or I ask for an "you can just add the PV hda2 and it does not matter, if
>>there is another PV on this disk" advice.
>>
>It's ok to do this (I do this all the time with my regular setups:
>install the system to a mini ext2 partition, make the rest LVM, move
>system to LVM, add former ext2 partition to LVM. As the installers
>nowadays support LVM this is nolonger needed, but when I started LVM
>no installer knew it).
>It is only a bad idea when you want to try striping (for, I hope,
>obviouse reasons)
>
The method I use is to make an initrd system
hda1 30Mb ext2  /boot
hda2  1G  (or 2x memory) ext /
hda3 200Mb ext2 / (not used initially)
hda4 - the rest as an lvm partition.

I install to hda2 and hda1 until I get a base system which understands 
lvm (with debian woody
this is quite a lot of effort!) Then I copy all genuine root stuff to 
hda3 and make lvm partitions
for the rest which are then populated. Lilo is set to boot either hda2 
or hda3 for safety and I
test the hda3 boot sequence. Once happy I turn hda2 into a swap 
partition. Doing it this way
I find have no worries about merging small partition bits back in.

Regards
Andy Baillie
