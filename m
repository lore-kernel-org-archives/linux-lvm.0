From: Andreas Gorf <estevesgorf@freenet.de>
Date: Sun, 09 Sep 2001 16:55:30 GMT
Message-ID: <20010909.16553000@host.domain.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problems with pvmove
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

I've followed the discussion started by =84fejf=93.

Indeed i have the same problem that pvmove exits with an error when i tr=
y=20
to
move PEs from one PV to another.

To exclude the possibility of a defect HD i tried to reproduce the error=
=20
on several
independent systems.

The error always occurs when i try to move a complete filled PV to=20
another. In this case all but the last
PE on this PV are moved. The last one isn't movable whatever i did.

If the PV wasn't filled at 100% everything goes fine.

To reproduce the error try the following:

- create a VG with three Pvs at the same size
- create a LV which covers the first PV completely and the second partly=

- try to all PEs from the first PV to the third - the error will occur
- move the moved PEs back to the first PV - everything goes fine
- try to move the PEs lying on the second PV to the third - everything=20
goes fine


...any ideas?


Andreas...
