Return-Path: <raheesom@navpoint.com>
Message-Id: <200104180421.f3I4LNf08654@west.navpoint.com>
Subject: Re: [linux-lvm] Seems LVM not properly installed - help!
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <200104180057.f3I0vbo5015874@webber.adilger.int>
Date: 17 Apr 2001 23:13:43 -0400
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

On 17 Apr 2001 18:57:37 -0600, Andreas Dilger wrote:
> Rupert writes:
> 
> Try running both:
> 
> echo "'`lvmiopversion`'"
> strace lvmiopversion


I think I've found out what the problem is.....  I had a look at the
/dev/lvm device.  It looked just like you said it should.  I saw the
root ownership, and that reminded me of a common mistake of mine -
trying to run something an non-root.

I SUed to root.  Ran "vgcreate" as an example, and got what I would
expect -


    [root@NAV-111 /dev]# vgcreate
    vgcreate
    vgcreate -- please enter a volume group name and physical volumes

So I guess it was that simple. 

Just in case giving you the output of STRACE LVMIOPVERSION does help,
here it is -

> echo "'`lvmiopversion`'"

    ^^^^^^^^^^^^^^^^^^     This line didn't make sense to me, output
just ''lvmiopversion''.


[root@NAV-111 /dev]# strace lvmiopversion
execve("/sbin/lvmiopversion", ["lvmiopversion"], [/* 41 vars */]) = 0
uname({sys="Linux", node="NAV-111.DSL.NAVPOINT.COM", ...}) = 0
brk(0)                                  = 0x80499e0
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=37642, ...}) = 0
old_mmap(NULL, 37642, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\300\1"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5155229, ...}) = 0
old_mmap(NULL, 1214792, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =
0x40022000
mprotect(0x40142000, 35144, PROT_NONE)  = 0
old_mmap(0x40142000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x11f000) = 0x40142000
old_mmap(0x40147000, 14664, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40147000
close(3)                                = 0
munmap(0x40018000, 37642)               = 0
getpid()                                = 1453
stat64("/dev/lvm", {st_mode=S_IFCHR|0640, st_rdev=makedev(109, 0), ...})
= 0
open("/dev/lvm", O_RDONLY)              = 3
ioctl(3, 0x8004fe98, 0xbffff8ba)        = 0
close(3)                                = 0
fstat64(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x40018000
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) = 0
write(1, "10\n", 310
)                     = 3
munmap(0x40018000, 4096)                = 0
_exit(0)                                = ?


-----------------------------------------------------

The next thing I need to figure out is how to convert my root file
system to LVM when it's more than 50% full.  I have another disk which
is going to go into the volume set.   I'm reading through the LVM-HOWTO
on this, but am skeptical about how to go ahead. 


In case you can offer any advice, my current setup is -

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         3     24066   83  Linux
/dev/sda2             4      1116   8940172+   5  Extended
/dev/sda5             4      1099   8803588+  83  Linux
/dev/sda6          1100      1116    136521   82  Linux swap

If I create an LVM volume first on /dev/sdb (my second disk), but don't
copy over the root partition files, can I then extend the LV to
/dev/sda5 so that my files are then inside the LV?

That's enough for now.  I don't want to ask ALL my questions at once!

Thanks a lot for your help so far !

-- 
regs
rupert
