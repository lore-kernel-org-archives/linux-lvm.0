From: Jens Hoffrichter <joho@hausboot.org>
Message-ID: <20040202153506.GN5191@deepthought.hausboot.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Best practice for lvm on raid-5
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
Date: Mon Feb  2 10:36:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi everyone,

I have a LVM vg on top of a softraid 5 consisting of 3 80 GB harddrives.

Currently I have /dev/md0 as my only physical volume, but this will lead
to problems if I am going to expand the raid 5 by adding another 80 GB
harddrive to (as pvresize is not implemented again yet, as I understand).

What is the best practice in this case? To add a partition table on top
of /dev/md0 (but how is it represented in the /dev filesystem) and only
add single partitions as pvs to the vg?

I'm happy for every suggestion :)

CU all,
Jens
--=20
GPG: 1024D/CF884D50  F2E8 F7FC F823 6464 4E9D  EFAB 6EE9 8B9C CF88 4D50
------------------------------------------------------------------------
 Jens Hoffrichter / joho@hausboot.org / Joho@IRC / Fon: +43-650-5376989
 Wenn Du keine Kiefer sein kannst auf dem H=FCgel, sei ein Busch im Tal -=
=20
         aber sei der sch=F6nste kleine Busch am Ufer des Bachs.=20
             Sei ein Busch, wenn du kein Baum sein kannst.
       "Be the best you can be" (uebersetzt) von Douglas Malloch
