From: "Karol Pietrzak" <noodlez84@earthlink.net>
Date: Sun, 30 Sep 2001 22:10:10 -0400
MIME-Version: 1.0
Content-transfer-encoding: 7BIT
Message-ID: <3BB79842.19367.155911@localhost>
Subject: [linux-lvm] rc2-patched linux 2.4.10
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
To: linux-lvm@sistina.com

Hello.
I downloaded, compiled, and installed lvm 1.0.1rc2 (an FHS-
complaint RPM of which is available @ 
http://home.earthlink.net/~noodlez84/rpm_packages.html ).  I 
also created a patch to linux 2.4.10 by going into PATCHES/ and 
doing 'make'.  I applied the patch; it went flawlessly.  
However, once  I started compiling the kernel, I got this:

make -C md modules
make[2]: Entering directory `/tmp/linux/drivers/md'
make[2]: *** No rule to make target `lvm-snap.h', needed by 
`lvm.o'.  Stop.
make[2]: Leaving directory `/tmp/linux/drivers/md'
make[1]: *** [_modsubdir_md] Error 2
make[1]: Leaving directory `/tmp/linux/drivers'
make: *** [_mod_drivers] Error 2

I checked the September archives to check whether the problem 
was solved, but it didn't seem like it was.  I guess one more 
report that rc2 and patched-2.4.10 don't work together doesn't 
hurt. :)

I'm using SuSE 7.2, meaning I'm using glibc 2.2.2 and gcc 
2.95.3.
--
noodlez:   Karol Pietrzak
PGP KeyID: 0x3A1446A0
