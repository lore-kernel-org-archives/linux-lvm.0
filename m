content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <8075D5C3061B9441944E137377645118012E9B@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
Subject: [linux-lvm] Patching a kernel that already has VFS-lock
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
Date: Wed Mar 12 16:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Good day,

I'm trying to upgrade my kernel from LVM 1.0.3 to 1.0.7.  My kernel with
1.0.3 already has the VFS lock pactch installed and all I want to do is
upgrade the LVM code because my snapshots are misbehaving.  I should not
have to re-patch to get the VFS-lock to work should I?

The reason I ask is because when I just patch the kernel with LVM 1.0.7
and reboot all my VG's/LV's come up clean, and I can create snapshots
but the snapshots do not mount.  I get the:

mount: wrong fs type, bad option, bad superblock on /dev/flux1/snap,
       or too many mounted file systems

error which would indicate to me that the VFS lock is not working with
my ext3 filesystem.  Does anyone have any ideas on what could be causing
this problem? =20

Red Hat kernel source RPM 2.4.18-26
LVM 1.0.7 from the Sistina FTP site

If you need any additional information please let me know.

Thanks,
Andy.


Regards,
Andrew Rechenberg
Infrastructure Team, Sherman Financial Group
