Subject: Re: [linux-lvm] Addiing new hdd to pv group
MIME-Version: 1.0 (Apple Message framework v481)
From: Stephan Budach <stephan.budach@jvm.de>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020430154018.B4879@sistina.com>
Message-Id: <EA604318-5C51-11D6-AAFE-000393452E7E@jvm.de>
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
Date: Tue Apr 30 10:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Heinz,

well yes, after doing a makewhatis i found the vgextend command and that=20=

was absolutely what I was looking for.

I also followed som eadvice from this list and excluded autoconfig.h=20
from liblvm.h and compiling went smoothly on my RH 7.2.93 box. Just if=20=

anybody wanted to know...

Thanks,
Stephan

Am Dienstag den, 30. April 2002, um 15:40, schrieb Heinz J . =
Mauelshagen:

>
> Stephan,
>
> recent LVM versions have a pvresize command, which can add the space =
of
> a grown partition/device to a physical volume stored in that =
partition.
>
> You can't combine seperate devices (like 2 different disks) this way.
>
> If hdd is a free disk, just run pvcreate on it and use vgextend to add=20=

> it
> to one of your existing volume groups.
>
> On Mon, Apr 29, 2002 at 04:30:59PM +0200, Stephan Budach wrote:
>> Hi,
>>
>> is it possible to expand an existing pv with an additional hdd, =
without
>> loosing data, of course?
>>
>> Thanks,
>> Stephan
>> --
>> Stephan Budach
>>
>> Jung von Matt/Services
>>
>> Glash=FCttenstrasse 38   			20357 Hamburg
>> Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
>> eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
> -=3D-=3D-
>
> Heinz Mauelshagen                                 Sistina Software =
Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
> -=3D-=3D-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
--
Stephan Budach

Jung von Matt/Services

Glash=FCttenstrasse 38   			20357 Hamburg
Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
