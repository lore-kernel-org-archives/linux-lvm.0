From: Mark <lvm@ruby.ridersoft.net>
Message-Id: <200306270725.h5R7POMs018131@ruby.ridersoft.net>
Subject: Re: [linux-lvm] vgscan and initrd
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1056698724"
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
Date: Fri Jun 27 08:34:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

--bound1056698724
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

That's one of the solutions I had heard over at the Gentoo-LVM forums. 

I've tried adjusting my initrd, both to manualy load the pdc_new module (for my raid controller) and adjusting the size of the initial ramdisk to 4096. 

Didn't work. And still I don't get why vgscan wouldn't work while chroot'ed. 

Also, the lvm root partition is only about 6 or 7 gb in size, would that constitute 'to big' ?

What do you mean by

> mount a tmpfs volume over /etc, and meanwhile I have been recreating the
> initrd image leaving enough space to allow vgscan to run.

I can (and did I think) increase the size of the initrd, but how do i mount a tmpfs volume over /etc ??

To be complete, I am running (on the new system anyways) a 2.4.21 kernel, and lvm 1.0.7. 

Booting into the system with any other kernel, such as gentoo-xfs-2.4.19 or Suse-Rescue-2.4.6 works like a charm. 

Still confused, but gratefull for any help

Mark

--bound1056698724--
