From: =?ISO-8859-1?Q?Trond_Eivind_Glomsr=F8d?= <teg@redhat.com>
Message-ID: <Pine.LNX.4.33.0112171205010.30369-100000@halden.devel.redhat.com>
MIME-Version: 1.0
ReSent-To: <Linux-LVM@sistina.com>
ReSent-Message-ID: <Pine.LNX.4.33.0112171214430.30439@halden.devel.redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Build bugs for lvm 1.0.1
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
Date: Mon Dec 17 11:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Linux-LVM-Bug@sistina.com

1) Trying to set group/user on install is evil. It shouldn't be the=20
   default, as this option will fail when you build as non-root =20

2) When using "--without-user --without-group", it tries to install with=20
   user/group of no/no. Needless to say, this fails.

3) It has prototypes of lseek64/basename which are incompatible with=20
   glibc. Use "-DGNU_SOURCE -O2" for CFLAGS and enjoy.

4) It shouldn't look in /usr/src/linux for the linux kernel sources -=20
   look at /lib/modules/`uname -r`/build. Also, the current running kerne=
l=20
   doesn't necesarrily (or for people who package it, almost certainly=20
   doesn't match) what you build it for. =20

--=20
Trond Eivind Glomsr=F8d
Red Hat, Inc.
