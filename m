Message-ID: <615A249B783CD41192F400D0B747AC8606BA869A@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Subject: RE: [linux-lvm] resize_reiserfs on SuSE Linux enterprise server
MIME-Version: 1.0
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
Date: Fri Jul 19 07:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

I've fixed the problem in the meanwhile. the problem was between the chair
and the keyboard.

Thanks

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Freitag, 19. Juli 2002 14:31
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] resize_reiserfs on SuSE Linux enterprise server


On Fri, 2002-07-19 at 07:18, ZECHA,HOLGER (HP-Germany,ex1) wrote:
> Hello,
> 
> I extended a Logical Volume with reiserfs and tried to extend it online,
but
> got the following error:
> 
> mount -o remount,resize=1269715 /home/linuxrpm
> mount: /home/linuxrpm not mounted already, or bad option
> 
> or with resize_reiserfs:
> 
> resize_reiserfs -s -10M /dev/vg00/lvlinux 
> resize_reiserfs 3.x.1b (2002)
> 
> resize_reiserfs: remount failed: Invalid argument

Which kernel are you using?  resize_reiserfs detects that you've got the
FS mounted, and reverts back to the mount -o remount command.

-chris



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
