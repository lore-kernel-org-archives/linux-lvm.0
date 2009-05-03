Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n438oV8W023158
	for <linux-lvm@redhat.com>; Sun, 3 May 2009 04:50:31 -0400
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n438oFQN008179
	for <linux-lvm@redhat.com>; Sun, 3 May 2009 04:50:16 -0400
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id CE63FE08084
	for <linux-lvm@redhat.com>; Sun,  3 May 2009 10:50:08 +0200 (CEST)
Received: from [192.168.1.4] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp6-g21.free.fr (Postfix) with ESMTP id D11F6E080E6
	for <linux-lvm@redhat.com>; Sun,  3 May 2009 10:50:05 +0200 (CEST)
Message-ID: <49FD5ABD.4000506@free.fr>
Date: Sun, 03 May 2009 10:50:05 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm ownership of special access node
References: <49FC7C24.6030702@fastmail.fm> <20090502194445.GI6466@racke>
In-Reply-To: <20090502194445.GI6466@racke>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lars Ellenberg a =EF=BF=BDcrit :
> On Sat, May 02, 2009 at 02:00:20PM -0300, sebastian muniz wrote:
>> Hello list.
>> First post. Sorry  if this has already been discussed. I have search a  =

>> while with no luck.
>> I need to mount a home directory for a user from a lvolume.
>> For instance, I created
>>  ACTIVE            '/dev/vg1/sebahome' [5.00 GB] inherit
>>
>> and need it mounted on /home/seba
>> However, when I mount it on /home/seba permissions get root:root
>>
>> orion:~# ls -ld /home/seba
>> drwxr-xr-x 4 root root 4096 2009-05-02 02:34 /home/seba
>>
>> I think that
>>
>> seba@orion:~$ ls -la /dev/vg1/sebahome
>> lrwxrwxrwx 1 root root 24 2009-05-02 04:25 /dev/vg1/sebahome -> =20
>> /dev/mapper/vg1-sebahome
>> seba@orion:~$ ls -la /dev/mapper/vg1-sebahome
>> brw-rw---- 1 root disk 254, 3 2009-05-02 04:25 /dev/mapper/vg1-sebahome
>>
>> is the reason.
>> Is there any way to create the special access node with other owner:group
>> like the
>> vxassist --user --group in veritas?
>> Or is there any mount option I am now aware of?
>=20
> mount /dev/vg1/sebahome /home/seba
> chown owner:group /home/seba
>=20
> should do the trick ;-)
>=20
> once a file system gets mounted,
> the ownership of its "/" overrides the ownership of the mount point.
>=20
> 	Lars
>=20
Hi !
It is good practice to give root only access to the mount point BEFORe=20
it is mounted and user's full ownership of the mounted filesystem.
This way, if the file system is not mounted for any reason, the user=20
won't be allowed to create any file under the mount point and you'll=20
know becaus he WILL complain....
Hope this helps.

--=20
If the only tool you have is a hammer, you tend to see every problem as=20
a nail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.
