Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAI9J1iX002707
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 09:19:01 GMT
Date: Thu, 18 Nov 2004 09:18:57 +0000
From: Patrick Caulfield <patrick@debian.org>
Message-ID: <20041118091857.GB23843@tykepenguin.com>
References: <87fz376h40.fsf@blackdown.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fz376h40.fsf@blackdown.de>
Sender: Patrick <patrick@tykepenguin.com>
Subject: [linux-lvm] Re: Bug#281831: lvm2: opendir errors at boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Kreileder <jk@blackdown.de>, 281831@bugs.debian.org, linux-lvm@redhat.com

On Thu, Nov 18, 2004 at 03:11:43AM +0100, Juergen Kreileder wrote:
> Package: lvm2
> Version: 2.00.25-1
> Severity: minor
> 
> I'm getting a bunch of "opendir" errors at startup on my PPC machine.
> They seem to be harmless as LVM otherwise works fine and /dev/linux
> looks after after startup:
> 
> lrwxrwxrwx  1 root root   22 2004-11-18 02:22 home -> /dev/mapper/linux-home
> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 srv -> /dev/mapper/linux-srv
> lrwxrwxrwx  1 root root   22 2004-11-18 02:22 swap -> /dev/mapper/linux-swap
> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 tmp -> /dev/mapper/linux-tmp
> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 usr -> /dev/mapper/linux-usr
> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 var -> /dev/mapper/linux-var
> lrwxrwxrwx  1 root root   25 2004-11-18 02:22 var_log -> /dev/mapper/linux-var_log
> 
> On an x86 machine with a similar setup I don't get these errors.  Both
> machines use udev.
> 
> ,----
> | Thu Nov 18 02:22:05 2004: Creating device-mapper devices...done.
> | Thu Nov 18 02:22:05 2004: Setting up LVM Volume Groups...
> | Thu Nov 18 02:22:05 2004:   Reading all physical volumes.  This may take a while...
> | Thu Nov 18 02:22:05 2004:   Found volume group "linux" using metadata type lvm2
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such file or directory
> | Thu Nov 18 02:22:05 2004:   7 logical volume(s) in volume group "linux" now active
> | Thu Nov 18 02:22:05 2004: Starting crypto disks:.
> | Thu Nov 18 02:22:05 2004: Checking all file systems...
> | Thu Nov 18 02:22:05 2004: fsck 1.35 (28-Feb-2004)
> | Thu Nov 18 02:22:05 2004: Setting kernel variables ...
> | Thu Nov 18 02:22:05 2004: ... done.
> | Thu Nov 18 02:22:05 2004: Mounting local filesystems...
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-home on /home type xfs (rw,noatime,nodiratime)
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-srv on /srv type xfs (rw,noatime,nodiratime)
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-tmp on /tmp type xfs (rw,noatime,nodiratime)
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-usr on /usr type xfs (rw,noatime,nodiratime)
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-var on /var type xfs (rw,noatime,nodiratime)
> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-var_log on /var/log type xfs (rw,noatime,nodiratime)
> `----
> 
> 
> -- System Information:
> Debian Release: 3.1
>   APT prefers unstable
>   APT policy: (500, 'unstable')
> Architecture: powerpc (ppc64)
> Kernel: Linux 2.6.10-rc2jk1
> Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)
> 
> Versions of packages lvm2 depends on:
> ii  debconf                     1.4.40       Debian configuration management sy
> ii  libc6                       2.3.2.ds1-18 GNU C Library: Shared libraries an
> ii  libdevmapper1.00            2:1.00.19-4  The Linux Kernel Device Mapper use
> ii  lvm-common                  1.5.17       The Logical Volume Manager for Lin
> 
> -- debconf information:
>   lvm2/snapshots:
 

I see this on my x86 box with udev installed so it's not PPC specific. 

-- 

patrick
