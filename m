Message-Id: <20020503143641.GA23301@ntlworld.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
From: Andy Baillie <andrew.baillie@ntlworld.com>
Subject: [linux-lvm] No more than 6 LVs?
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
Date: Fri May  3 09:31:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm creating a new box and decided to fully LVM it. I have the basic
build done. with an initial LV set of root tmp opt usr and var. This
all works fine. I can create a 6th LV no problem but when I try to
create a 7th I get the 

lvcreate -- ERROR "Operation not permitted" opening logical volume "/dev/rootvg/testing"

error message.

The attached strace shows that the node is created in /dev/rootvg/
but then when it is opened again to be populated with data, the open
fails. The debug trace also attached shows the same thing, it creates
the node but then dies.

At this point the LV 'exists' but I cannot format it, as there is no
data about its size. I cannot delete it using lvremove which says it
does not exist, and I cannot lvcreate again as it says it *does* exist!

If I reboot then I can lvremove it fine though that is all I can do.
I can delete and re-create LVs from 1 - 6 with no problems, but once
I try to do the 7th one (or higher) they all fail.

I'm running debian woody pre 3.0 with a 2.4.18 kernel, the only
difference from a stock one being ext2 is compiled in, not a module.
Kernel module is 1.0.1-rc4(ish_)03/10/2001) and
the lvcreate tool is 1.1-rc1

Any suggestions?

the trace/debug attachments follow.

Regards
Andy
-- 
            ---  ===  ~~~  Lands of Stone ~~~ === ---
UK Mudders, too lagged to the States? then have you considered 
 http://www.landsofstone.org/   telnet://mud.landsofstone.org:4801
            ---  ===  ~~~  Lands of Stone ~~~ === ---

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvcreate.version"

LVM version 1.0.1-rc4(ish)(03/10/2001) module loaded

lvcreate: Logical Volume Manager 1.1-rc1
Heinz Mauelshagen, Sistina Software  15/03/2002 (IOP 10)

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvcreate.debug"

