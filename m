Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [last
	question]
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <200105231649.f4NGnDCR028588@webber.adilger.int>
References: <200105231649.f4NGnDCR028588@webber.adilger.int>
Date: 23 May 2001 11:02:39 -0400
Message-Id: <990630164.1175.0.camel@localhost>
Mime-Version: 1.0
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

On 23 May 2001 10:49:13 -0600, Andreas Dilger wrote:
> Rupert Heesom writes:
> 
> Yes, you can do that...  However, once you have LVM you should start to
> think differently about "partitions" and such.  You can create a lot of
> small partitions for different needs.
> 
> Why is this useful?  Because it makes moving stuff around, updating the
> OS, etc easier.  You can have multiple OS installs, but keep your /home
> and /mp3 data available to both.  You can put /mp3 on a new disk and it
> will spin down when you are not listening to them.  You can put /var/log
> and /var/spool/mail on different LVs so that lots of logs or lots of
> email don't make your system unusable.

Tnx for the advise here.  I'll try to start thinking in those terms.

I've now got one more question which I'll post in this msg -

I've discovered that my /etc/rc.d/init.d/halt script is set up
incorrectly for LVM.  When I previously installed LVM, I followed
instructions, and put a "vgchange -an" into the halt script just after
/proc is umounted.

What I'm finding now is that when I'm shutting the PC down, vgchange is
complaining that it can't close the VG down because there's an active
partition (something like that).  I've had a look at the halt script,
and I can't figure out exactly how umounting the LV & deactivating the
VG would work.

I put a tentative line right above the "/sbin/vgchange -an" saying
"umount /dev/vg/root".   However, if I'm unmounting root BEFORE
deactivating the VG, then the system won't find the /sbin/vgchange util
will it?  

I do have  /boot/initrd-lvm-2.4.3.gz which is used at boot time.  This
ramdisk does have /sbin/vgchange in it (which you probably know).  If
root is unmounted when /sbin/vgchange is called, will the system use the
ramdisk?   If so, how does it know to use it?   (I'm kinda new to
figuring out how ramdisks work, I just follow instructions and they
work!)

Once I'm satisfied that my LVM setup is not good, then I'm going to try
taking the plunge & extending the LV to my other disk.

BTW, since my other disk still has the old file system on it, is this
filesystem wiped when I change partition type to "8e", or when I create
a PV on it, or not at all?  I can't think that anything but the e2fsadm
extending the LV file system onto the other disk will wipe the previous
contents out.

-- 
regs
rupert
