From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020827203243.QSPO1165.imf22bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] invalid number of free physical extents
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
Date: Tue Aug 27 15:33:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

All,

I have a VG which I have used extensively for snapshot testing.

Now everytime I try to get a snapshot, it fails with error code 13

Per the man entry:

13 invalid number of free physical extents

I don't want to rebuild this VG because some of the other LVs on it have valid =
data.

Is there a lvm repair tool that might fix this for me.

Thanks,
Greg
=3D=3D=3D=3D=3D=3D
Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
