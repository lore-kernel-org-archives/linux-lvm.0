From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0212061232410.36766-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] vgchange -ay at boot?
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
Date: Fri Dec  6 12:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

ive got lvm install on a redhat linux 7.3 system. the LV's totally work,
except i always have to mount them after bootup. id like to be able to put
the mounts into /etc/fstab, but when i do, the kernel can't boot and
complains about trying to mount an unknown device. obviously it cant see
the device im trying to mount because the volume group is not activated.
so, i put vgchange -ay homevg in my /etc/rc.local file, but apparently
that happens after the mounting on bootup, because it still complains
about non-existant device.

how do i turn on the volume group before it mounts the devices on bootup?

thanks in advance!

alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
