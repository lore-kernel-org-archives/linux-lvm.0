From: Marek Jan <xjan@informatics.muni.cz>
Message-ID: <Pine.SGI.4.58.0401201447550.35165147@aisa.fi.muni.cz>
MIME-Version: 1.0
Subject: [linux-lvm] Initialize disk on /dev/nda (fwd)
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
Date: Tue Jan 20 08:49:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
I have problem with pvcreate on network block device disk (/dev/nda).
When I run

# pvcreate /dev/nda
  /dev/nda: Couldn't find device.

Device /dev/nda is OK, because Iam able to create ext3 file system on it.


# mkfs.ext3 /dev/nda
mke2fs 1.27 (8-Mar-2002)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
4120704 inodes, 8232588 blocks
411629 blocks (5.00%) reserved for the super user
...
...

I am running LVM2 on Debian with 2.4.22 kernel.
Have anyone know what I doing wrong?
Thank You, Marek Jan
PS I am very sorry of my really BAD english :-).
MJ
