content-class: urn:content-classes:message
Subject: RE: [linux-lvm] determining lv from mount point 
Message-ID: <2D4B6CD74137D4119A1100104BC6BCBF0BC585CF@dubntex006.qwest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: "Montgomery, Kendal L" <kendal.montgomery@qwest.com>
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
Date: Tue Sep 23 16:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well.. The reason I say to do it this way is because lvdisplay doesn't
seem to give an "error" code on return (it's always 0) when it's not a
logical volume.  It does display an error message that you'd have to
parse the output for a specific error message.

This should work for LVM, but not sure about LVM2 because I haven't
personally had a chance to play with it. It may work for both, but I'm
not sure.

Kendal.

-----Original Message-----
From: Galen Seitz [mailto:galens@seitzassoc.com]=20
Sent: Tuesday, September 23, 2003 5:20 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] determining lv from mount point=20



Montgomery, Kendal L <kendal.montgomery@qwest.com> wrote:

>=20
> DEVICE=3D$(df ${1} | grep -v ^Filesystem | awk '{ print $1 }')
>=20
> lvscan | grep ${DEVICE} > /dev/null 2>&1

Is using lvscan preferable to something like this
lvdisplay ${DEVICE} > /dev/null 2>&1

I'm currently using LVM, not LVM2 (sorry, I should have said that in the
first message).  Will this method work for LVM2 as well?

thanks,
galen
=20

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
