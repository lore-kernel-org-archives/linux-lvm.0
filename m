From: Anders Widman <andewid@tnonline.net>
Message-ID: <17119627843.20030119220632@tnonline.net>
Subject: Re: SV: [linux-lvm] Getting 200GB ATA133 and Promise Ultra133 to work
In-Reply-To: <001201c2bfe1$06996c20$4201a8c0@eagle>
References: <001201c2bfe1$06996c20$4201a8c0@eagle>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Sun Jan 19 15:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Bjorn <programmer@spk.cc>
Cc: linux-lvm@sistina.com

> Yes, I bought Promise Ultra ATA/133 controller thinking this would supp=
ort
> big drives.
> One problem is support for LBA48, which 2.4.18 didn't have.

> What is the difference between LVM1 and LVM2? Do I have to redo the lvm
> using LVM2 to get access to big disc support?

No, LVM 1 support big drives. I am using 160GB Maxtor without problems
with LVM 1 and Promis U133 cards and kernels 2.4.19+.

Have  you  checked  the partition table on the drive? Try removing the
old  one  and  create  use  the  entire  disk  with  LVM, instead of a
partition.

> Regards,

> //Bjorn

>> -----Ursprungligt meddelande-----
>> Fr=E5n: Anders Widman [mailto:andewid@tnonline.net]
>> Skickat: den 19 januari 2003 16:58
>> Till: Bjorn
>> Kopia: linux-lvm@sistina.com
>> =C4mne: Re: [linux-lvm] Getting 200GB ATA133 and Promise Ultra133 to w=
ork
>>=20
>> > Hello!
>>=20
>> > I have Slackware 8.1 and activated lvm on 4 200GB Maxtor ATA133 driv=
es.
>> > Only 130 GB became useable on each drive. Upgrading Linux kernel to
>> 2.4.20
>> > and downloading LVM2 and device mapper from sestina. Doing 2.4.19 pa=
tch
>> on
>> > 2.4.20. Still lvm thinks it is 130 GB drives.
>> > What is the trick to use 200GB drives?
>>=20
>> Do  you  have  a  IDE  controller  that  support  BIG Drive Technology
>> (132GB+)?
>>=20
>> > Regards,
>>=20
>> > //Bjorn
>>=20


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
