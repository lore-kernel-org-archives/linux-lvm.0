Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3J1RZn011870
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 14:01:27 -0500
Received: from mail2.ontariocreditcorp.com (mail2.ontariocreditcorp.com
	[209.217.204.70])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3J19tm005476
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 14:01:09 -0500
Received: from backoffice.bplinux.com
	(pool-98-118-141-73.bflony.fios.verizon.net [98.118.141.73])
	by mail2.ontariocreditcorp.com (8.12.10/8.12.10) with ESMTP id
	nA3J17Zv019301
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 14:01:07 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id 7AFAA3E8002
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 13:59:02 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id T-J1tlumNn9p for <linux-lvm@redhat.com>;
	Tue,  3 Nov 2009 13:58:57 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id A1E153E8001
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 13:58:57 -0500 (EST)
Date: Tue, 3 Nov 2009 13:58:57 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-ID: <342828.51257274737508.JavaMail.javamailuser@localhost>
In-Reply-To: <25671167.21257271245732.JavaMail.javamailuser@localhost>
Subject: Re: [linux-lvm] kernel panic on lvcreate
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

The EIP at kmap_atomic has been in every one of these that I have seen. Let me know if there's anything else I can do...

OOPS message:

BUG: scheduling while atomic: java/0x00000001/2959                               [<c061637f>] <3>BUG: scheduling while atomic: java/0x00000001/2867              [<c061637f>] schedule+0x43/0xa55                                                [<c042c40d>] lock_timer_base+0x15/0x2f
 [<c042c46b>] try_to_del_timer_sync+0x44/0x4a
 [<c0437dd2>] futex_wake+0x3c/0xa5
 [<c0434d5f>] prepare_to_wait+0x24/0x46
 [<c0461ea7>] do_wp_page+0x1b3/0x5bb
 [<c0438b01>] do_futex+0x239/0xb5e
 [<c0434c13>] autoremove_wake_function+0x0/0x2d
 [<c0463876>] __handle_mm_fault+0x9a9/0xa15
 [<c041e727>] default_wake_function+0x0/0xc
 [<c046548d>] unmap_region+0xe1/0xf0
 [<c061954f>] do_page_fault+0x233/0x4e1
 [<c061931c>] do_page_fault+0x0/0x4e1
 [<c0405a89>] error_code+0x39/0x40
 =======================
schedule+0x43/0xa55
 [<c042c40d>] <0>------------[ cut here ]------------
kernel BUG at arch/i386/mm/highmem.c:43!
invalid opcode: 0000 [#1]
SMP
last sysfs file: /devices/pci0000:00/0000:00:00.0/irq
Modules linked in: autofs4 hidp rfcomm l2cap bluetooth lockd sunrpc ip6t_REJECTdCPU:    3 ip6table_filter ip6_tables x_tables ipv6 xfrm_nalgo cry
EIP:    0060:[<c041cb08>]    Not tainted VLI
EFLAGS: 00010206   (2.6.18-164.2.1.el5 #1)
EIP is at kmap_atomic+0x5c/0x7f
eax: c0012d6c   ebx: fff5b000   ecx: c1fb8760   edx: 00000180
esi: f7be8580   edi: f7fa7000   ebp: 00000004   esp: f5c54f0c
ds: 007b   es: 007b   ss: 0068                                                  Process mpath_wait (pid: 3273, ti=f5c54000 task=f5c50000 task.ti=f5c54000)ne    Stack: c073a4e0 c0462f7f f7b0eb30 f7b40780 f5c54f3c 0029c3f0 f63b5ef0 f7be8580
       f7b40780 f7fa7000 00008802 c0472d75 f7b0eb30 f7c299c0 00001000 00001000
       00001000 00000101 00000001 00000000 00000000 f5c5007b 0000007b ffffffff
Call Trace:
 [<c0462f7f>] __handle_mm_fault+0xb2/0xa15
 [<c0472d75>] do_filp_open+0x2b/0x31
 [<c061954f>] do_page_fault+0x233/0x4e1
 [<c061931c>] do_page_fault+0x0/0x4e1
 [<c0405a89>] error_code+0x39/0x40
 =======================
Code: 00 89 e0 25 00 f0 ff ff 6b 50 10 1b 8d 14 13 bb 00 f0 ff ff 8d 42 44 c1 e EIP: [<c041cb08>] kmap_atomic+0x5c/0x7f SS:ESP 0068:f5c54f0c
 <0>Kernel panic - not syncing: Fatal exception

 0c 29 c3 a1 54 12 79 c0 c1 e2 02 29 d0 83 38 00 74 08 <0f> 0b 2b


----- "Christopher Hawkins" <chawkins@bplinux.com> wrote:

> Actually it looks like the reverse might be true. I tried this on a
> box with older kernel 2.6.18-92.1.22.el5 and there is no panic. I
> upgraded that box to kernel 2.6.18-164.2.1.el5, reboot, and now the
> panic is reproducible. Trying to get an oops, will post again soon. 
> 
> Christopher Hawkins
> 
> ----- "Milan Broz" <mbroz@redhat.com> wrote:
> 
> > On 11/03/2009 04:07 PM, Christopher Hawkins wrote:
> > > When I create a root snapshot on a fairly typical Centos 5.3
> > server:
> > ...
> > > I get a kernel panic.
> > 
> > Please try to first update kernel to version from 5.4.
> > (There were some fixes for snapshot like
> > https://bugzilla.redhat.com/show_bug.cgi?id=496100)
> > 
> > If it still fails, please post the OOps trace from kernel (syslog).
> > 
> > Milan
> > --
> > mbroz@redhat.com
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
