Date: Tue, 28 Aug 2001 23:01:15 +0200 (CEST)
From: DaP <dap@mail.index.hu>
Message-ID: <Pine.LNX.4.33.0108282222590.496-100000@dap.index>
MIME-Version: 1.0
Subject: [linux-lvm] LVM vs NBD
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

 When I try to display a PV that lays on an NBD (/dev/nda1), pvdisplay
returns with strange error..  This error also shows when I try to add this
PV to a volume group..  NBD isn't supprted by LVM or what's the problem?


  # pvcreate -vv /dev/nda1
	pvcreate -- locking logical volume manager
	pvcreate -- checking physical volume name "/dev/nda1"
	pvcreate -- getting physical volume size
	pvcreate -- checking partition type
	pvcreate -- creating new physical volume
	pvcreate -- setting up physical volume for /dev/nda1 with 6144000 sectors
	pvcreate -- writing physical volume data to disk "/dev/nda1"
	pvcreate -- physical volume "/dev/nda1" successfully created
	pvcreate -- unlocking logical volume manager

  # pvdisplay -vv /dev/nda1
	pvdisplay -- checking physical volume name "/dev/nda1"
	pvdisplay -- getting physical volume size
	pvdisplay -- creating physical volume device number from name "/dev/nda1"
	pvdisplay -- reading data of physical volume "/dev/nda1" from disk
	pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID
			physical volume "/dev/nda1"


--
  DaP
