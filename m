MIME-Version: 1.0
From: Frank Bagehorn <fba@zurich.ibm.com>
Message-ID: <OF8AA51DBA.465B6F61-ONC1256DF2.004DF072-C1256DF2.004EE5DD@ch.ibm.com>
Subject: [linux-lvm] vgscan error 2
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
Date: Thu Dec  4 08:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a SuSE SLES 8 machine with the following disk setup:
internal disks RAID 5 (/dev/sda)
external disks RAID 5 (/dev/sdc)

/dev/sda consists of a Linux partition (/boot), a Linux swap partition and 
a physical volume (/dev/sda2).
The physical volume is used for the rootvg volume group, which contains 
several logical volumes.
The root file system "/" is mounted from the rootlv (/dev/rootvg/rootlv).

When I boot the machine, it now does a vgscan, detects all the inactive 
volume groups and gives an error message:
        ERROR 2 - writing volume group backup file 
/etc/lvmtab.d/rootvg.tmp in vg_cfgbackup
        unable to do a backup of volume group "rootvg"
        removing volume group "rootvg" from /etc/lvmtab
As a result I get a kernel panic the next second as the / file system 
cannot be mounted.
(The tsm01lv volume group on the external disks can be written to 
/etc/lvmtab and /etc/lvmtab.d however.)

I can boot in rescue mode, vgscan doesn't complain there and I can mount 
all the logical volumes out of rootvg.
(So I assume the volume group and the logical volumes are ok.)
I moved away some older /etc/lmvconf files to ensure that there is enough 
space on the file system.
(It has about 350MB free space.)
To make sure that the /etc/lvmtab.d folder is ok, I removed and re-created 
it.
Nothing helps.

What else can I do, or where shall I look ?

Thx and regards
Frank

----------------------------------------------------------------------
Dr. Frank Bagehorn
IBM Zurich Research Lab.
Saeumerstr. 4
CH-8803 Rueschlikon 
Switzerland
----------------------------------------------------------------------
SMTP: fba@zurich.ibm.com
Notes: Frank Bagehorn/Zurich/IBM@IBMCH
phone: ++41 (01) 724 83 23  fax: ++41 (01) 724 89 59
