From: John DeFranco <defranco@cup.hp.com>
Subject: RE: [linux-lvm] Support for RedHat AS2.1? 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200210310908.41122.defranco@cup.hp.com>
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
Date: Thu Oct 31 11:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi, thanks for the reply. See comments below.

>On Mon, Oct 28, 2002 at 10:43:40AM -0700, John DeFranco wrote:
>>I see on the Sistina web page that LVM is supported on RedHat Advanced 
Server 
>>2.1. So I have a couple of questions:
>>
>>2. Which redhat kernel errata (2.4.9-e.3 and/or 2.4.9-e.8)?
>latest (if that kernel can be called recent) is 2.4.9-e.9
>
>>3. I did try to apply the 1.0.6 version on the 2.4.9-e.3 kernel I got a 
>>couple 
>>of patch installation errors (Makefile and lvm-snap.c was missing). Are 
>>these 
>>expected? I cannot find any other directions that are specific to AS2.1. Are 
>>there any others?
>anyway standard lvm patch process supposes you have a stock kernel, and
>AFAIR that was the only setup supported by sistina (feel free to correct
>me if i am wrong).

From previous conversations I know that Sistina only claimed support for stock 
kernels and that in some cases on distros like redhat we were somewhat (term 
used loosely) on our own. 

However in the latest lvm datasheet it specifically claims support for redhat 
and in particular Advanced Server 2.1. I don't believe this was ever true 
before. 

>
>i expected a difference in makefile lvm-mod-objs should be correct on rh
>kernels (read the reject and the original and see for yourself)
>and lvm-snap.h (not .c) has also been removed.
>the rest of the patch is more or less a diff between your current lvm
>files and those in LVM/1.0.6/kernel
>so you can ignore those.

So what you've said above is pretty much what I've done. I have build lvm as a 
module and when I do the modules_install I get:

if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.9-e.9custom; fi
depmod: *** Unresolved symbols in 
/lib/modules/2.4.9-e.9custom/kernel/drivers/md/lvm-mod.o
depmod:         alloc_kiovec
depmod:         gendisk_head
depmod:         free_kiovec
make: *** [_modinst_post] Error 1
[root@jack linux-2.4]# 

This has been the case on all rh 2.4.9 based kernels that I've tried to 
install lvm on, no matter which lvm version (1.x).

-- 
==========
Cheers
   -jdf
