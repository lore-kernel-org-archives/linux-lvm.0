From: Frank =?iso-8859-1?Q?Matthie=DF?= <Frank.Matthiess_NOSpam@Microdata-POS.de>
Message-ID: <20020812090255.GC30185@microdata-pos.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] How to activate a vg or lv with same name as active one
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
Date: Mon Aug 12 04:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello there,

i want to backup a disk which make some strange noise. The problem is
that the volumegroupname (vg_sys) and the logical volumes (lv_home,
lv_usr, lv_var) are already active and in use by the running system.
The weak disk was remove from my home system and attach to a company
system with a backup solution.

My first idea ist to rename the the inactive volume group vg_sys to
vg_backup. But the man page told me that the vg must be active.

Seconf idea is to rename the lv's, but this is the same problem, isn't
it?

How to solve this problem and to get the inactive vg active to mount the
lv's on it?

--=20
Frank Matthie=EF=BF=BD                                          fm@Microdat=
a-pos.de
