Message-ID: <3FF277FF.1D5400B4@groupe-ips.com>
From: Jean Marie =?iso-8859-1?Q?Ari=E8s?= <jeanmarie.aries@groupe-ips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Understand the snapshot process
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
Date: Wed Dec 31 01:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I'm using LVM under SuSE Linux 8.0, and I don't understand all the
snapshot process.
I know a snapshot is an exact copy of an existing volume :o)

Our config is :

2 disks 73 Go RAID 1
--> 1 VG "OVG" (60 GB)
--> 1 LV /dev/OVG/data (40 GB) mounted on /share/data

To create a snapshot whith ReiserFS, we do this (I'm following the LVM
How-To) :

Tux :# lvcreate -L30G -s -n snap_admin /dev/OVG/data

and so, we mount the snapshot :

Tux :# mount /dev/OVG/snap_admin /share/snapshot

At this point, the /share/snapshot contain a copy of the /share/data
directory.

The How To say "Do the backup" for exemple with tar.

My question is : Why we must to copy the data with a system command on
the snapshot ? Is a "create snapshot/remove snapshot" not possible ?


Thanks in advnace for your response.


--

Jean Marie Ari=EF=BF=BDs
