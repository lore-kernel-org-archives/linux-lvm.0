Message-Id: <F47B5C16711BEC4BBB0651C75F724809D568@qntsv14.quant.com>
From: =?iso-8859-1?Q?Gesine_Sch=E4fer-Reimers?=
    <G.SchaeferReimers@quant-forum.de>
MIME-Version: 1.0
Subject: [linux-lvm] restore of parts of a logical volume group
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
Date: Wed Apr 24 03:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

My question is: How can I restore one or more logical volumes in a big
volume group with the constellation (system filesystems and "private
filesystems") described later?

I have one logical volume group named quant. This is placed in a physical
volume that is a partition in a RAID 5 system on SUSE Linux 7.2 with Kernel
2.4. 
The quant volume group is divided into a lot of logical volumes. Some of
them hold the filesystems /home /opt /tmp /var and the swap system. The
other volumes have no file systems since they serve as a medium for informix
database data. These database-logical-volumes are bound to raw devices.

I tried to do a restore of one of the "private" logical volumes but it
failed since I cannot down the volume group because of the file systems
mentioned above (it was denied by the system) and on a running volume group
there is no possibility to access the device since it is in use.

Is there a possibility to handle that or to devide the volume group into two
parts (that for the system file systems and another one for the data)?
