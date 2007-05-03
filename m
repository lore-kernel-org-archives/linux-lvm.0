Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l43CNgUN011776
	for <linux-lvm@redhat.com>; Thu, 3 May 2007 13:23:43 +0100
Message-ID: <4639D56F.9070802@redhat.com>
Date: Thu, 03 May 2007 13:28:31 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to remove crashed inaccessible harddrive from
	LVM2.
References: <aad5bb0705030448i100ffe37of929baac081535b4@mail.gmail.com>
In-Reply-To: <aad5bb0705030448i100ffe37of929baac081535b4@mail.gmail.com>
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

Damir Hasakovic wrote:
> Hi everyone,
> 
> I have a big big issue with my LVM2 system. Im running Debian 3.1 with
> 6 harddrives and no RAID. Last drive that i added have now crashed.
> When i boot the machine, during the bootproecess fsck starts to check
> LVM and after 50 % terminal gets filled with I/O error. I have tracked
> down wich HDD is the crashed one.
> 
> The problem is i cant't type anything in terminal because it spits I/O
> error every 5 secs. What i can do is to connect via SSH and than i can
> navigate through the system but as soon i type for example "lvdisplay"
> or anything that have to do with LVM the SSH session hangs.
> 
> Im very desperate to get this system upp and running.
> 
> Other drives are full and working. Is there any way to just remove the
> last hardrive. I don't care about the information that is on the last
> driver because it's just couple of movies and some pics.
> 
> Please help if u can :)
> 

LVM2 allows you to activate partial volume groups and to remove missing
physical volumes via the --partial and --removemissing options to
vgchange and vgreduce. See the manual pages for full details.

It sounds like your failed drive has not 'gone away' but is throwing I/O
errors for some sectors and maybe causing system hangs. You might be
better off disconnecting it and booting the system into a rescue
environment to perform the recovery of the volume group since it does
not contain important data you want to recover.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGOdVv6YSQoMYUY94RAkmJAJ9V2faGbFKgpH5CIHLDrzFJL7lazgCfcpfm
nz6q3j33RKyQuNKzWgPRAC0=
=OAqy
-----END PGP SIGNATURE-----
