Message-ID: <20020714190504.GA880@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
From: Kai Weber <kai.weber@glorybox.de>
Subject: [linux-lvm] Extending an LVM-Partition
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
Date: Sun Jul 14 14:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I read the "RAID extension" thread. I have a similiar problem but
without RAID:

I have a hard disk with an setup like that

/dev/hda1	Linux LVM
/dev/hda2	ext2

I want to remove the hda2 partition and use the free space for LVM. I
read in the HOWTO (or was it some FAQ) that 2 or more PV's on one hard
disk are not a good idea. So I am searching for a way, to extend the LVM
partition easily.

Or I ask for an "you can just add the PV hda2 and it does not matter, if
there is another PV on this disk" advice.

Kai
