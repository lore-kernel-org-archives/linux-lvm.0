From: mmuscatell@toolkitmail.com
Message-id: <01KYTY6045EA98UJCX@SMTP00.InfoAve.Net>
Subject: [linux-lvm] RH9 LVM mount problem
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
Date: Tue Jul 29 11:53:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This LV was created and working fine with no problems.  A burp in NFS caused 
the system to hang and required a reboot.  Now when trying to mount the second 
of 2 LVs on the system. THe following error occurs.  All drives are showing up 
in lvmdiskscan and vgscan see both VGs.  These drives were formated as ext3 
before being converted to LVM fs. Please let me know if any additional info is 
required to help trouble shoot this problem. 

Thanks 

#mount /dev/vg2/vg2_lv /vg2
mount: wrong fs type, bad option, bad superblock on /dev/vg2/vg2_lv,
       or too many mounted file systems
       (aren't you trying to mount an extended partition,
       instead of some logical partition inside?)
