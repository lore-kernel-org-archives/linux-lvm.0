Return-Path: <bluca@comedia.it>
Date: Wed, 9 May 2001 19:45:22 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM-i2o problem
Message-ID: <20010509194522.E26444@colombina.comedia.it>
References: <5c1df9db30f63ca9.30f63ca95c1df9db@apollo.zeropiu.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c1df9db30f63ca9.30f63ca95c1df9db@apollo.zeropiu.it>; from christianv@zeropiu.it on Wed, May 09, 2001 at 05:15:25PM +0200
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

add
#ifdef I2O_MAJOR
I2O_MAJOR,
#endif

at the end of valid_majors[] just above the -1 in 
tools/lib/lvm_check_partitioned_dev.c

add 

"/dev/i2o" (above the NULL) to devdir[]
in tools/lib/lvm_dir_cache.c

if there are still problems you should check with lvmdiskscan -d
and/or pvcreate -d

to see where it fails,
then submit either a bug report with those two output or a patch that
adds i2o support to lvm :)



On Wed, May 09, 2001 at 05:15:25PM +0200, Christian Verdelli wrote:
> Dear friends,
> 
> we have been trying to install LVM on a 
> Linux system running a i20 RAID volume.
> 
> After having configured and installed LVM binaries,
> we receive the following error message when creating
> a physical volume:
> 
> ./pvcreate /dev/i2o/hda2
> pvcreate --- invalid physical volume name  "/dev/i2o/hda2"
> 
> 
> After having consulted the archives we have tried to modify
> the configuration files lvm_dir_cache.c & lvm_check_dev.c 
> lvm_check_partition.c.
> 
> Unfortunately we cannot make out precisely what has to be done,
> could someone please explain us how to make these changes?
> 
> Thanks in advance.
> 
> 
> 
> 
> 
> 
> Verdelli Christian
> 
> ZEROPIU SpA
> via Melzi d'Eril, 26 - 20154 Milano
> ITALY
> Tel: +39-02-34530018 - Fax: +39-02-34532148
> 
> e-mail: christian.verdelli@zeropiu.it
> homepage: http://www.zeropiu.com

Content-Description: Card for Christian Verdelli <christianv@zeropiu.it>
> Unrecognized switch: -
  (-h will show valid options).


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
