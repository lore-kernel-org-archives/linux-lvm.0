Return-Path: <defranco@cup.hp.com>
Message-ID: <3B6B30C4.B4427F3D@cup.hp.com>
Date: Fri, 03 Aug 2001 16:16:20 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM with multi-path disks?
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
To: linux-lvm@sistina.com

Hi,

Does LVM work with multi-path disks? For example I have
a fibre channel configuration in which I have two paths
to each disk. I pvcreate a disk and am able to use it
within a vg but when I reboot and do a vgscan, lvm cannot
find any vg's. If I remove the second path lvm can see
the vg fine.

Are there some configuration settings or such that need
to be enabled?

THanks.
-- 
==========

John DeFranco <defranco@cup.hp.com>
Software Engineer
Hewlett Packard, Cupertino
(408) 447-7543
