Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31IIMj25650
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 13:18:22 -0500
MIME-Version: 1.0
Message-ID: <OF8E4F7063.48463408-ON00256E65.0063CD52-00256E68.003DF782@svunta.os.is>
From: Kjartan Reynir Hauksson <krh@os.is>
Date: Wed, 31 Mar 2004 11:06:42 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 003DF77400256E68_="
Subject: [linux-lvm] Re: 2.4.25, migration to lvm2 and paranoia
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format...

--=_alternative 003DF77400256E68_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'll just tag along with you since we're both facing the same problem.

I've written earlier on the same subject but never got it resolved so I'm=
=20
going to give it another go since my desktop constantly stalls on me with=
=20
my 2.4 kernel.  I'm now running MDK 10.0 with=20
kernel24-tmp-2.4.25-2.tmp.1mdk rpm package from Thomas Backlund.  This=20
kernel seems to get me a bit further then my previous attempts since it=20
boots a dm enabled kernel (I don't know which lvm I'm running 1 or 2=20
though, I'm assuming 1 because it tells me it shuts down lvm1 when i halt=
=20
my system). Now according to the LVM2 faq I am supposed to edit the lvm=20
start sequence in my startup script. I assume that the startup script=20
being reffered to is /etc/rc.sysinit and currently looks like this:

# LVM initialization
if [ -f /etc/lvm/lvm.conf -a -x /sbin/lvm2 ]; then
    grep -q -s 'device-mapper' /proc/devices /proc/misc || modprobe dm-mod=
=20
>/dev/null 2>&1

    if grep -q -s 'device-mapper' /proc/devices /proc/misc; then
        if [ -c /dev/.devfsd ]; then
            _vgscan_cmd=3D/bin/true
        else
            _vgscan_cmd=3D"/sbin/lvm2 vgmknodes"
        fi
        _vgchange_cmd=3D"/sbin/lvm2 vgchange -a y"
    fi
fi

if [ -z "${_vgscan_cmd}" -a -f /etc/lvmtab ] ; then
    [ -e /proc/lvm ] || modprobe lvm-mod >/dev/null 2>&1

    if [ -e /proc/lvm -a -x /sbin/lvm1-vgchange ]; then
        _vgscan_cmd=3D"/sbin/lvm1-vgscan"
        _vgchange_cmd=3D"/sbin/lvm1-vgchange -a y"
    elif [ -e /proc/lvm -a -x /sbin/vgchange ]; then
        _vgscan_cmd=3D"/sbin/vgscan"                      will read=20
'_vgscan_cmd=3D"/sbin/devmap_mknod.sh; /sbin/vgscan" after edit.
        _vgchange_cmd=3D"/sbin/vgchange -a y"
    fi
fi
=20
if [ -n "${_vgscan_cmd}" ]; then
    action "Setting up Logical Volume Management:" ${_vgscan_cmd} &&=20
${_vgchange_cmd}
fi=20

Let me know if the edit is correct so I don't hose my system.

Now after this I reboot the system and should be running lvm2 and can then=
=20
reboot into Backlund's kernel-tmp-2.6.4-1.tmb.5.mdk-1-1mdk right ?
Do I have to create a new initrd image ?
Do I understand the process correctly or am I about to mess everything up=
=20
? Please let me know.

Regards
-Kjartan Reynir Hauksson

---------------------------------------------------------------------------=
------------------------
Kjartan Reynir Hauksson
Kerfisstj=F3ri=20
Orkustofnun
S=EDmi: 569-6027/863-5912
e-mail: krh@os.is
---------------------------------------------------------------------------=
-----------------------

http://www.os.is/disclaimer.html
--=_alternative 003DF77400256E68_=--
