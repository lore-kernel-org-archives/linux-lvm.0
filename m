Return-Path: <josv@osp.nl>
Date: Mon, 12 Feb 2001 13:43:00 -0800
From: Jos Visser <josv@osp.nl>
Message-ID: <20010212134300.E28557@jadzia.josv.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Using symlink as PV name fails
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
To: linux-lvm@sistina.com

Hi there,

If I pvcreate a symlink, the pvcreate fails:

  # pvcreate /dev/sdb1
  pvcreate -- device "/dev/sdb1" doesn't exist

  # ls -l /dev/sdb1
  lr-xr-xr-x   1 root     root           34 Feb 12 13:24 /dev/sdb1 -> scsi/host0/bus0/target4/lun0/part1

This actually happens a lot in devfs systems. I think it might have to
do something with the fact that the code that checks the PV name in
/proc/partitions, does not take the fact that the PV name is a symlink
into account...

++Jos


-- 
I have no need for a spirituality which can not encompass my humanness.
