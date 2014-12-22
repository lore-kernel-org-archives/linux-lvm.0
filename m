Date: Tue, 23 Dec 2014 00:19:29 +0100
From: Matej Cepl <mcepl@cepl.eu>
Message-ID: <20141222231928.GA29344@sh-el6.eng.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Messed up metadata for thin pool?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hi,

I am using RHEL-7 for my day-to-day work and I have been playing with
thinp for my data (nobody warned me that having root on thinp is
probably a bad idea). I haven't noticed that I have used up all my
metadata space, so I have ended with LVM misbehaving, xfs corrupted, all
good stuff (/var/log/messages is on
https://luther.ceplovi.cz/dav/xfs_logs/messages.gz). I have tried to
recover the thinp following
http://man7.org/linux/man-pages/man7/lvmthin.7.html but although I have
added 112MB to metadata after running lvconvret --repair, and some
restarts, I have got this mess
https://luther.ceplovi.cz/dav/lvs-a-o-devices.txt and

a) vgchange -a y fails with

    Check of pool rhel/pool00 failed (status:1). Manual repair required!
    2 logical volume(s) in volume group "rhel" now active.

b) another lvconvert --repair ends with
   =20
    Internal error: Missing allocatable pvs.

c) thin_check /dev/mapper/rhel-pool00_tdata fails with

    couldn't stat dev path=20

  (and that's correct it really is not there).

Could anybody point me in the direction of recovering my data, please?

Thanks a lot,

Mat=C4=9Bj
