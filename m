Return-Path: <shanu@exocore.com>
Date: Mon, 21 May 2001 11:28:41 +0530
From: Shanker Balan <shanu@exocore.com>
Message-ID: <20010521112841.A28340@monster.exocore.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM and multiple distributions
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
To: Linux-LVM <linux-lvm@sistina.com>

Hello:

I have been using LVM for some time on RHL 7.0 (with 7.1 updates) and
things have been working excellent. LVM is k3wl.

Last week, i installed Debian on a another partition on the same machine
and for some odd reason "vgchange -ay" sez "no volume groups found".

godzilla:~# vgchange -ay
vgchange -- no volume groups found

Everything works correctly on RHL. What do i need to do under Debian to
get the LVM partition up?

I am using:

Debian Unstable
Kernel 2.4.4 with LVM compiled in
lvm 0.9.1beta7-1

RedHat Linux 7.1
Kernel 2.4.4 with LVM compiled in

Fdisk output:
godzilla:~# fdisk -l /dev/hda|grep -i lvm
/dev/hda8          1803      2185   3076416   8e  Linux LVM

Thanx for your time.

-- Shanu

 -   -   -   -   -   -   -   -   -   -  - ( Shanu )  -  -
 Shanker Balan							shanu@exocore.com
