From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Summary - Snapshot Effort
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020826191353.ZAMY515.imf11bis.bellsouth.net@TAZ2>
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
Date: Mon Aug 26 14:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>linux-lvm@sistina.com

 >>  On Thu, Aug 22, 2002 at 05:43:42PM -0400, Greg Freemyer wrote:
 >>  > I have not been successful at getting reliable Read-Only snapshots
 >>  > of XFS via LVM.  Since XFS is being used in Enterprise quality
 >>  > applications, I suggest this is a major shortcoming that should be
 >>  > prioritized.

 >>  Have you tried LVM2 ?

 >>  - Joe

No I haven't. =20

Instead of trying a bunch of configs myself, I have decided to write a xfs/LVM =
snapshot regression module to add the xfs test suite. (They don't have one =
currently.)

Once that is done, I hope that a few different LVM configs can be tested. =20

Hopefully there are some pairings that work reliably together.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
