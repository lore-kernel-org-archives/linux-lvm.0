Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16qq4l-0005yF-00@hermes.sistina.com>
Subject: [linux-lvm] Having trouble compiling CVS
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
Date: Fri Mar 29 00:42:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

I'm having trouble with compiling the tools in the CVS for LVM.  The compile 
dies with the following error:  make[2]: *** No rule to make target 
`tools.h', needed by `e2fsadm.c'.  Stop.

I have grep'ed the mailing list and have not found anything.

CVS was obtained at: 20020329-1334 or 03:34 GMT

What other information do I need to supply?

The full make listing is as follows:

ln -sf liblvm-1.0.4-10.so.1.1 liblvm-1.0.4-10.so.1
ln -sf liblvm-1.0.4-10.so.1.1 liblvm-1.0.4-10.so

Done Library parts

make[3]: Leaving directory `/usr/src/LVM/tools/lib'
make[2]: Leaving directory `/usr/src/LVM/tools/lib'
make[2]: Entering directory `/usr/src/LVM/tools/man8'
make[3]: Entering directory `/usr/src/LVM/tools/man8'
make[3]: Leaving directory `/usr/src/LVM/tools/man8'
make[2]: Leaving directory `/usr/src/LVM/tools/man8'
make[2]: Entering directory `/usr/src/LVM/tools'
make[2]: *** No rule to make target `tools.h', needed by `e2fsadm.c'.  Stop.
make[2]: Leaving directory `/usr/src/LVM/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/LVM/tools'
make[1]: Entering directory `/usr/src/LVM'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/src/LVM'
make: *** [all] Error 2

-- 
Adrian Head

(Public Key available on request.)
