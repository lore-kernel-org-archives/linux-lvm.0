From: Spam <spam@tnonline.net>
Message-ID: <212842093.20031101062735@tnonline.net>
Subject: Re: [linux-lvm] LVM and Network Block Device (problem sollution)
In-Reply-To: <1419914140.20031101053847@tnonline.net>
References: <1419914140.20031101053847@tnonline.net>
MIME-Version: 1.0
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
Date: Fri Oct 31 23:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

  The sollution to the problem was simple. The lvm tools are hardcoded
  (from  lvm_dir_cache.c)  to  only look for specific directories when
  scaning  for  lvm disks. For network block devices lvm looks only in
  /dev/nb/*, while my Gentoo kernel created /dev/nbd/*.

  A  simple  fix was to make a link /dev/nb->/dev/nbd and it worked. I
  did not find anything about this in the howto or man-pages.

  //Anders

>   Hello,

>   How can I make lvm to recognize my network block devices? They are
>   listed in /dev/nbd/* and I can access them fine with fdisk or dd.

>   But when I try pvdisplay /dev/nbd/0 I get the following error:

>   pvdisplay - ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID
>               physical volume "/dev/nbd/0"

>   I get no errors in the logs either so I am not sure where to start.

>   From what I see lvmdiskscan etc looks in /proc/partitions and never
>   scans /dev/ for valid blockdevices?
  
>   Thanks for any input,
>   Anders
