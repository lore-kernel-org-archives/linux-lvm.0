Message-Id: <5.0.0.25.2.20020225083201.00b36cf0@frodriguez.mail.wesleyan.edu>
From: Felix Rodriguez <frodriguez@mail.wesleyan.edu>
In-Reply-To: <001801c1bddc$b32b51e0$216410ac@tao.co.uk>
References: <wxxzo1yecqu.fsf@nommo.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] Problems mounting LVM volume as root
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
Date: Mon Feb 25 07:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


Hi All,


I have gotten LVM to work on my linux 2.4.17 kernel system. I am having a 
problem mounting my LVM volume as root. I followed all the instructions in 
the LVM howto that explains how to add an LVM root. I successfully created 
a root LVM volume formated it and copied the original root to the volume. I 
then ran the lvmcreate_initrd script. It created the .gz initrd file in the 
/boot directory. Made all the appropriate changes to lilo.conf and ran 
/sbin/lilo. My problem is when the kernel comes up insmod says it can't 
fine /lib/modules/2.4.17lvm/net/unix.o module. I think it's because the 
root file system isn't being mounted at that point but I am not sure. Does 
anyone have any ideas. I am running the 2.4.17 kernel with LVM support and 
the new LVM version 1.0.3. Are there any know problems with this 
configuration? Thanks.

Felix Rodriguez
Programmer Analyst
Phone: 860-685-3984
Email: frodriguez@mail.wesleyan.edu
Web: http://frodriguez.web.wesleyan.edu
