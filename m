Message-Id: <200112071428.fB7ES8H18188@dymwsm15.mailwatch.com>
From: "DiPasquale, Carl (C.J.)" <cdipasqu@visteon.com>
MIME-Version: 1.0
Subject: [linux-lvm] Root disk becomes read-only after LVM configuration
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
Date: Fri Dec  7 08:26:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "DiPasquale, Carl (C.J.)" <cdipasqu@visteon.com>

Help please!
	I'm trying to configure LVM on a 7.3 Suse 2.4.10 install. LVM config
works ok and creates vg's and lvol's but root disk becomes read-only after
system reboot!  Can't recover from problem and must reload, (on 4th load now
and about to give up on LVM).  I noticed that after LVM config I could not
see several partitions (/boot, /dev/shm, /) in a shell after using the df
-Ha command.  My LVM version is 1.0.0.2_rc2-6 and the
Yast2-config-lvm_config version is 2.4.3-11.  Any idea on what is causing
this and/or how to remedy? 

Carl
> ___________________________________________________________
> Carl DiPasquale	cdipasqu@visteon.com
> Oracle DBA / Web Administrator	610-584-7652
> North Penn Information Systems                             610-584-7946
> (FAX)
> Visteon Automotive Systems
> http://www.visteon.com
> 
> 
> 
