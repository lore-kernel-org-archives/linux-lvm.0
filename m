Return-Path: <bcorsello@usa.net>
Message-ID: <20001217035948.24536.qmail@nw174.netaddress.usa.net>
Date: 16 Dec 00 22:59:48 EST
From: Brad Corsello <bcorsello@usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgextend segfaults (lvm 0.9, kernel test10)
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

> Something like this happens if you are using the latest code from CVS
> rather than the 0.9 branch.  Did you checkout the correct code ?

Well, I applied the following kernel patches:

linux-2.4.0-test10-VFS-lock.patch
lvm-0.9-2.4.0-test10.patch

and the RPM binaries (definately 0.9, and the code I built from CVS, both=

segfault on vgextend.

I see Chris Mason posted a patch for the kernel module on December 4.  Is=
 that
known to solve the problem?

I take it from your comment that the current CVS code is not the 0.9 code=
=2E  Is
that correct?

____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1
