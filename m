Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Date: Sat, 16 Dec 2000 16:19:02 +0100
MIME-Version: 1.0
Message-Id: <00121616190202.10070@lyta>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Make doesn't abort on error
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

ln -s liblvm.so.0.8final liblvm.so
ln: `liblvm.so': File exists
make[4]: *** [liblvm.so.0.8final] Error 1
make[4]: Leaving directory `/home/rjc/debian/LVM/lvm-0.8.1-0/tools/lib'
make[3]: *** [all] Error 2
make[3]: Leaving directory `/home/rjc/debian/LVM/lvm-0.8.1-0/tools/lib'
make[3]: Entering directory `/home/rjc/debian/LVM/lvm-0.8.1-0/tools/man8'
make[4]: Entering directory `/home/rjc/debian/LVM/lvm-0.8.1-0/tools/man8'

Above is the error condition that make isn't detecting.  I've changed the=
=20
makefiles to use sonames so I can have multiple versions installed with e=
ase=20
(I'll send the patch here when it's working - hopefully within 24 hours=20
otherwise maybe after Christmas).

Below is the code from make.tmpl.  For some reason when the "make -c=20
tools/lib all" fails it doesn't result in compilation aborting.  Perhaps=20
someone who knows make and shell scripting better than I can advise...

all:
        @for d in $(SUBDIRS); \
         do \
            if [ "$$d" =3D "." ]; \
            then \
               $(MAKE) all_this; \
            else \
               $(MAKE) -C $$d all; \
            fi; \
         done



--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
