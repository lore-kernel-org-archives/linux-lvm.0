Message-ID: <20021212161221.69659.qmail@web20703.mail.yahoo.com>
From: ronnie <roen51@yahoo.ca>
MIME-Version: 1.0
Subject: [linux-lvm] vgchange -a y -A n error furing installation
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
Date: Thu Dec 12 10:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hello list
Problem:
when installing SuSE Linux 7.3 (SEMS3.1). during the
"preparing your harddisk" phase, i get the following
error:

LVM error
vgchange -a y -A n
internal YaST error

my setup:
SuSe linux email server running SuSE 7.3
2.4.17 kernel
Dell poweredge 14000sc
adaptec aic 7899 scsi controller
Fujitsu scsi drive (x2)

what i kknow (or think i know)
-its not the aic_7xxx module b/c ive manually loaded
module aic_7xxx_old
-the ins goes ok when using regular partitioning b/c
this is a reinstall
-dell servers are a pain in the neck

cheers

ronnie regev

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
