Message-ID: <3F0D2788.76BB0BCB@in.ibm.com>
From: Sachin Sant <sachinp@in.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question on shared storage volumes.
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
Date: Thu Jul 10 03:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have a SCSI storage unit shared between two machines M1 and M2. On one
of the machine M1 i create a volume group HA_VG , create a LV vol1 and
filesystem using the LV vol1.

--- >vgcreate HA_VG /dev/sdd /dev/sde /dev/sdf
--- >lvcreate -i 3 -I 8 -L 100 -n vol1 HA_VG
--- >mkfs /dev/HA_VG/vol1
--- >mount /dev/HA_VG/vol1 /mnt

Now for some reason machine M1 dies and the VG is not exported. Using
the second machine M2 if i try to forcefully import the vg , vgimport
command coredumps.

--- >vgimport -f HA_VG /dev/sdd /dev/sde /dev/sdf
Segmentation fault

Should vgimport coredump here. I guess this is not the right way to
recove the VG . [ I can recover the VG on machine M2 using vgscan /
vgchange -a y HA_VG ]

I believe the problem might be with the following piece of code in
vgimport.c

strncpy ( vg_name_this,
          pv_this[0]->vg_name,
          strlen ( pv_this[0]->vg_name) - strlen ( EXPORTED));

Here the difference between strlen will be calculated as -1 in the above
senario.

May be the right way would be just print a error message instead of a
core dump.

Just let me know your thoughts. 

-Sachin
