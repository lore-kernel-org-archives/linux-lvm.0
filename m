Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101182352.f0INq7Q02223@webber.adilger.net>
Subject: Re: [linux-lvm]  Migration path - 2.2.17 & LVM 0.8final -> 2.4.0 & LVM
  0.9.1-b2
In-Reply-To: <3A6768A6.CC431D9@attglobal.net> "from Les Hazelton at Jan 18, 2001
 05:05:26 pm"
Date: Thu, 18 Jan 2001 16:52:07 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Les, you write:
> Most of the system is reiserfs created on lvm devices.  In fact, the
> only part of the system that is not reiserfs/lvm is the /boot tree as
> you can see:
> 
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/lvg01/slash      600M  268M  332M  45% /
> /dev/hda1              45M  4.4M   39M  10% /boot
> /dev/lvg01/home       1.0G  133M  891M  13% /home
> /dev/lvg01/usr        2.0G  1.3G  752M  63% /usr
> /dev/lvg01/src        700M  249M  451M  36% /usr/src
> /dev/lvg01/local      1.0G  537M  487M  52% /usr/local
> /dev/lvg01/var        300M  123M  177M  41% /var
> /dev/lvg01/mp3        1.5G  1.4G  110M  93% /mp3
> /dev/lvg01/pictures   1.0G   38M  986M   4% /pictures
> /dev/lvg01/wine       1.0G   32M  992M   3% /wine

I'm _hoping_ to get some time soon to update LILO to support the new
0.9 ioctl so that /boot can be in LVM as well.

> I want to migrate to the source from
>  
> 	kernel-headers-2.4.0-5mdk.i586.rpm
> 	kernel-source-2.4.0-5mdk.i586.rpm
> 
> patched with lvm_0.9.1_beta2.tar.gz.
> 
> The problem is, I am not sure of the implementation order.  i.e., should
> I first try to add the 0.9.1 user space tools and then the new kernel.
> Or, should I try to add a 0.9.1 patch to the current kernel before
> switching to the new 2.4.0 kernel etc...

I did the upgrade from 0.8final to 0.9 relatively painlessly, by installing
the Conectiva RPMs that support multiple user-tools before rebooting.  This
was all on a 2.2 ext2 system with far less LVM on it, however.  YMMV.

The Conectiva RPMs allow you to do proper shutdown of the current system,
start the new kernel and be off and running.  If you ever need to reboot
into the old kernel, it should also work without any changes (assuming
everything else is OK).  See http://distro.conectiva.com.br/experimental/

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
