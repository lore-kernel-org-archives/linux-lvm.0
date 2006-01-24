Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k0ONMNao028224
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 18:22:24 -0500
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <CF88E297901EB040B49935FE71B99A2D01F49F06@CTTRBEXVS01.oxhp.com>
References: <CF88E297901EB040B49935FE71B99A2D01F49F06@CTTRBEXVS01.oxhp.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2-923951504
Message-Id: <bb68293a6bbb32905dada1ade18d05e3@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] file descriptor 3 left open
Date: Tue, 24 Jan 2006 17:22:21 -0600
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-2-923951504
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	delsp=yes;
	format=flowed

What do you mean by "not working", the rpm command seems to think the =20=

files are installed...  Take a look in /boot/grub/menu.lst and see if =20=

the kernel is in there and it is the default to boot (default =3D 0 for =20=

the first kernel listed)

  brassow

On Jan 24, 2006, at 5:07 PM, Kapadia, Nayan U. wrote:

> Thanks, but that looks okay to me.
> =A0
> Not working:
> =A0
> rpm -ql kernel-smp-2.6.9-22.0.2.EL |grep boot
> /boot/System.map-2.6.9-22.0.2.ELsmp
> /boot/config-2.6.9-22.0.2.ELsmp
> /boot/vmlinuz-2.6.9-22.0.2.ELsmp
> /lib/modules/2.6.9-22.0.2.ELsmp/kernel/drivers/mtd/redboot.ko
> =A0
> =A0
> Working:
> =A0
> rpm -ql kernel-smp-2.6.9-22.0.1.EL |grep boot
> =A0
> =A0
>
> /boot/System.map-2.6.9-22.0.1.ELsmp
> /boot/config-2.6.9-22.0.1.ELsmp
> /boot/vmlinuz-2.6.9-22.0.1.ELsmp
> /lib/modules/2.6.9-22.0.1.ELsmp/kernel/drivers/mtd/redboot.ko
>
>
> =A0
> Any ideas?
> =A0
> =A0
>
> From: linux-lvm-bounces@redhat.com =20
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Jonathan E Brassow
> Sent: Tuesday, January 24, 2006 5:49 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] file descriptor 3 left open
>
> IIRC, these are merely informative messages saying that, "Hey, the =20
> person who called me forgot to close some of their file descriptors, =20=

> like they were suppose to. But don't worry, I'll close them for you."
>
> That would have been too long though, so I think they chose a more =20
> cryptic message.
>
> As far as your kernel installation problem, I'm not sure what's wrong =20=

> there...
>
> You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if it is =20=

> installed. If it is, you could 'rpm -ql kernel-<the version> | grep =20=

> boot' to see if the image was correctly installed...
>
> brassow
>
> On Jan 24, 2006, at 3:55 PM, Kapadia, Nayan U. wrote:
>
>> I keep seeing "file descriptor 3 left open" at boot after the initrd =20=

>> is loaded.=A0 The systems boots to the 2.6.9-22.0.1 kernel and works =20=

>> fine.=A0 I have ran fsck against all filesystems however the error =20=

>> messages still appears.=A0 I noticed that when I run =
system-config-lvm =20
>> these errors are more predominant.=A0
>> File descriptor 13 left open
>> File descriptor 3 left open
>> File descriptor 4 left open
>> File descriptor 8 left open
>> File descriptor 9 left open
>> File descriptor 10 left open
>> File descriptor 11 left open
>> File descriptor 12 left open
>> File descriptor 13 left open
>> File descriptor 3 left open
>> File descriptor 4 left open
>> File descriptor 8 left open
>> File descriptor 9 left open
>> File descriptor 10 left open
>> File descriptor 11 left open
>> File descriptor 12 left open
>> File descriptor 13 left open
>> I recently installed the new kernel 2.6.9-22.0.2 but the system does =20=

>> not find kernel at boot.=A0 I think the file descriptor messages are =
a =20
>> symptom to some greater problem.=A0 Please help.
>> thank you!
>> Nayan
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at =20
>> http://tldp.org/HOWTO/LVM-HOWTO/=20
>> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=

