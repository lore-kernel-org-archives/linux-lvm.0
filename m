Mime-Version: 1.0
Date: Mon, 01 Oct 2001 15:17:40 -0700
From: Henning Hogue <henning@randomfactor.net>
Message-Id: <E15oBO3-00035u-00@hermes.sistina.com>
Subject: [linux-lvm] segmentation fault problems
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have been having a problem getting the LVM working due to lvcreate causing a 
segmentation fault when it's run. I am running redhat 7.1 on a SMP system with 
kernel 2.4.9. I have had the same problem with versions 1.0.1rc2 and the CVS 
code. A copy of the output from the command /sbin/lvcreate -d -l1000 -ntestlv 
volume_1  2> debug.out is available at http://www.randomfactor.net/~henning/deb
ug.out

	-Henning
