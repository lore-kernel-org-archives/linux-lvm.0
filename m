Return-Path: <evan.day@home.com>
From: evan.day@home.com
Subject: Re: [linux-lvm] LVM and lilo
Message-Id: <20010618150058.94C964AC@kirk.banal.collective>
Date: Mon, 18 Jun 2001 08:00:58 -0700 (PDT)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Everything went fine but now I would like to modify my lilo.conf and
all
> I get is; Fatal: Sorry, don't know how to handle device 0x3a00
> 
> Any ideas?

Did you create an initrd ramdisk image?  See lvmcreate_initrd(8) for
details.  You'll then need to add an initrd=/path/to/image to lilo.conf
and rerun lilo.  (Basically the initrd needs to load the lvm modules
into the kernel if you didn't make them static and run vgscan and
vgchange -a y to enable the logical  volumes) 

Did you compile ram disk and initrd support into the kernel?  I spent a
couple hours banging my head trying to figure out why my kernel wouldn't
run the initrd before I finally figured that one out...I'm a quick
learner :)

--
Evan Day <evan (d) day (a) home (d) com>
GPG:1024D/237C1C84 FP:1615 E312 A6D1 542B C4A6 38B5 69B1 2844 237C 1C84
"My bologna has first name, it's H-O-M-E-R..."
