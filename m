From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] e2fsadm and snapshots?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021105172624.QSMY10479.imf26bis.bellsouth.net@TAZ2>
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
Date: Tue Nov  5 11:25:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

=20
 >>  I would suggest putting your snapshot LV onto a separate disk and see how
 >>  that does.

 >>  Cheers, Andreas
 >>  --
 >>  Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
 >>  \  would they cancel out, leaving him still hungry?"
 >>  http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert


Can that be done?

I thought the snapshot LV had to share the same VG/PV as the base LV.

Is there some way to force the snapshot on to separate physical drives.

In my case, I have 2 RAID-1 drives (3ware hardware based) that I snapshot every =
night.

If I could force the issue, I would consider putting in a 3rd drive dedicated =
to holding the snapshot.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
