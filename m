Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Converting my Root file system to LVM [lastquestion]
Date: Thu, 24 May 2001 10:24:28 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJGENMIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <990630164.1175.0.camel@localhost>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Rupert Heesom
[snip]
> What I'm finding now is that when I'm shutting the PC down, vgchange is
> complaining that it can't close the VG down because there's an active
> partition (something like that).  I've had a look at the halt script,
> and I can't figure out exactly how umounting the LV & deactivating the
> VG would work.
> 
> I put a tentative line right above the "/sbin/vgchange -an" saying
> "umount /dev/vg/root".   However, if I'm unmounting root BEFORE
> deactivating the VG, then the system won't find the /sbin/vgchange util
> will it?  
> 
> I do have  /boot/initrd-lvm-2.4.3.gz which is used at boot time.  This
> ramdisk does have /sbin/vgchange in it (which you probably know).  If
> root is unmounted when /sbin/vgchange is called, will the system use the
> ramdisk?   If so, how does it know to use it?   (I'm kinda new to
> figuring out how ramdisks work, I just follow instructions and they
> work!)

Hey thats a good point... maybe a halt-time ramdisk?
:)


[snip]
