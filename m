Return-Path: <blutgens@sistina.com>
Date: Thu, 24 May 2001 07:29:41 -0500
From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] Is now: Resizing & LVM shutdown
Message-ID: <20010524072941.A17828@minime.sistina.com>
References: <Pine.LNX.4.33.0105232235480.29374-100000@UberGeek.coremetrics.com> <990663899.1165.0.camel@localhost> <3B0B548F.5020106@gecpalau.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <3B0B548F.5020106@gecpalau.com>; from glenn@gecpalau.com on Wed, May 23, 2001 at 03:11:27PM +0900
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
To: linux-lvm@sistina.com

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2001 at 03:11:27PM +0900, Glenn Shannon wrote:
>Rupert Heesom wrote:
>
>> On 23 May 2001 22:36:20 -0500, Austin Gonyou wrote:
>>=20
>>> I'd say use reiser of XFS for your LVM partition. The grow utilities are
>>> pretty kick ass and seem to work really well.

I run it as my root device with reiserfs on it and don't bother with init /
shutdown scripts. No problems.

>>=20
>>=20
>> Thanks for your advice.
>>=20
>> However, right now I need more help getting LVM to properly shut down
>> when the PC is unmounting the disks in the /etc/rc.d/init.d/halt script.
>>=20
>> An extract from another post of mine:
>>=20
>> I've discovered that my /etc/rc.d/init.d/halt script is set up
>> incorrectly for LVM.  When I previously installed LVM, I followed
>> instructions, and put a "vgchange -an" into the halt script just after
>> /proc is umounted.
>>=20
>> What I'm finding now is that when I'm shutting the PC down, vgchange is
>> complaining that it can't close the VG down because there's an active
>> partition (something like that).  I've had a look at the halt script,
>> and I can't figure out exactly how umounting the LV & deactivating the
>> VG would work.
>>=20
>> I put a tentative line right above the "/sbin/vgchange -an" saying
>> "umount /dev/vg/root".   However, if I'm unmounting root BEFORE
>> deactivating the VG, then the system won't find the /sbin/vgchange util
>> will it? =20
>>=20
>>>>>  I've tried shutting the PC down with that extra "halt" script line
>>>>=20
>> in there.  It doesn't help at all.
>>=20
>> I do have  /boot/initrd-lvm-2.4.3.gz which is used at boot time.  This
>> ramdisk does have /sbin/vgchange in it (which you probably know).  If
>> root is unmounted when /sbin/vgchange is called, will the system use the
>> ramdisk?   If so, how does it know to use it?   (I'm kinda new to
>> figuring out how ramdisks work, I just follow instructions and they
>> work!)
>>=20
>>=20
>>> --=20
>>> Austin Gonyou
>>> Systems Architect, CCNA
>>> Coremetrics, Inc.
>>> Phone: 512-796-9023
>>> email: austin@coremetrics.com
>>>=20
>>> On 23 May 2001, Rupert Heesom wrote:
>>>=20
>>>> As I write this, a new kernel is being compiled with the patch for
>>>> online ext2resizing.  According to xconfig, enabling the option was
>>>> DANGEROUS!
>>>>=20
>>>> As I think about it, since I've installed that root ramdisk (works
>>>> great), I don't actually need to be able to resize my LVM partition
>>>> mounted.  Still, it's good to have a kernel with such a capability.
>>>>=20
>>>> I'm not concerned now about UNMOUNTING / deactivating the LVM when
>>>> shutting the PC down.  That doesn't seem to be working at all.  (See
>>>> another post of mine re details there).
>>>>=20
>>>> Perhaps you would know how to help me there?  I'll experiment a bit
>>>> myself, but I'm afraid of damaging the LV, since when I reboot my PC,
>>>> the VG is not yet deactivated!  However it _has_ happened twice now
>>>> without a problem.
>>>>=20
>>>> On 23 May 2001 16:56:35 -0600, Andreas Dilger wrote:
>>>>=20
>>>>> If you patch your kernel with the online ext2 patches, you can resize
>>>>> your root partition while it is still mounted.  You will still need a
>>>>> reboot to install the new kernel, however, but only the one time.  See
>>>>> http://sourceforge.net/projects/ext2resize/
>>>>>=20
>>>>> It still isn't a bad idea to have a small non-LVM partition on one of
>>>>> your disks which has a kernel you can boot from, along with useful
>>>>> tools in /lib and /sbin.  I guess miniroot is such a thing.
>>>>=20
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@sistina.com
>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>=20
>Try this:
>
>Right before the line in your /etc/init.d/halt script (it may be named=20
>different than that however, like shutdown or maybe even reboot):
>
>Before the line that remounts the root (/) partition read-only, put the=20
>line:
>
>lsof >/lsof.output
>
>Then reboot. There should be a file in / called lsof.output. Read that=20
>and it will let you know all files in use (which would be the reason=20
>that it can't unmount the partition).
>
>Good luck!
>
>Glenn Shannon
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Ben Lutgens	=09
Sistina Software Inc.=09
MIS Geek
http://www.sistina.com/	<--- great software=20
http://www.gentoo.org/  <--- great distro
Kernel panic: I have no root and I want to scream <--- perfect error message

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7DP61LxkxGgLdGQgRApDgAJ9TuCtTUIBsKoPJMXQU+QFzTOQzeACdGDWI
2dGLLX5URYvUsrhWKQMnMHo=
=Ggyt
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
