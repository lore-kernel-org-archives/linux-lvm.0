From: Stefan Feeser <stefan.feeser@felino.de>
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net> <140150000.1047758272@[192.168.200.4]> <20030315223816.GB16976@gw.silicide.dk>
In-Reply-To: <20030315223816.GB16976@gw.silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200303152354.10449.stefan.feeser@felino.de>
Subject: [linux-lvm] Debian and LVM at the begin of the installation prozess
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
Date: Sat Mar 15 16:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I am a beginner with LVM and Debian. I would like to install debian and "put" 
the hole disks in the LVM. At my system I would like to stripe-mirror (RAID 
10) my two disks (IDE). Because the hardware is not the newest one I have to 
do the installation with bootdisks.

My question is how I can create a volume group and so on during the 
installation prozess.

I have tested this but Debian always present his installation tool. I 
downloaded debian installation disks and the device drivers but I always see 
the installation tool. After that the next steps will be to configure 
language, etc., and, after that I have to create a swap partition and than an 
root partition. A LVM filesystem I can't create.

Sorry about my, I am sure, stupid questions and my bad english.

Thanks and regards

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
