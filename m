From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030429220328.XULC259.imf39bis.bellsouth.net@tiger2>
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
Date: Tue Apr 29 17:01:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  Now y'all can tell me that the Promise ATA RAID cards suck and I
 >>  shouldn't use them, and I should get a hardware RAID card, and so on
 >>  (as I saw happened to the person who described this issue in October
 >>  2002; see
 >>  http://lists.sistina.com/pipermail/linux-lvm/2002-October/012508.html
 >>  and
 >>  http://lists.sistina.com/pipermail/linux-lvm/2002-October/012516.html).

 >>  And I'll happily agree with you, but for two small facts:
 >>  - the hardware RAID cards cost more than twice what the drives cost, and
 >>  they're 120GB IDE drives with large caches; let alone SCSI hardware
 >>  RAID (which also increases the cost of the disks a lot too);

Just thought I would point out that a 2-channel 3ware card is about the price=20
of a single 80GB drive.  (i.e. $130 US)

I love the 3-ware cards and they are not cost prohibitive in my opinion.  My=20
only problem is I wish the failure/rebuild process was more automated than it =
currently is.

Obviously, LVM and MD should still work together regardless.

Greg
--=20
Greg Freemyer
