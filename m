Return-Path: <lembark@wrkhors.com>
Date: Sat, 30 Jun 2001 01:00:56 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Request for misalignment tests
Message-ID: <283820000.993880856@dizzy>
In-Reply-To: <20010627220501.J31129@jensbenecke.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

> -v /dev/YourPVname | grep "^ *00000"

- End of Original
# /lvm/sbin/vgdisplay -v vg00
--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable

<snip>

--- Physical volumes ---
PV Name (#)           /dev/scsi/host0/bus0/target0/lun0/part4 (1)
PV Status             available / allocatable
Total PE / Free PE    1557 / 1373

# /lvm/sbin/pvdisplay -v /dev/scsi/host0/bus0/target0/lun0/part4 | grep "^ *00000"
   00000 /lvm/vg00/lvol1           00000   6144
