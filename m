Return-Path: <ralph@oro.net>
Date: Tue, 27 Feb 2001 14:36:04 -0800
From: Ralph Jennings <ralph@oro.net>
Message-ID: <20010227143604.A9170@oro.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM with devfs
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
To: LVM Mailing List <linux-lvm@sistina.com>

In case anybody cares, I have an experience here to share:

When I do a pvcreate on /dev/md/3 with devfs, pvcreate says file
doesn't exist (talking about /dev/md/3).

Also dies with /dev/discs/disc1/part1. (problem with symlinks?)
When I use /dev/ide/host0/bus1/target0/lun0/part1 it works.

When I take off devfs (append=devfs=nomount), then /dev/md3 works.
Also /dev/hdc1 works.

Using LVM "0.9.1_beta5_a", and Kernel "2.4.1".
