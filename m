Message-ID: <20040203173119.17166.qmail@web9605.mail.yahoo.com>
From: Mircea Stanescu <mirceast@yahoo.com>
In-Reply-To: <20040203181102.14519.30373.Mailman@hermes.sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] Red Hat Advanced Server 2.1 - LVM 1.0.8
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
Date: Tue Feb  3 12:33:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
i try upgrade the LVM to 1.0.8 version with Red Hat
Advanced Server 2.1 and curent version of the kernel
source kernel-source-2.4.9-e.35 .
The hardware is an ibm x345 sserver with Serveraid 6
chipset 
I want to use the lvm as module .
After Patching the kernel and compile i try to use 
this new module lvm-mod .
I encountered 3 error :
lvm-mod.o: unresolved symbol alloc_kiovec
lvm-mod.o: unresolved symbol gendisk_head
lvm-mod.0: unresolved symbol free_kiovec
Of course i resolv with alloc_kiove free_kiovec with
the ouput of the compiler was clear and cannot solve
the problem with "unresolved symbol gendisk_head "
The ouput of the compiler was 
lvm.c:439: warning: static declaration for
`add_gendisk_Rsmp_8afbb461' follows non-static
lvm.c:457: warning: static declaration for
`del_gendisk_Rsmp_f58c61d8' follows non-static
I know the Red Hat don't support LVm on this
distribution but what are tthe cause of the error and 
how to correct this .
Thank to any suggestion ,
Mircea 


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
