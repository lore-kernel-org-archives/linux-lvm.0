Return-Path: <austin@coremetrics.com>
Date: Thu, 24 May 2001 21:46:11 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Message-ID: <Pine.LNX.4.33.0105242142530.6231-100000@UberGeek.coremetrics.com>
MIME-Version: 1.0
Subject: [linux-lvm] EMC Storage + LVM + XFS
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

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
