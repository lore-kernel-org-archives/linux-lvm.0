From: Austin Gonyou <austin@coremetrics.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035163216.1245.4.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] vgcfgrestore ouput
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
Date: Sun Oct 20 20:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I tarred up the /etc/lvm* stuff from one box that has a similar
configuration (two whole disks, /dev/sdb and /dev/sdc, in one vg), and
then put it on my target host and attempted to restore the
configuration. 

Below is the output I get. I guess, all I need to know right now, is are
the first 512 bytes of each disk all that is used for the pv
information, or is it more than that? 

Also, can pvcreate be used without destroying the underlying
filesystems? TIA!!!

<vgcfgrestore>
[root@localhost root]# vgcfgrestore -n data /dev/sdb
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/data.conf"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading
physical volume "/dev/sdb"

[root@localhost root]# vgcfgrestore -n data /dev/sdc
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/data.conf"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading
physical volume "/dev/sdc"
</vgcfgrestore>


Austin
