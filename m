Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <17080000.1008517551@dizzy>
References: <1008557869.831.2.camel@defiant>  <17080000.1008517551@dizzy>
Content-Transfer-Encoding: 7bit
Message-Id: <1008594826.829.2.camel@defiant>
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
Date: Mon Dec 17 07:11:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2001-12-16 at 10:45, Steven Lembark wrote:

> (1) What happens if you use ext2 -- using one of the non-standard
>     file systems for testing just brings in extra variables?
 
I will try this, however, these errors occur prior to the filesystems
being initialized. Also, I decided to try to delete the PV. I deleted
the LV, but every time I tried to delete the VG, I get

[defiant /home/storm]# vgchange -a n vg01
vgchange -- volume group "vg01" successfully deactivated

[defiant /home/storm]# vgremove vg01
Segmentation fault

The logs show the following:

Dec 17 07:51:53 defiant kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000018
Dec 17 07:51:53 defiant kernel:  printing eip:
Dec 17 07:51:53 defiant kernel: c01589d9
Dec 17 07:51:53 defiant kernel: *pde = 00000000
Dec 17 07:51:53 defiant kernel: Oops: 0002
Dec 17 07:51:53 defiant kernel: CPU:    0
Dec 17 07:51:53 defiant kernel: EIP:    0010:[devfs_open+121/384]   
Tainted: P 
Dec 17 07:51:53 defiant kernel: EFLAGS: 00010286
Dec 17 07:51:53 defiant kernel: eax: 00000000   ebx: c1a65240   ecx:
dc144cc0   edx: c0267e00
Dec 17 07:51:53 defiant kernel: esi: 00000000   edi: c1a65244   ebp:
e7730100   esp: dade1f40
Dec 17 07:51:53 defiant kernel: ds: 0018   es: 0018   ss: 0018
Dec 17 07:51:53 defiant kernel: Process vgremove (pid: 956,
stackpage=dade1000)
Dec 17 07:51:53 defiant kernel: Stack: dc144cc0 e7730100 00000000
e7fea380 c025d7a0 c0130111 e7730100 dc144cc0 
Dec 17 07:51:53 defiant kernel:        bffffabc e34a1000 00000001
bffffabc c0130022 e7734940 e7fea380 00000001 
Dec 17 07:51:53 defiant kernel:        00000004 e34a1000 080525b8
e7734940 e7fea380 080525b8 bffffabc 00000000 
Dec 17 07:51:53 defiant kernel: Call Trace: [dentry_open+225/400]
[filp_open+82/96] [sys_open+54/160] [system_call+51/56] 
Dec 17 07:51:53 defiant kernel: 
Dec 17 07:51:53 defiant kernel: Code: 89 50 18 eb 2c 89 f6 8b 47 08 85
c0 74 1a 8b 10 85 d2 74 14 

 
> You could also have IDE controller or DMA problems. "Hardware"
> doesn't just mean disk drives. If you have multiple controllers,
> try switching the drives between them and see if that changes
> the result.

Originally, I had the drives on one IDE channel (hda and hdb) and the
DVD and CDRW on another (hdc and hdd). I now have drive 1 on hda, dvd on
hdb, drive 2 on hdc and cdrw on hdd. Same indications.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
How should I know if it works?  That's what beta testers are for.  I
only coded it.
        -- Attributed to Linus Torvalds, somewhere in a posting
