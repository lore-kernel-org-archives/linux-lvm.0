Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAIIBIr01306
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 13:11:18 -0500
Received: from mwinf0212.wanadoo.fr (smtp2.wanadoo.fr [193.252.22.29])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAIIBCDQ016422
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 13:11:12 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0212.wanadoo.fr (SMTP Server) with SMTP id 8CF031800081
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 19:11:06 +0100 (CET)
Received: from tangerine.coulon.evette
	(ADijon-107-1-9-154.w81-249.abo.wanadoo.fr [81.249.29.154])
	by mwinf0212.wanadoo.fr (SMTP Server) with ESMTP id 073831800138
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 19:11:06 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1CUqk7-0003Dv-BW
	for linux-lvm@redhat.com; Thu, 18 Nov 2004 19:10:51 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25851-10 for <linux-lvm@redhat.com>;
	Thu, 18 Nov 2004 19:10:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1CUqjr-0003DY-FP
	for linux-lvm@redhat.com; Thu, 18 Nov 2004 19:10:35 +0100
Date: Thu, 18 Nov 2004 18:10:34 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] Re: Bug#281831: lvm2: opendir errors at boot
References: <87fz376h40.fsf@blackdown.de>
	<20041118091857.GB23843@tykepenguin.com>
In-Reply-To: <20041118091857.GB23843@tykepenguin.com> (from
	patrick@debian.org on Thu Nov 18 10:18:57 2004)
Message-Id: <1100801435l.12688l.3l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-a5+C/SpAVsaztsXw/jOZ"
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
To: linux-lvm@redhat.com

--=-a5+C/SpAVsaztsXw/jOZ
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 18.11.2004 10:18:57, Patrick Caulfield a =E9crit=A0:
>On Thu, Nov 18, 2004 at 03:11:43AM +0100, Juergen Kreileder wrote:
>> Package: lvm2
>> Version: 2.00.25-1
>> Severity: minor
>>
>> I'm getting a bunch of "opendir" errors at startup on my PPC =20
>> machine.
>> They seem to be harmless as LVM otherwise works fine and /dev/linux
>> looks after after startup:
>>
>> lrwxrwxrwx  1 root root   22 2004-11-18 02:22 home ->
>/dev/mapper/linux-home
>> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 srv ->
>/dev/mapper/linux-srv
>> lrwxrwxrwx  1 root root   22 2004-11-18 02:22 swap ->
>/dev/mapper/linux-swap
>> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 tmp ->
>/dev/mapper/linux-tmp
>> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 usr ->
>/dev/mapper/linux-usr
>> lrwxrwxrwx  1 root root   21 2004-11-18 02:22 var ->
>/dev/mapper/linux-var
>> lrwxrwxrwx  1 root root   25 2004-11-18 02:22 var_log ->
>/dev/mapper/linux-var_log
>>
>> On an x86 machine with a similar setup I don't get these errors.
>Both
>> machines use udev.
>>
>> ,----
>> | Thu Nov 18 02:22:05 2004: Creating device-mapper devices...done.
>> | Thu Nov 18 02:22:05 2004: Setting up LVM Volume Groups...
>> | Thu Nov 18 02:22:05 2004:   Reading all physical volumes.  This =20
>> may
>take a while...
>> | Thu Nov 18 02:22:05 2004:   Found volume group "linux" using
>metadata type lvm2
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   /dev/linux: opendir failed: No such
>file or directory
>> | Thu Nov 18 02:22:05 2004:   7 logical volume(s) in volume group
>"linux" now active
>> | Thu Nov 18 02:22:05 2004: Starting crypto disks:.
>> | Thu Nov 18 02:22:05 2004: Checking all file systems...
>> | Thu Nov 18 02:22:05 2004: fsck 1.35 (28-Feb-2004)
>> | Thu Nov 18 02:22:05 2004: Setting kernel variables ...
>> | Thu Nov 18 02:22:05 2004: ... done.
>> | Thu Nov 18 02:22:05 2004: Mounting local filesystems...
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-home on /home type xfs
>(rw,noatime,nodiratime)
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-srv on /srv type xfs
>(rw,noatime,nodiratime)
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-tmp on /tmp type xfs
>(rw,noatime,nodiratime)
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-usr on /usr type xfs
>(rw,noatime,nodiratime)
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-var on /var type xfs
>(rw,noatime,nodiratime)
>> | Thu Nov 18 02:22:05 2004: /dev/mapper/linux-var_log on /var/log
>type xfs (rw,noatime,nodiratime)
>> `----
>>
>>
>> -- System Information:
>> Debian Release: 3.1
>>   APT prefers unstable
>>   APT policy: (500, 'unstable')
>> Architecture: powerpc (ppc64)
>> Kernel: Linux 2.6.10-rc2jk1
>> Locale: LANG=3Den_US.UTF-8, LC_CTYPE=3Den_US.UTF-8 (charmap=3DUTF-8)
>>
>> Versions of packages lvm2 depends on:
>> ii  debconf                     1.4.40       Debian configuration
>management sy
>> ii  libc6                       2.3.2.ds1-18 GNU C Library: Shared
>libraries an
>> ii  libdevmapper1.00            2:1.00.19-4  The Linux Kernel Device
>Mapper use
>> ii  lvm-common                  1.5.17       The Logical Volume
>Manager for Lin
>>
>> -- debconf information:
>>   lvm2/snapshots:
>
>
>I see this on my x86 box with udev installed so it's not PPC specific.

I have it also on one machine : K6-2 500.

On this machine I've a system entirely relying on lvm (but the /boot =20
partition), on this system, I've not these messages

On a separate partition, I've the same version of linux but not using =20
lvm at all. At boot time it scans the system for vg's and then I've the =20
warning messages.

>
>--
>
>patrick


Jean-Luc

--=-a5+C/SpAVsaztsXw/jOZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBnOWbUdGGXzzGnNARAtQ7AJ9Ye36nhP6JIEeqmHyLyVHUAlC+7QCgkKfP
lXAG75UnbTkT45FI51kUT8M=
=hZil
-----END PGP SIGNATURE-----

--=-a5+C/SpAVsaztsXw/jOZ--
