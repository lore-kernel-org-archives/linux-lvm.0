Message-ID: <20010823011053.45493.qmail@web20310.mail.yahoo.com>
Date: Wed, 22 Aug 2001 18:10:53 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] segfault running vgscan
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

I've carefully followed the instructions in INSTALL
and the build seems to go fine.
This is the first install of lvm so there are no vgs
or pvs or anything yet.

I patched the kernel  (2.4.9)
installed the kernel
make in LVM
make install
reboot
run vgscan -d  

this just generates a segfault and dumps core


any idea what i'm doing wrong?
nothing recent with vgscan and segfault in the
archive...
LVM version 1.0.1-rc1(17/08/2001) 
is reported in  dmesg.

thanks!


brad

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
