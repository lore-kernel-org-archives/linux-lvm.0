Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3R8kgg5011254
	for <linux-lvm@redhat.com>; Fri, 27 Apr 2007 09:46:42 +0100
Message-ID: <4631B956.5020808@redhat.com>
Date: Fri, 27 Apr 2007 09:50:30 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New developer question -- API
References: <000001c7886d$a041fb40$e0c5f1c0$@com>
In-Reply-To: <000001c7886d$a041fb40$e0c5f1c0$@com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

John Antypas wrote:
> This has probably been asked thousands of times before, but I?ll try to
> be a good 1001 J
> 
>  
> 
> I?m trying to write some userspace code which can determine what  LV, VG
> and PV a givne file mout belongs to.  Yes, I can process the output of a
> few command lines tools like this:
> 
>  
> 
> 1.       Get the mount from /proc/mounts
> 
> 2.       Run lvs and map that into the LVM
> 
> 3.       Using the LVM, run vgs and get the VG
> 
> 4.       Using VG, use pvs and get the PV
> 
> 5.       Using PV, now some knowledge about how I set things up and get
> the md
> 
> 6.       Run around proc some more and figure out which disks this md is on
> 
>  
> 
> These utilities do it ? is there an API I can call to do all of this
> tracing down rather than processing shell processes?
> 

You can use liblvm2cmd to get this information (the header is normally
/usr/include/lvm2cmd.h). This allows you to run LVM2 commands through a
library interface, although you will still need to parse the output as
it is the same textual format as the commands themselves provide.

On a recent enough kernel though, all the information you are interested
in is exposed directly in sysfs. Take a look at the "holders" and
"slaves" entries in subdirectories of /sys/block. There is also a
library interface (libsysfs) that provides access to the keys & values
exposed here.

Regards,
Bryn.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGMblW6YSQoMYUY94RAkgHAKDCwMM8R8H4H72Hpr8lsTHgyLxv8wCgsX6f
lBGTn0VeYA0M/4uTNHDr+j4=
=B9i/
-----END PGP SIGNATURE-----
