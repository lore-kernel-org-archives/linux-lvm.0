From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] snapshots on shared fibre
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030328175337.IYQI10170.imf25bis.bellsouth.net@tiger2>
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
Date: Fri Mar 28 11:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  I have a Xiotech Magnitude raid, that uses fibre ports to connect to
 >>  multiple servers.=20

 >>  We do NOT use a SAN filesystem. What I am wondering is, can I use
 >>  snapshots that are mounted on 1 machine, where the original filesystem
 >>  is mounted on another machine. both machines are connected to the raid
 >>  via fibre.

 >>  My hope is that, since it is a second filesystem, and is readonly, this
 >>  operation will not cause problems..

 >>  Is this correct?


 >>  --=20
 >>  Matt Schillinger

Matt,

I'm no expert on LVM, but I would be very surprised if the above works.

You need both machines to see a single consistent view of the COW table.

The COW table is possibly modified every time the r/w server writes to its LV.

You really need the snapshot to be implemented in the raid unit itself.

Or you could have the first server export the snapshot via nfs.

Greg
--=20
Greg Freemyer
