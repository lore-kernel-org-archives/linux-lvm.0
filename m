From: Donald Gordon <don@dis.org.nz>
Message-Id: <20030111135159.6f968ae6.don@dis.org.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate -- device "/dev/hdc" has a partition table: force check
 bypass?
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
Date: Fri Jan 10 18:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

I'm trying to setup LVM, but have run into trouble:

unibus:~# blockdev --rereadpt /dev/hdc;dmesg|tail -n 1
 /dev/ide/host0/bus1/target0/lun0: unknown partition table
unibus:~# pvcreate /dev/hdc
pvcreate -- device "/dev/hdc" has a partition table

as you can see, Linux knows that there's no partition, yet pvcreate
insists that there is; this was after dd-ing 1GB of /dev/zero over the
start of the disk, too :-(

Is there any way to force a bypass of this partition table test?

don
