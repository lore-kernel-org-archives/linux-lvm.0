In-Reply-To: <20040115230502.22365.27437.Mailman@hermes.sistina.com>
MIME-Version: 1.0
From: Frank Bagehorn <fba@zurich.ibm.com>
Message-ID: <OFD32F6C3A.281F6118-ONC1256E1D.002ADACC-C1256E1D.002BA837@ch.ibm.com>
Subject: [linux-lvm] Problems with booting after changing certain volumes
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
Date: Fri Jan 16 02:58:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Recently I had problems on a SuSE SLES 8 install.
When I created two more logical volumes in the rootvg, the machine would 
hang during boot stating
        ERROR 2 - writing volume group backup file 
/etc/lvmtab.d/rootvg.tmp in vg_cfgbackup
        unable to do a backup of volume group "rootvg"
        removing volume group "rootvg" from /etc/lvmtab
I tried to increase the root file system from 512MB to 1GB but that didn't 
help.
So I removed the two lvs (and assumed I run into a strange bug that allow 
not more than 7 lvs..)
Instead I increased one of the other lvs and put the data in those.
Now I rebooted again (first time since I increased the lv) and get the 
same error.

Question:
How much space is necessary to do the volume group backup ?
Shall I increase the rootlv even further (e.g. to 2GB) ?
Or is the problem more than just not enough space ?
The lv in question is about 60GB. I have another lv in a second volume 
group that is the same size.
(i.e. a copy of the same data is held on an external disk.) And that 
doesn't seem to make a problem.

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
