Return-Path: <john@oswf.de>
From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15226.31281.143943.166236@rigel.oswf.de>
Date: Wed, 15 Aug 2001 15:33:37 +0200 (MEST)
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
In-Reply-To: <20010815091329.A29902@linux.com>
References: <20010814171159.B28266@linux.com>
	<20010815105623.A29693@sistina.com>
	<20010815091329.A29902@linux.com>
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

Jason Tackaberry writes:
> > You could either mirror the whole disk using MD *without* persistent
> > superblocks
> 
> This sounds like the best and most transparent solution.  But
> Documentation/md.txt says:
> 
> raid level = -1 linear mode
>               0 striped mode
>   	      other modes are only supported with persistant super blocks
> 
> So it sounds like this won't work?  I'll give it a try and see what
> happens anyway.

It should work, you only need the persistent superblock, if you want to
boot from software RAID.
Here the quote from the HOWTO

>>  3.7.  The Persistent Superblock
>>
>>  Back in ``The Good Old Days'' (TM), the raidtools would read your
>>  /etc/raidtab file, and then initialize the array.  However, this would
>>  require that the filesystem on which /etc/raidtab resided was mounted.
>>  This is unfortunate if you want to boot on a RAID.
>>
>>  Also, the old approach led to complications when mounting filesystems
>>  RAID devices. They could not be put in the /etc/fstab file as usual,
>>  but would have to be mounted from the init-scripts.
>>
>>  The persistent superblocks solve these problems. When an array is
>>  initialized with the persistent-superblock option in the /etc/raidtab
>>  file, a special superblock is written in the beginning of all disks
>>  participating in the array. This allows the kernel to read the
>>  configuration of RAID devices directly from the disks involved,
>>  instead of reading from some configuration file that may not be
>>  available at all times.
>>
>>  You should however still maintain a consistent /etc/raidtab file,
>>  since you may need this file for later reconstruction of the array.
>>
>>  The persistent superblock is mandatory if you want auto-detection of
>>  your RAID devices upon system boot. This is described in the
>>  Autodetection section.

Cheers,
	Werner
