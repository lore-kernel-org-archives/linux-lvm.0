From: Marko Asplund <aspa@kronodoc.fi>
Message-ID: <Pine.LNX.4.44.0210131721350.23214-100000@gamay.kronodoc.fi>
MIME-Version: 1.0
Subject: [linux-lvm] volume group setup question
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
Date: Sun Oct 13 09:38:57 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

i'm a LVM newbie trying to figure out how to setup volume groups on a new
Linux system. the underlying physical volume will be a hardware RAID5
disk. i'm thinking about having a non-LVM root partition and a logical
volume per each of the major mount points in the system (/usr, /home,
/tmp, /var etc.) but i'm having problems deciding whether to start with a
volume group per logical volume or just one volume group with all the
logical volumes in it?

is there any benefit from partitioning the RAID disk and having a separate
volume group per mount point (with just one logical volume to start with)
or should i have the RAID disk in just one partition, create one volume
group and have all of the mount point logical volumes in that one volume
group?

-- 
	aspa