<1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 125  pe: 0
<1> lv_setup_for_create -- pe: 0
<22> _free_lv_dev_stack -- CALLED
<22> _free_lv_dev_stack -- LEAVING
<1> lv_setup_for_create -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> lv_create_remove -- CALLED
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<22> lv_check_consistency -- CALLED
<333> lv_check_name -- CALLED with lv_name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- CALLED with name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_name -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> lv_check_consistency -- LEAVING with ret: 0
<22> lv_check_name -- CALLED with lv_name: "/dev/rootvg/testing"
<333> lvm_check_chars -- CALLED with name: "/dev/rootvg/testing"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> lv_check_name -- LEAVING with ret: 0
<1> lv_create_remove -- BEFORE ioctl
<1> lv_create_remove -- BEFORE pv_change_all_pv_for_lv_of_vg
<22> pv_change_all_pv_for_lv_of_vg -- CALLED
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> lv_check_name -- CALLED with lv_name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- CALLED with name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_name -- LEAVING with ret: 0
<333> lv_number_from_name_in_vg -- CALLED
<333> lv_number_from_name -- LEAVING with lv number 6
<22> pv_change_all_pv_for_lv_of_vg -- pv_show
<333> pv_show -- CALLED
<333> pv_show -- LEAVING
<333> pv_change -- CALLED for rootvg: /dev/hda3
<4444> pv_check_name -- CALLED with "/dev/hda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_change -- LEAVING with ret: 0
<22> pv_change_all_pv_for_lv_of_vg -- LEAVING with ret: 0
<1> lv_create_remove -- LEAVING with ret: 0
<1> vg_write_with_pv_and_lv -- CALLED
<1> vg_write_with_pv_and_lv -- BEFORE vg_write of /dev/hda3
<22> vg_write -- CALLED  storing rootvg on /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> lvm_check_uuid -- CALLED with uuidstr: "IwJCRfeu8aZzYLRmrvXeMGVqyQVtum6P"
<333> lvm_check_uuid -- LEAVING with ret: 0
<333> vg_copy_to_disk -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED with VG: rootvg
<666666> lvm_check_chars -- CALLED with name: "rootvg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<333> vg_copy_to_disk -- LEAVING
<22> vg_write -- errno after write: 0
<22> vg_write -- LEAVING with ret: 0
<22> pv_write_uuidlist -- CALLED with PV: /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> lvm_check_uuid -- CALLED with uuidstr: "Z9J2DcnnXgxXxz1kr7SNJLf1Mq8QUR6o"
<333> lvm_check_uuid -- LEAVING with ret: 0
<22> pv_write_uuidlist -- writing 1 UUIDs
<22> pv_write_uuidlist -- LEAVING with ret: 0
<22> pv_write_with_pe -- CALLED with pv->pe_total: 18827
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_write -- CALLED with /dev/hda3 80505A8
<4444> pv_check_name -- CALLED with "/dev/hda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hda3"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: rootvg
<666666> lvm_check_chars -- CALLED with name: "rootvg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> lvm_check_uuid -- CALLED with uuidstr: "Z9J2DcnnXgxXxz1kr7SNJLf1Mq8QUR6o"
<4444> lvm_check_uuid -- LEAVING with ret: 0
<4444> pv_copy_to_disk -- CALLED
<4444> pv_copy_to_disk -- LEAVING
<333> pv_write -- LEAVING with ret: 0
<333> pv_write_pe -- CALLED  pv->pe_total: 18827
<4444> pv_check_name -- CALLED with "/dev/hda3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_to_disk -- CALLED
<4444> pe_copy_to_disk -- LEAVING
<333> pv_write_pe -- LEAVING with ret: 0
<22> pv_write_with_pe -- LEAVING with ret: 0
<22> lv_write_all_lv -- CALLED  pv_name: /dev/hda3
<333> pv_check_name -- CALLED with "/dev/hda3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> lv_write_all_lv -- copying vg->lv[0] "/dev/rootvg/root"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[1] "/dev/rootvg/tmp"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[2] "/dev/rootvg/opt"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[3] "/dev/rootvg/usr"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[4] "/dev/rootvg/var"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[5] "/dev/rootvg/Uandyb"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying vg->lv[6] "/dev/rootvg/testing"
<333> lv_copy_to_disk -- CALLED
<333> lv_copy_to_disk -- LEAVING
<22> lv_write_all_lv -- copying EMPTY LV #7
-- snip some repeating lines --
<22> lv_write_all_lv -- copying EMPTY LV #255
<22> lv_write_all_lv -- storing 83968 byte of 256 LVs on /dev/hda3
<22> lv_write_all_lv -- LEAVING with ret: 0
<1> vg_write_with_pv_and_lv -- AFTER lv_write_all_lv of /dev/hda3
<1> vg_write_with_pv_and_lv -- LEAVING with ret: 0
<1> lv_create_node -- CALLED with /dev/rootvg/testing
<22> lv_check_consistency -- CALLED
<333> lv_check_name -- CALLED with lv_name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- CALLED with name: "/dev/rootvg/testing"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_name -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> lv_check_consistency -- LEAVING with ret: 0
<22> lvm_check_devfs -- CALLED
<22> lvm_check_devfs -- LEAVING with ret: 0
<1> lv_create_node -- LEAVING with 0
<1> lvm_error -- CALLED with: 1
<1> lvm_error -- LEAVING with: "Operation not permitted"
lvcreate -- ERROR "Operation not permitted" opening logical volume "/dev/rootvg/testing"
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvcreate.strace"

