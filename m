Date: Tue, 22 Jun 1999 17:22:19 -0700
From: "George Nicolaou" <gnicolao@my-deja.com>
Message-ID: <ENJGHHKIMLNCBAAA@my-deja.com>
Mime-Version: 1.0
Subject: [linux-lvm] Compiling LVM 0.6 on Redhat 6.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi all,
  I have just found LVM and attempting to install it on a newly installed headhat 6 box. When compiling I get the following error:

Using the static LVM Library
make[2]: *** No rule to make target `/usr/local/src/LVM/0.6/tools/lib/liblvm.a', needed by `e2fsadm'.  Stop.
make[2]: Leaving directory /usr/local/src/LVM/0.6/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory '/usr/local/src/LVM/0.6/tools'
make: *** [all] Error 2

Using XLINKER
make[1]: Entering directory `/usr/local/src/LVM/0.6/tools'
cc  -L/usr/local/src/LVM/0.6/tools/lib -Xlinker -rpath /usr/local/src/LVM/0.6/to
ols/lib -Xlinker -rpath /lib -Xlinker -rpath /usr/lib -llvm -o e2fsadm e2fsadm.o

/usr/bin/ld: cannot open -llvm: No such file or directory
collect2: ld returned 1 exit status
make[1]: *** [e2fsadm] Error 1
make[1]: Leaving directory `/usr/local/src/LVM/0.6/tools'
make: *** [all] Error 2


Can someone please shead some light on this error.

Cheers
George



--== Sent via Deja.com http://www.deja.com/ ==--
Share what you know. Learn what you don't.
