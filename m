Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] lvm2 device mapper
Message-ID: <CEADF0D83077F7458B763904E47AA709BD67@exchange.neokimia.com>
From: "Yanick Quirion" <yanick.quirion@neokimia.com>
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
Date: Wed Dec 10 08:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

Did you compile device mapper as a module or into the kernel?

Here I have compile them into the kernel directly. You must add this =
line into your /etc/modules.conf:

post-install dm-mod /etc/rc.d/init.d/devmap_mknod.sh

And the script /etc/rc.d/init.d/devmap_mknod.sh is next:

#! /bin/sh

# Startup script to create the device-mapper control device
# on non-devfs systems.
# Non-zero exit status indicates failure.

# These must correspond to the definitions in device-mapper.h and dm.h
DM_DIR=3D"mapper"
DM_NAME=3D"device-mapper"

set -e

DIR=3D"/dev/$DM_DIR"
CONTROL=3D"$DIR/control"

# Check for devfs, procfs
if test -e /dev/.devfsd ; then
        echo "devfs detected: devmap_mknod.sh script not required."
        exit
fi

if test ! -e /proc/devices ; then
        echo "procfs not found: please create $CONTROL manually."
        exit 1
fi

# Get major, minor, and mknod
MAJOR=3D$(sed -n 's/^ *\([0-9]\+\) \+misc$/\1/p' /proc/devices)
MINOR=3D$(sed -n "s/^ *\([0-9]\+\) \+$DM_NAME\$/\1/p" /proc/misc)

if test -z "$MAJOR" -o -z "$MINOR" ; then
        echo "$DM_NAME kernel module not loaded: can't create $CONTROL."
        exit 1
fi

mkdir -p --mode=3D755 $DIR
test -e $CONTROL && rm -f $CONTROL

echo "Creating $CONTROL character device with major:$MAJOR =
minor:$MINOR."
mknod --mode=3D600 $CONTROL c $MAJOR $MINOR

With that everything works fine. If you use them as a module, I'm not =
sure, but I think that you will have to add it into your rc.local, or =
create a startup script for devmap_mknod.sh, but I'm not really sure =
about that.

Hope this will help.

Regards,

Yanick Quirion


-----Original Message-----
From: Salil Taneja, Noida [mailto:salilt@noida.hcltech.com]=20
Sent: 10 December, 2003 02:13
To: 'linux-lvm@sistina.com'
Cc: Salil Taneja, Noida
Subject: [linux-lvm] lvm2 device mapper

hi,
=A0
I am using LVM2 , version -2.00.07 with device mapper library -1.00.07 =
on 2.6.0 test-9 kernel
=A0
i am facing these problems while doing so : -
=A0
1.) i get a warning message
=A0=A0=A0=A0"=A0/dev/mapper/control : open failed : No such file or =
directory .
=A0=A0=A0=A0=A0=A0=A0Is device mapper mapped to kernel ? "
=A0
To overcome this=A0problem I started using LVM2 commands =A0 with =
--driverloaded n option .
=A0
now the commands execute but i face another problem :-
2.) when using lvcreate or vgcreate, the command executes but no node =
entry is created =A0in the /dev/ directory
For eg :
=A0
I used the following command :
=A0=A0=A0 lvcreate < options > -n lvm1 vg1 --driverloaded n
=A0
to verify this i used lvdisplay that gives the path of lvm1 as =
/dev/vg1/lvm1 ; but when i check in /dev/ directory there is no entry =
corresponding to vg1 or lvm1 .
=A0
Why isnt there any node corresoponding to vg1 or lvm1 in /dev/ ?=A0 any =
clues...?????
=A0
=A0
Please suggest some nice solutions .
=A0
Thanks and Regards,=20
Salil Taneja=20
HCLT NetCentric Division,=20
A11, Sector 16,=20
Noida, India.=20
  office: +91-120-2510701 Ext 3155=20
  cell: +91-9810250247=20

=A0