write(2, "<22> lv_write_all_lv -- copying "..., 46) = 46
write(2, "<22> lv_write_all_lv -- storing "..., 67) = 67
open("/dev/hda3", O_WRONLY)             = 4
lseek(4, 45056, SEEK_SET)               = 45056
write(4, "/dev/rootvg/root\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 83968) = 83968
fsync(4)                                = 0
close(4)                                = 0
write(2, "<22> lv_write_all_lv -- LEAVING "..., 44) = 44
write(2, "<1> vg_write_with_pv_and_lv -- A"..., 66) = 66
write(2, "<1> vg_write_with_pv_and_lv -- L"..., 51) = 51
write(2, "<1> lv_create_node -- CALLED wit"..., 54) = 54
write(2, "<22> lv_check_consistency -- CAL"..., 36) = 36
write(2, "<333> lv_check_name -- CALLED wi"..., 66) = 66
write(2, "<4444> lvm_check_chars -- CALLED"..., 66) = 66
write(2, "<4444> lvm_check_chars -- LEAVIN"..., 46) = 46
write(2, "<4444> vg_check_name -- CALLED w"..., 47) = 47
write(2, "<55555> lvm_check_chars -- CALLE"..., 54) = 54
write(2, "<55555> lvm_check_chars -- LEAVI"..., 47) = 47
write(2, "<4444> vg_check_name -- LEAVING "..., 44) = 44
write(2, "<333> lv_check_name -- LEAVING w"..., 43) = 43
write(2, "<333> vg_check_name -- CALLED wi"..., 46) = 46
write(2, "<4444> lvm_check_chars -- CALLED"..., 53) = 53
write(2, "<4444> lvm_check_chars -- LEAVIN"..., 46) = 46
write(2, "<333> vg_check_name -- LEAVING w"..., 43) = 43
write(2, "<22> lv_check_consistency -- LEA"..., 49) = 49
write(2, "<22> lvm_check_devfs -- CALLED\n", 31) = 31
open("/proc/mounts", O_RDONLY)          = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40015000
read(4, "/dev/rootvg/root / ext2 rw 0 0\np"..., 1024) = 307
read(4, "", 1024)                       = 0
close(4)                                = 0
munmap(0x40015000, 4096)                = 0
write(2, "<22> lvm_check_devfs -- LEAVING "..., 44) = 44
unlink("/dev/rootvg/testing")           = -1 ENOENT (No such file or directory)
socket(PF_UNIX, SOCK_STREAM, 0)         = 4
connect(4, {sin_family=AF_UNIX, path="/var/run/.nscd_socket"}, 110) = -1 ENOENT (No such file or directory)
close(4)                                = 0
open("/etc/nsswitch.conf", O_RDONLY)    = 4
fstat64(4, {st_mode=S_IFREG|0644, st_size=465, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40015000
read(4, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) = 465
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x40015000, 4096)                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
fstat64(4, {st_mode=S_IFREG|0644, st_size=7525, ...}) = 0
old_mmap(NULL, 7525, PROT_READ, MAP_PRIVATE, 4, 0) = 0x40173000
close(4)                                = 0
open("/lib/libnss_compat.so.2", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340\25"..., 1024) = 1024
fstat64(4, {st_mode=S_IFREG|0644, st_size=40152, ...}) = 0
old_mmap(NULL, 43256, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40175000
mprotect(0x4017f000, 2296, PROT_NONE)   = 0
old_mmap(0x4017f000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x9000) = 0x4017f000
close(4)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 ;\0\000"..., 1024) = 1024
fstat64(4, {st_mode=S_IFREG|0644, st_size=69472, ...}) = 0
old_mmap(NULL, 80988, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40180000
mprotect(0x40191000, 11356, PROT_NONE)  = 0
old_mmap(0x40191000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x10000) = 0x40191000
old_mmap(0x40192000, 7260, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40192000
close(4)                                = 0
munmap(0x40173000, 7525)                = 0
uname({sys="Linux", node="(none)", ...}) = 0
open("/etc/group", O_RDONLY)            = 4
fcntl64(4, F_GETFD)                     = 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
fstat64(4, {st_mode=S_IFREG|0644, st_size=442, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40015000
_llseek(4, 0, [0], SEEK_CUR)            = 0
read(4, "root:x:0:\ndaemon:x:1:\nbin:x:2:\ns"..., 4096) = 442
close(4)                                = 0
munmap(0x40015000, 4096)                = 0
mknod("/dev/rootvg/testing", S_IFBLK|0640, makedev(58, 6)) = 0
chmod("/dev/rootvg/testing", 0660)      = 0
chown32(0x8073940, 0, 0x6)              = 0
write(2, "<1> lv_create_node -- LEAVING wi"..., 37) = 37
open("/dev/rootvg/testing", O_WRONLY)   = -1 EPERM (Operation not permitted)
write(2, "<1> lvm_error -- CALLED with: 1\n", 32) = 32
write(2, "<1> lvm_error -- LEAVING with: \""..., 57) = 57
write(2, "lvcreate -- ERROR \"Operation not"..., 89) = 89
write(2, "<1> lvm_unlock -- CALLED\n", 25) = 25
close(3)                                = 0
write(2, "<1> lvm_unlock -- LEAVING with r"..., 38) = 38
write(1, "--- Physical volume ---\nPV Name "..., 445) = 445
munmap(0x40014000, 4096)                = 0
_exit(24)                               = ?

--SUOF0GtieIMvvwua--
