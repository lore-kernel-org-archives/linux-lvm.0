Message-ID: <3E920F5A.E26EC943@ezinc.com>
From: Miwako Nakai <nakai@ezinc.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems
References: <029601c2f79d$83ff2da0$64451c0a@dokho>
Content-Transfer-Encoding: 7bit
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
Date: Thu Apr 10 00:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I think you would be better to set PE size upto 8MB.
Probably, you are using old version. 1.0.6 or later, PE size is
16MB at default.

And I also think you would be better not to use HTML mail.

> Gaetan wrote:
> 
> --- Volume group ---
> VG Name               FILER
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                2
> Open LV               1
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               453.63 GB
> PE Size               4 MB
> Total PE              116129
> Alloc PE / Size       58893 / 230.05 GB
> Free  PE / Size       57236 / 223.58 GB
> VG UUID               ExxNF9-89PZ-wHbC-LtKX-R3GL-Hp00-EVfvJt
> 
> I would like to increase my MAX LV SIZE
> 
> ZanZiBar:~# lvextend -L +300G /dev/FILER/MIRROR2
> lvextend -- size 555745280 KB is larger than maximum VGDA kernel size
> of 268427264 KB
> Help !! :(

Nakai ezcom
