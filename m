Message-Id: <BC9564600E40C541983FCD6BEAF814FE03C94E6B@xch-knt-15.nw.nos.boeing.com>
From: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
MIME-Version: 1.0
Subject: [linux-lvm] Logical Volume disappears
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
Date: Thu Feb  7 12:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "IBM-linux-lvm (E-mail)" <linux-lvm@sistina.com>

> I'm having a very strange problem.  Perhaps you guys can help me.
>  
> 
> I needed to make a public repository for the contents of five CD's, so I
> set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> CD's, I figured two volumes ought to hold the contents.  An rpm query
> shows lvm-0.8-157, which is what came with the SuSe distribution.
> 
> I added two 3390-3 full-pack volumes to Linux and did a dasdfmt on them.
> I went into YAST and created a logical volume group "vgcd" and a logical
> volume "lvcd" using these two volumes.
> I did a mke2fs on the logical volume /dev/vgcd/lvcd
> I was able to mount /dev/vgcd/lvcd as /mnt and was able to do a "df' and
> see them and copy some files to them
> 
> So far, so good.  Everything looking just fine.
> 
> Now, the wierd part:
> I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> After the reboot, the device /dev/vgcd/lvcd does not exist.
> vgscan says "vgscan -- no volume groups found"
> pvscan says "pvscan -- no valid physical volumes found"
> vgck says "vgck -- no volume groups found"
> pvdisplay /dev/vgcd/lvcd says "invalid physical volume name
> "/dev/vgcd/lvcd"
> ls /dev/lvcd says "No such file or directory"
> If I go back into YAST to do it all over, it says I can't create volume
> group "vgcd" because it already exists.  But it doesn't show up in the
> list of volume groups.
> 
> 
> Can any of you point me in the right direction to see what the problem is?
> 
> 
"Never trust any computer you can lift."
Gordon Wolfe, Ph.D. (425)865-5940
VM Technical Services, The Boeing Company
