Message-ID: <379B99D3.67007D3@thephaedo.com>
Date: Sun, 25 Jul 1999 23:12:20 +0000
From: "S. Ryan Quick" <ryan@thephaedo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Compile Problems (Thanks!)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Thanks everyone, I got it.

Turns out the Debian convention of using the debian.rules moniker and
relinking the header files for the kernel was
the problem.  I forced a rebuild of the include files (make_kpkg
kernel_source) as well as the installed kernel and
everything went like clockwork.   Already working with 2 vgs and now
playing with the resize functions.

Thanks . . .

Ryan

PS.  If anyone wants detailed information on the fix (it's all Debian's
slightly-odd control of header files) I can post it.
