From: "Kai-Min Sung" <k@kaisung.com>
Message-ID: <001301c31aad$4018fe30$3200a8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] re: iSCSI and LVM
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
Date: Thu May 15 01:42:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: freemyer@NorcrossGroup.com
Cc: Linux-lvm@sistina.com

Hi Greg,
	Thanks for responding. I'm currently trying out the iSCSI
implementation provided by the UNH IOL iSCSI Consortium:

http://www.iol.unh.edu/consortiums/iscsi/

They provide modules for both target and initiator. Unfortunately, the
implementation is based on the v18 draft and doesn't include support for
ErrorRecoveryLevel 2. I'd like level 2 recovery so that I can failover
the node running the iSCSI target, and have the initiator automatically
reconnect to the new iSCSI target node. Also, their implementation
doesn't have support for setting up a logical volume as an iSCSI target.
You can specify a file as an iSCSI target, so I tried specifying the
logical volume's block device file, but when I imported it on the
initiator node, the capacity of the device was all screwed up. Anyways,
I'll try your pointer to the Intel implementation and see if it works
better. Alternatively, I may try looking into using ENBD to export the
logical volumes.

Thanks,
-Kai 
