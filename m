From: darren.miller@philips.com
Message-ID: <OF156AE06C.675A04C9-ON80256E78.00455CE7-80256E78.0045D771@philips.com>
Date: Fri, 16 Apr 2004 13:41:01 +0100
MIME-Version: 1.0
Subject: [linux-lvm] LVM2-Snapshot 2.6.5 with udm2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: linux-lvm-admin@redhat.com





running command: lvcreate -L 28G -s -n snapFri /dev/vault/vol1 completely
hangs, where it did work with UDM1

or though I was able to remove the previous snapshot from using udm1 with
rc1 kernel.

I still have an error relating to LVM when running lilo which might be a
contributing factor:

Warning: '/proc/partitions' does not match '/dev' directory structure.
    Name change: '/dev/dm-3' -> '/dev/mapper/vault-vol1'

Please advise..
==============================================================================

Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681
