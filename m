Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31IOFj27704
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 13:24:15 -0500
Message-ID: <OF12DEDDF3.CC314224-ON00256E65.005D8012-00256E65.00647CD5@svunta.os.is>
From: Kjartan Reynir Hauksson <krh@os.is>
Date: Sun, 28 Mar 2004 18:17:35 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Migrate to kernel 2.6 and lvm2 with root fs on lvm1
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com





I've written earlier on the same subject but never got it resolved so I'm
going to give it another go since my desktop constantly stalls on me with
my 2.4 kernel.  I'm now running MDK 10.0 with
kernel24-tmp-2.4.25-2.tmp.1mdk rpm package from Thomas Backlund.  This
kernel seems to get me a bit further then my previous attempts since it
boots a dm enabled kernel (I don't know which lvm I'm running 1 or 2
though, I'm assuming 1 because it tells me it shuts down lvm1 when i halt
my system). Now according to the LVM2 faq I am supposed to edit the lvm
start sequence in my startup script. I assume that the startup script being
reffered to is /etc/rc.sysinit and currently looks like this:

# LVM initialization
if [ -f /etc/lvm/lvm.conf -a -x /sbin/lvm2 ]; then
    grep -q -s 'device-mapper' /proc/devices /proc/misc || modprobe dm-mod
>/dev/null 2>&1

    if grep -q -s 'device-mapper' /proc/devices /proc/misc; then
        if [ -c /dev/.devfsd ]; then
            _vgscan_cmd=/bin/true
        else
            _vgscan_cmd="/sbin/lvm2 vgmknodes"
        fi
        _vgchange_cmd="/sbin/lvm2 vgchange -a y"
    fi
fi

if [ -z "${_vgscan_cmd}" -a -f /etc/lvmtab ] ; then
    [ -e /proc/lvm ] || modprobe lvm-mod >/dev/null 2>&1

    if [ -e /proc/lvm -a -x /sbin/lvm1-vgchange ]; then
        _vgscan_cmd="/sbin/lvm1-vgscan"
        _vgchange_cmd="/sbin/lvm1-vgchange -a y"
    elif [ -e /proc/lvm -a -x /sbin/vgchange ]; then
        _vgscan_cmd="/sbin/vgscan"              will read
'_vgscan_cmd="/sbin/devmap_mknod.sh; /sbin/vgscan" after edit.
        _vgchange_cmd="/sbin/vgchange -a y"
    fi
fi

if [ -n "${_vgscan_cmd}" ]; then
    action "Setting up Logical Volume Management:" ${_vgscan_cmd} &&
${_vgchange_cmd}
fi

Let me know if the edit is correct so I don't hose my system.

Now after this I reboot the system and should be running lvm2 and can then
reboot into Backlund's kernel-tmp-2.6.4-1.tmb.5.mdk-1-1mdk right ?
Do I have to create a new initrd image ?
Do I understand the process correctly or am I about to mess everything up ?
Please let me know.

Regards
-Kjartan Reynir Hauksson

---------------------------------------------------------------------------------------------------

Kjartan Reynir Hauksson
Kerfisstj�ri
Orkustofnun
S�mi: 569-6027/863-5912
e-mail: krh@os.is
--------------------------------------------------------------------------------------------------


http://www.os.is/disclaimer.html
