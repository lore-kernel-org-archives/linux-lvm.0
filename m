Message-Id: <200112121616.fBCGGWg14769@ecdl.ecdl.hut.fi>
From: Mika Lansirinne <Mika.Lansirinne@ecdl.hut.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] loop devices?
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
Date: Wed Dec 12 10:17:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi all,

I was trying to use a loop device(s) for LVM. In the pvcreate man-page it=
 is=20
said that a PV can also be a loopback file. That also seem to work correc=
t.=20
But when I try to create a VG on that I get:

[root@arthur /tmp]# vgcreate tmpvg /dev/loop0
vgcreate -- no valid physical volumes in command line

Pvdisplay gives:

[root@arthur lib]# pvdisplay /dev/loop0
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physi=
cal=20
volume "/dev/loop0"

'pvdisplay -d /dev/loop0' gives in the end:
...
<22> pv_create_name_from_kdev_t -- CALLED with 7:0
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 3
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 22
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: (null)
<1> pv_read -- LEAVING with ret: -278
<1> lvm_error -- CALLED with: -278
<1> lvm_error -- LEAVING with: "pv_read(): pv_create_name_from_kdev_t"
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physi=
cal=20
volume "/dev/loop0"

So it looks like that pv_create_name_from_kdev_t has the correct input fo=
r=20
loop0, but lvm_dir_cache does not know anything about loop devices. (When=
 I=20
use disc partion for a PV, pv_create_name_from_kdev_t  leaves with a=20
correct device file name).


BTW, I'm using RH 7.2 and 2.4.16 kernel. I tried this on the two differen=
t=20
machines with the same results.

Has loop devices ever worked and has anybody actually used them?


For me being uninitiated it is a bit hard to understand why would lvm hav=
e to=20
guess (and fail) a device file name from its major and minor numbers in t=
he=20
first place when I just give that in the command line...


-Mika

P.S. Thank you for the good work otherwise

--=20
Mika L=E4nsirinne, System Manager / Research Engineer, M.Sc. (E.E.)
Helsinki University of Technology
Electronic Circuit Design Laboratory
P.O. Box 3000				Email: mla@ecdl.hut.fi
FIN-02015 HUT				Tel: +358 9 451 2277
Finland					Fax: +358 9 451 2269
