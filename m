From: Stefan Feeser <stefan.feeser@felino.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200304242049.36751.stefan.feeser@felino.de>
Subject: [linux-lvm] Lilo and LVM
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
Date: Thu Apr 24 13:49:14 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

meanwhile I have created a VG and some LV's during the installation process of 
a debian system. My system, which I have prepared for the normal boot process 
looks like that in the RAM disk:

/dev/rootvg		/target
/dev/hda1		/target/boot
/dev/rootvg/varlv	/target/var
...

Now I have the problem that I could not create a correct bootable system.

At the LVM-Howto I found that I have to create a LVM start script. So I create 
that. In the same documentation I found that I have to run the following 
command

update-rc.d lvm start 26 S . stop 82 1 .

But  this don't run at my system (it runs at the RAM disk!!!). Further I found 
that I have to run the lilo command after I configure my lilo.conf at 
/target/etc/ with the following command.

lilo -r /target -F /etc/lilo.conf

After running that it seems that my configuration is correct becaus the system 
start after a reboot. At the point where the volumes will be mounted the 
system get a kernel panic because it seems that / can not mounted.

Have someone an idea what I should do???

Thanks and Regards from a north bavarian village

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
