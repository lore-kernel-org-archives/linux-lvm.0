Message-ID: <20020522124620.25273.qmail@sina.com>
From: lysindybear <lysindybear@sina.com>
Subject: Re: Re: [linux-lvm] (no subject)
MIME-Version: 1.0
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
Date: Wed May 22 07:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@sistina.com

>On Wed, May 22, 2002 at 07:54:53PM +0800, lysindybear wrote:
>> I am modifying the lvm source file,I want to make lvm as module instead into kernel,but the compiler tell me something wrong,can 
>> someboby tell me what I should modify in the source file? thanks
>
>Just change the LVM option in the kernel to build as a module.  No
>need to change source.
>
>- Joe

yes i know this,i've change the config file and use make modules command,below is the error message:

some explaination : I've write a new file named raidde.c,i want to compile it as a module,i compile it into kernel before,but it waste too much time to compile to debug,so i want to compile it as a module 

make[2]: Entering directory `/usr/src/linux-2.4.2/drivers/md'
gcc -D__KERNEL__ -I/usr/src/linux-2.4/include -Wall -Wstrict-prototypes -O2 -fom
it-frame-pointer -fno-strict-aliasing -fno-common -Wno-unused -pipe -mpreferred-
stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include /usr/src/linux-2.4/
include/linux/modversions.h   -c -o raidde.o raidde.c
In file included from /usr/src/linux-2.4/include/linux/spinlock.h:35,
                 from /usr/src/linux-2.4/include/linux/module.h:11,
                 from raidde.c:17:
/usr/src/linux-2.4/include/asm/spinlock.h:8: nondigits in number and not hexadec
imal
/usr/src/linux-2.4/include/asm/spinlock.h:8: nondigits in number and not hexadec
imal
/usr/src/linux-2.4/include/asm/spinlock.h:8: parse error before `1b7d4074'
/usr/src/linux-2.4/include/asm/spinlock.h:9: `printk_R_ver_str' declared as func
tion returning a function
/usr/src/linux-2.4/include/asm/spinlock.h:9: warning: function declaration isn't
 a prototype
In file included from raidde.c:17:
/usr/src/linux-2.4/include/linux/module.h:173: nondigits in number and not hexad
ecimal
/usr/src/linux-2.4/include/linux/module.h:173: nondigits in number and not hexad
ecimal
/usr/src/linux-2.4/include/linux/module.h:173: nondigits in number and not hexad
ecimal
/usr/src/linux-2.4/include/linux/module.h:173: nondigits in number and not hexad
ecimal����������������
����������������
����������������
something like this

______________________________________

===================================================================
������ѵ������� (http://mail.sina.com.cn)
���˷�����Ϣ�������г���һ�ߣ��ó���ʱ�ͳ��֣� (http://classad.sina.com.cn/2shou/)
