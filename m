From: Stefan Feeser <stefan.feeser@felino.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200304092152.14215.stefan.feeser@felino.de>
Subject: [linux-lvm] debian and LVM: Problem with lilo
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
Date: Wed Apr  9 14:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I have created a volume group and some logical volumes. The volume group 
contain all directories, only swap and /boot are physical volumes. At the 
moment debian is running at the ram disk.

The installation steps are ok and I would like to create a bootable at 
/dev/hda1 (my boot volume). I switched to another virtual console and type 
the following command

lilo -r /target -F /etc/lilo.conf

After that I get the message that

Fatal: Not a number: "/dev/rootvg/rootlv"

Has anyone an idea what I can do to create a correct boot table?

Thanks

Stefan
-- 
+++++++++++++++++++++++++++++++++++++++++++
Dipl.-Ing. (FH) Forstwirtschaft
Stefan Feeser
+++++++++++++++++++++++++++++++++++++++++++
have a look to
--
http://www.felino.de
http://www.lug-untermain.de
http://www.project-ibex.org
