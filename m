Message-ID: <3E19F9CE.4050204@atix.com.br>
From: "Alexander E. Belck" <alexb@atix.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm_blk_ioctl: unknown command 0x24b
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
Date: Mon Jan  6 15:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I got the "lvm_blk_ioctl: unknown command 0x24b" error while initializing a LV with
# mke2fs -c -j /dev/v0/l0

I could only find a similar report of error, but now anser and explanation.

I also got a lot of error mesages for each existing /dev/nb* entry during vgscan.
It seams that vgscan needs that there realy exist a nb-device for each entry in /dev

Thank's for any help or work arround. At least I would like to know if I can use a sistem
with this lvm_blk_ioctl error at mke2fs time, or if there is some patch or correction I can do.


Alex

> i
> i'm running 
> Linux base 2.4.19 #2 Thu Nov 7 09:57:09 CET 2002 i686 unknown
> and it makes 
> lvm -- lvm_blk_ioctl: unknown command 0x24b
> during
> reiserfsck /dev/loop1
> (disk is mounted via loopAES)
> distribution is debian 3.0
> please help
> regards 
> h.kfm
