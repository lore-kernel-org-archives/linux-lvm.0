Return-Path: <chip.christian@storageapps.com>
Message-ID: <23D04BDBA646D411BDDD00D0B774B539028C894A@SA-BWMAIL1>
From: "Christian, Chip" <chip.christian@storageapps.com>
Subject: RE: [linux-lvm] EMC Storage + LVM + XFS
Date: Fri, 25 May 2001 09:30:48 -0400
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

You could play games with chains of:
	echo 'scsi-remove-single-device 1 0 0 2' >/proc/scsi/scsi
	echo 'scsi-add-single-device 1 0 0 1' >/proc/scsi/scsi
to get them to line up how you want.

You could use devfs and access your devices through
/dev/sd/...

On RedHat, at least, apparently you can use kudzu to do it (though I don't know how, not having explored this option).

-----Original Message-----
From: Austin Gonyou [mailto:austin@coremetrics.com]
Sent: Thursday, May 24, 2001 22:46
To: linux-lvm@sistina.com
Subject: [linux-lvm] EMC Storage + LVM + XFS


I have a potential dilemma, and I'd like some feedback for those who might
be able to give it. If I have say 2-4 Fibre HBAs connected to an EMC
Symmetrix say 3930, and I create volumes, then disks are added some of
which who's LUN value is lower than disks already in the system, wouldn't
that cause all my sd values to change and move? I know if I add a scsi
disk into a LAS array that happens. So if this does happen, what's a good
procedure for recovering from it and making sure all my volumes are ok?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
