From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] [RESOLVED] How do I delete a pv
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030516180457.SMPG3393.imf47bis.bellsouth.net@tiger2>
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
Date: Fri May 16 13:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

Sorry about the noise.

I used dd to zero out the first meg of /dev/sda3 and then redo everything.

Thanks
Greg

 >>  I moved some disks around.

 >>  I now have a pv (/dev/sda3) that thinks it is part of a VG, but it really
 >>  isn't.

 >>  How can I re-initialize it so I can really add it to a VG?

 >>  An unrelated question.  Do LVs ever move around on there own, or only
 >>  explicitly requested to?

 >>  Thanks
 >>  Greg
 >>  --=20
 >>  Greg Freemyer
 >> =20

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
