From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Max storage size per system
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030307200037.PHCQ1249.imf15bis.bellsouth.net@tiger2>
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
Date: Fri Mar  7 13:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  2 rotating parity disks ? Can you elaborate on how that works ?
 >>  I have thought about using something else than raid5, where you would
 >>  split the data across a number of disks, AND use a mirrored device for
 >>  storing the parity on.

I don't think it is the same as the above, but on Compaq ProLiants, they have =
Advanced Data Guard.

http://h18004.www1.hp.com/products/servers/proliantstorage/arraycontrollers/adg=
/

With it you define the number of data drives(D) you want, and the number of =
parity drives(P).

Obviously you need D + P drives, but no data is lost until you loose P+1 =
drives.

The negative is even worse performance than RAID 5, but it does make for =
greater reliability.

BTW: HP's (Compaq's) "low-end" FC array (MSA 1000) also support Advanced Data =
Guard.  IIRC their mid-tier and high-end lines don't.=20

Greg
