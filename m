content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC26B3B5@blr-m3-msg.wipro.com>
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
Subject: [linux-lvm] RE: doubt regarding SMP compliance and mirroring
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
Date: Sat May 10 08:37:55 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: mauelshagen@sistina.com

Hi all,
=09
	I have few doubts and wanted to clarify the same.

1) Is the LVM2/device-mapper code fully SMP aware?

2) Is the VGDA data written to all PVs ? ( I mean to say do all the PVs
have the same VGDA data?).

I got this doubt because I was thinking of a scenario where we have a
shared disk, shared between two nodes. If one of the nodes (say node1)
is reading from the same (logical) volume while the other node(node 2)
is changing the (logical) volume attributes, will the content of the
buffer cache of the node1 not be stale. ( I believe currently a node
does not scan for VGDA before all I/O and believes its in-memory copy to
be uptodate always, Please correct me if I am wrong).

3) In case node 1 is doing I/O to a different volume which is in a
particular volume group, will the changes be written into the PVs of
other logical volumes of the same volume group also.


Thanks for the help,
Sharad.
