Message-ID: <3EBBFF45.4050006@inode.at>
From: Manfred Gschweidl <m.gschweidl@inode.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount root filesystem on lvm
References: <3EBBF411.6060405@inode.at>
In-Reply-To: <3EBBF411.6060405@inode.at>
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
Date: Fri May  9 14:19:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

hello once again,

i used the ls command within the "linuxrc" script of the initial ramdisk.
"ls /dev/mapper/control" results only with "/dev/mapper/control"

"ls /dev/mapper results in following output:
control
...
progs-root
...

so i used "root=/dev/mapper/progs-root" as boot option, but i can still 
not mount the root filesystem.

was anyone successfull with booting the root-filesystem on am lvm-volume 
with lvm2 and device-mapper interface, using an initial ramdisk??

can anyone point me in the right direction??


thanks for any help in advance.

greetings from austria,

manfred




Manfred Gschweidl wrote:
> 
> hello again,
> 
> now i solved the problems with "/dev/mapper/control".
> 
> it seems, that the kernel now finds all volumegroups, but now i get a 
> kernel panic, that the kernel cannot mount my root filesystem within the 
> lvm volumes. the message says, that i should append the correct "root=" 
> boot option on startup??
> 
> with kernel 2.4.12 and lvm 1.x it was "/dev/progs/root".
> now i use kernel 2.4.20 with device-mapper and lvm2.
> as with kernel 2.4.12 i use a inital ramdisk.
> 
> how can i find out, what now is the correct option for "root="??
> 
> 
> thanks for any help again.
> 
> 
> manfred
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