--Apple-Mail-2-923951504
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

What do you mean by "not working", the rpm command seems to think the
files are installed...  Take a look in /boot/grub/menu.lst and see if
the kernel is in there and it is the default to boot (default =3D 0 for
the first kernel listed)


 brassow


On Jan 24, 2006, at 5:07 PM, Kapadia, Nayan U. wrote:


=
<excerpt><fontfamily><param>Arial</param><color><param>0000,0000,FFFF</par=
am><smaller>Thanks,
but that looks okay to me.</smaller></color></fontfamily>

=A0

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>Not
working:</smaller></color></fontfamily>

=A0

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>rpm
-ql kernel-smp-2.6.9-22.0.2.EL |grep boot</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/System.map-2.6.9-22.0.2.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/config-2.6.9-22.0.2.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/vmlinuz-2.6.9-22.0.2.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/lib/modules/2.6.9-22.0.2.ELsmp/kernel/drivers/mtd/redboot.ko</smaller>=
</color></fontfamily>

=A0

=A0

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>Working:</smaller></color></fontfamily>

=A0

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>rpm
-ql kernel-smp-2.6.9-22.0.1.EL |grep boot</smaller></color></fontfamily>

=A0

<fontfamily><param>Arial</param>=A0</fontfamily>


=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/System.map-2.6.9-22.0.1.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/config-2.6.9-22.0.1.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/boot/vmlinuz-2.6.9-22.0.1.ELsmp</smaller></color></fontfamily>

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>/lib/modules/2.6.9-22.0.1.ELsmp/kernel/drivers/mtd/redboot.ko</smaller>=
</color></fontfamily>



=A0

=
<fontfamily><param>Arial</param><color><param>0000,0000,FFFF</param><small=
er>Any
ideas?</smaller></color></fontfamily>

=A0

=A0


<bold><smaller>From:</smaller></bold><smaller>
linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
<bold>On Behalf Of </bold>Jonathan E Brassow</smaller>

<bold><smaller>Sent:</smaller></bold><smaller> Tuesday, January 24,
2006 5:49 PM</smaller>

<bold><smaller>To:</smaller></bold><smaller> LVM general discussion
and development</smaller>

<bold><smaller>Subject:</smaller></bold><smaller> Re: [linux-lvm] file
descriptor 3 left open</smaller>


IIRC, these are merely informative messages saying that, "Hey, the
person who called me forgot to close some of their file descriptors,
like they were suppose to. But don't worry, I'll close them for you."


That would have been too long though, so I think they chose a more
cryptic message.


As far as your kernel installation problem, I'm not sure what's wrong
there...


You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if it is
installed. If it is, you could 'rpm -ql kernel-<<the version> | grep
boot' to see if the image was correctly installed...


brassow


On Jan 24, 2006, at 3:55 PM, Kapadia, Nayan U. wrote:


<excerpt><fontfamily><param>Arial</param><smaller>I keep seeing "file
descriptor 3 left open" at boot after the initrd is loaded.=A0 The
systems boots to the 2.6.9-22.0.1 kernel and works fine.=A0 I have ran
fsck against all filesystems however the error messages still
appears.=A0 I noticed that when I run system-config-lvm these errors are
more predominant.=A0</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 13 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 3 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 4 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 8 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 9 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 10 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 11 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 12 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 13 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 3 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 4 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 8 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 9 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 10 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 11 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 12 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>File descriptor 13 left
open</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>I recently installed the new
kernel 2.6.9-22.0.2 but the system does not find kernel at boot.=A0 I
think the file descriptor messages are a symptom to some greater
problem.=A0 Please help.</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>thank
you!</smaller></fontfamily>=20

<fontfamily><param>Arial</param><smaller>Nayan</smaller></fontfamily>=20


_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at
=
http://tldp.org/HOWTO/LVM-HOWTO/__________________________________________=
_____

</excerpt>linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>=

--Apple-Mail-2-923951504--
