From: "William Blunn" <bill+f.20020307@tao-group.com>
Subject: Re: [linux-lvm] lvm redhat 7.2
Message-Id: <000501c1c679$6a135980$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000801c1c638$13c60fa0$6af5fd0c@attbi.com>
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
Date: Fri Mar  8 02:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I've installed lvm and recompiled the kernel to support LVM but I
> still don't see /proc/lvm and when I run vgscan I get vgscan -- LVM
> driver/module not loaded? I soft linked /usr/src/linux to the correct
> dir and configured it accordignly..lost
>=20
> What am I doing wrong?

Did you build the LVM as a module?

If you have LVM as a module, then check the following:

1. Presence of the module
(a) Did you build the kernel modules? "make modules"
(b) Did you install the kernel modules? "make modules_install"

2. Loading of the module. This is either:
(a) Explicitly loaded
    There should be a file on your system which lists modules which are
    loaded at startup. In general we use a distribution other than
    Red Hat so I can't help you with the specifics of your distribution.
    RTM.

or
(b) Implicity loaded
    Module is loaded on demand.

    (i)  You probably want the "kernel module loader" turned on in the
         kernel configuration.

    (ii) You need to configure the module loader appropriately. This
         probably only involves ensuring that the module name aliases
         are set up right.

         In the module name aliases you need:

         # The Logical Volume Manager uses these block and char numbers
         alias block-major-58 lvm-mod
         alias char-major-109 lvm-mod

         The module loading tools look in /etc/modules.conf for these
         module name aliases. On our systems that file is automatically
         generated, so we have to put these aliases somewhere else and
         use a tool to regenerate the file. Again I don't know what
         your distribution does. RTM.

Bill
--=20
William H. Blunn - <bill+s.20020307@tao-group.com>
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
