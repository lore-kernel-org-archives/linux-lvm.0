From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030703165707.LXFV15998.imf16aec.bellsouth.net@tiger2>
Subject: [linux-lvm] What command do I use to make a PV active?
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
Date: Thu Jul  3 11:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

=20
Somehow I inactived a PV

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda3" of VG "TruStore-Data" [53.63 GB / 48.63 GB =
free]
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "TruStore-Data" [74.54 GB / 13.54 GB =
free]
pvscan -- total: 2 [128.19 GB] / in use: 2 [128.19 GB] / in no VG: 0 [0]

What command do I use to make it active?

Thanks
Greg
--=20
Greg Freemyer
