From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030516183147.OJLZ24149.imf23bis.bellsouth.net@tiger2>
Subject: [linux-lvm] Ensuring a LV does not move to a new PV?
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
Date: Fri May 16 13:29:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

I had a single hardware mirrored PV I have been using with 3 LVs on it.

I just added a JBOD PV to the VG for use with snapshot LVs.

Is there anything I need to do to ensure that the main LVs never add any PEs =
from the new PV?

i.e.
Are the existing LVs sparse?

And do new PEs get allocated as data is written to the LV?

If so, I can easily see PEs coming from the wrong PV.

Thanks
Greg
--=20
Greg Freemyer
 =20
