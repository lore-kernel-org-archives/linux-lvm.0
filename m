Return-Path: <jspies@maties.sun.ac.za>
From: Johann Spies <jspies@maties.sun.ac.za>
Date: 28 Jun 2001 16:18:10 +0000
Message-ID: <87d77oefy5.fsf@#maties.sun.ac.za>
MIME-Version: 1.0
Subject: [linux-lvm] Problem installing lvm
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

I am trying to install lvm_0.9.1_beta7 on a machine with a 2.4.5
kernel.

After following the instructions in LVM/0.9.1_beta7/PATCHES/README a
patch was created: lvm-0.9.1_beta7-2.4.5.patch

I patched the kernel with it and then tried to recompile the kernel.
The process ended with:
------------------------
/usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `__update_hardblocksize':
drivers/md/mddev.o(.text+0xcec1): undefined reference to `get_hardblocksize'
drivers/md/mddev.o(.text+0xcf0d): undefined reference to `get_hardblocksize'
make: *** [vmlinux] Error 1

I hope you can help me to get this right.

Regards.

Johann
-- 
Johann Spies
Informasietegnologie
Universiteit van Stellenbosch

     "The Spirit of the Lord is upon me, because he hath 
      anointed me to preach the gospel to the poor; he hath 
      sent me to heal the brokenhearted, to preach  
      deliverance to the captives, and recovering of sight 
      to the blind, to set at liberty them that are  
      bruised..."         Luke 4:18 
