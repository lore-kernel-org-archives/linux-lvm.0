From: Geert Jansen <geertj@boskant.nl>
Message-ID: <20021020134403.GA19950@vader.boskant.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Oops with kernel 2.5.44
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
Date: Sun Oct 20 08:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dear LVM developers,

I decided to give LVM2 a try but unfortunately it oopses on me.
Software I used:

  * Linux kernel 2.5.44
  * Device mapper patches from:
    http://people.sistina.com/~thornber/patches/2.5-stable
  * Device mapper programs from:
    ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-latest.tgz
  * LVM2 tools from:
    ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-latest.tgz

The oops:

Unable to handle kernel NULL pointer dereference at virtual address 00000004
 printing eip:
c01f2aca
*pde = 00000000
Oops: 0002
 
CPU:    0
EIP:    0060:[<c01f2aca>]    Not tainted
EFLAGS: 00010202
EIP is at device_add+0xea/0x160
eax: cf091560   ebx: c04517d0   ecx: 00000000   edx: 00000000
esi: cf091558   edi: ffffffea   ebp: cf091500   esp: cf10def8
ds: 0068   es: 0068   ss: 0068
Process vgchange (pid: 138, threadinfo=cf10c000 task=cfa2e0a0)
Stack: cf091558 00000077 cf091558 00000001 cf0915e1 c016f5b8 cf091558 00000002 
       c020fa55 0000fe00 00000000 00000000 00000000 cf091400 082480d8 00000002 
       c0278844 cf091500 c035d01d 00000000 00000000 d28e0000 c027bc78 d28e0022 
Call Trace:
 [<c016f5b8>] register_disk+0x48/0x170
 [<c020fa55>] add_disk+0x75/0x90
 [<c0278844>] dm_create+0x124/0x160
 [<c027bc78>] create+0x98/0xd0
 [<c027c6db>] ctl_ioctl+0xbb/0xf0
 [<c027bbe0>] create+0x0/0xd0
 [<c0155164>] sys_ioctl+0xf4/0x320
 [<c010782b>] syscall_call+0x7/0xb

Code: 89 4a 04 89 11 89 d9 89 46 08 89 40 04 ff 05 d0 17 45 c0 0f 
 

The oops occured when running the command "vgchange -ay". Before that,
the command "vgscan" executed successfully. The system is a Dell laptop
with a 20G LVM volume group created with the LVM1 tools. The metadata
format is "lvm1".

I'd be happy to provide more information or test a patch.

Regards,
Geert Jansen
