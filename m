Subject: Re: [linux-lvm] Debian and LVM at the begin of the installation prozess
Message-ID: <1047802522.3e74329ad4102@secure.st-peter.stw.uni-erlangen.de>
From: shsp0058@st-peter.stw.uni-erlangen.de
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net> <140150000.1047758272@[192.168.200.4]> <20030315223816.GB16976@gw.silicide.dk> <200303152354.10449.stefan.feeser@felino.de>
In-Reply-To: <200303152354.10449.stefan.feeser@felino.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sun Mar 16 02:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Stefan Feeser <stefan.feeser@felino.de>:

> Hi all,
> 
> I am a beginner with LVM and Debian. I would like to install debian and
> "put" 
> the hole disks in the LVM. At my system I would like to stripe-mirror
> (RAID 
> 10) my two disks (IDE). Because the hardware is not the newest one I
> have to 
> do the installation with bootdisks.
> 
> My question is how I can create a volume group and so on during the 
> installation prozess.
> 
> I have tested this but Debian always present his installation tool. I 
> downloaded debian installation disks and the device drivers but I always
> see 
> the installation tool. After that the next steps will be to configure 
> language, etc., and, after that I have to create a swap partition and
> than an 
> root partition. A LVM filesystem I can't create.
> 
> Sorry about my, I am sure, stupid questions and my bad english.
> 
> Thanks and regards
> 
> Stefan

Hi Stefan,
the easiest way would be:
1. create a /boot partition
2. create 2 raids - one for lvm,
   the second for temporary installation
3. format the second raid & install debian on it,
4. create VG & LV's on the first raid, and trasfer 
   the temporary installation to it 
   i use:
   cd /
   find . -xdev | cpio -pm /mnt/newroot
5. modify fstab & lilo.conf to correspond to the new
   installation, rerun lilo
6. boot in the new installation, if everything is OK,
   you can create PV of the second raid(the temporary installation)
   and add it to your VG,extend your LV's and the FS on them
7. that was all :)

regards,

svetljo
 
