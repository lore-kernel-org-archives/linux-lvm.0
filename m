Message-ID: <4CEFDA59.1000204@redhat.com>
Date: Fri, 26 Nov 2010 17:03:37 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <icjsgr$tm$1@taco.int.tagonline.com>
	<ickl50$tm$3@taco.int.tagonline.com>
In-Reply-To: <ickl50$tm$3@taco.int.tagonline.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to use metadata.dirs in lvm.conf? (Was: Re:
 Solving the "metadata too large for circular buffer"	condition)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andrew Gideon <ag2827189@tagmall.com>

On 11/25/2010 04:28 AM +0100, Andrew Gideon wrote:
> I immediately start seeing "memory" errors from LVM commands.  For example:
> 
> 	[root@noodle6 tagonline]# vgscan
> 	  Reading all physical volumes.  This may take a while...
> 	  Found volume group "TestVG0" using metadata type lvm2
> 	  Found volume group "guestvg00" using metadata type lvm2
> 	  You have a memory leak (not released memory pool):
> 	   [0x83e7848]
> 	   [0x83e7868]
> 	  You have a memory leak (not released memory pool):
> 	   [0x83e7848]
> 	   [0x83e7868]

This should be resolved already (since lvm2 version 2.02.75) with this patch
http://sourceware.org/git/?p=lvm2.git;a=commit;h=cfbbf34d6a8606dd97ef529e8f709e494535ed42

> 
> I then
>    * pvcreate -ff --restorefile /etc/lvm/backup/... --uuid ... --metadatacopies 0  /dev/xvdN1
> on the final PV that has metadata.  
> 
> Now, I cannot see the volume group:
> 
> 	[root@noodle6 tagonline]# vgdisplay -v TestVG0
> 	    Using volume group(s) on command line
> 	    Finding volume group "TestVG0"
> 	    Wiping cache of LVM-capable devices
> 	  Volume group "TestVG0" not found

This seems to be another bug, I've sent a patch to lvm-devel...

(The metatada/dirs is not used so often so that's probably the reason why these
bugs got unnoticed for a longer time. If you have any other problem while using
this setting, plese, feel free to report it. Thanks.)

Peter
