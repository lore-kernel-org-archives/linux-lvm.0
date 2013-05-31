Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4V94GB3012603
	for <linux-lvm@redhat.com>; Fri, 31 May 2013 05:04:16 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4V94CPk027244
	for <linux-lvm@redhat.com>; Fri, 31 May 2013 05:04:13 -0400
From: Gabriel Barazer <gabriel@oxeva.fr>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0844B3A9-8374-4BD5-AE18-72CCCA7AFAA8"
Message-Id: <FFA8D6D8-8C13-41AF-8AAD-A42E9999BD6A@oxeva.fr>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Date: Fri, 31 May 2013 11:04:10 +0200
References: <51A7BE6D.3090609@gmail.com>
	<1369952053.99499.YahooMailClassic@web181504.mail.ne1.yahoo.com>
	<CAEh524ZjZRizYoEimXg0OsLxz2kD8HLu2bqw2V2RbjYKdggVxw@mail.gmail.com>
	<CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
In-Reply-To: <CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
Subject: Re: [linux-lvm] Fwd: file-based locking initialization failed after
	pvresize
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail=_0844B3A9-8374-4BD5-AE18-72CCCA7AFAA8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi,

Did you try booting off another system (e.g. live usb ) and restoring =
the LVM meta data ? If your root filesystem is still bootable, you can =
find a backup of the LVM metadata in /etc/lvm/backup, and then start =
over your data resizing procedure. Look for the vgcfgrestore command.

The right procedure to resize a LV after growing a PV is :
- adjust the partition table on sdb with fdisk, the simple way is =
deleting the partition table and creating a new one with the main =
partition having the same start offset (_very_ important)
- THEN pvresize the device (no need to add any --setphysicalwhatever =
argument)
- then lvresize, but if you want to be safe always check that the size =
you set is larger than the current volume size otherwise you can damage =
your data pretty bad. A good way to do this is to add a "+" in the =
lvresize command : lvresize -L +100G /device adds 100G to volume.
- then run a filesystem resize command, depending on the filesystem used =
(xfs_growfs for XFS, resize2fs for ext4)

Anyway, If you are going to use full disks with LVM, it's always easier =
to not even bother creating a partition table : use the whole device =
with LVM (/dev/sdX) instead of a partition (/dev/sdX1).

HTH,

Gabriel


On May 31, 2013, at 5:37 AM, Christian Lahti <clahti@gmail.com> wrote:

> Sorry forgot to copy the list.
>=20
> ---------- Forwarded message ----------
> From: Christian Lahti <clahti@gmail.com>
> Date: Thu, May 30, 2013 at 8:36 PM
> Subject: Re: [linux-lvm] file-based locking initialization failed =
after pvresize
> To: matthew patton <pattonme@yahoo.com>
>=20
>=20
> Thank you for your reply, I realize that I must have done something =
rather bone-headed and I am usually pretty clued.  That being said I am =
still in the same pickle I was in to begin with, something constructive =
would be fantastically appreciated.  If there were proper documentation =
*anywhere* google-able I would not have bothered the mailing list.  I am =
pretty sure the data must be in tact since this was done in single user =
mode and no writes to the disk/volume have occurred since the two =
commands were run, I have /etc/lvm in tact with information prior to and =
after the event.  If someone would be so kind as to please let me know =
exactly what information they might need, I will do my level best with =
minimum "back and forth" to provide such information to get out of said =
pickle.  And I furthermore promise not to do it again.
>=20
> /Christian
>=20
>=20
>=20
> On Thu, May 30, 2013 at 3:14 PM, matthew patton <pattonme@yahoo.com> =
wrote:
> What's with people and "extending" disks? DO NOT DO THAT!!!! But if =
you do, then you can't forget to do all the rest of the necessary steps. =
You have to fix the partition table. And you have to make sure your =
PVresize doesn't run off the end of the media. Is VMware's 250G really =
250G when probed by PVscan? Doubt it very much.
>=20
> Next time don't partition disks for starters. And "grow" filesystems =
by ADDing disks and adding them to the volume group and then resize2fs. =
Just because Windows was written for dummies and lets you get away with =
what you did, doesn't mean you should attempt it in Linux if you don't =
know what you're doing.
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail=_0844B3A9-8374-4BD5-AE18-72CCCA7AFAA8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div><br></div><div>Did you try booting off another system (e.g. =
live usb ) and restoring the LVM meta data ? If your root filesystem is =
still bootable, you can find a backup of the LVM metadata in =
/etc/lvm/backup, and then start over your data resizing procedure. Look =
for the vgcfgrestore command.</div><div><br></div><div>The right =
procedure to resize a LV after growing a PV is :</div><div>- adjust the =
partition table on sdb with fdisk, the simple way is deleting the =
partition table and creating a new one with the main partition having =
the same start offset (_very_ important)</div><div>- THEN pvresize the =
device (no need to add any --setphysicalwhatever argument)</div><div>- =
then lvresize, but if you want to be safe always check that the size you =
set is larger than the current volume size otherwise you can damage your =
data pretty bad. A good way to do this is to add a "+" in the lvresize =
command : lvresize -L +100G /device adds 100G to volume.</div><div>- =
then run a filesystem resize command, depending on the filesystem used =
(xfs_growfs for XFS, resize2fs for =
ext4)</div><div><br></div><div>Anyway, If you are going to use full =
disks with LVM, it's always easier to not even bother creating a =
partition table : use the whole device with LVM (/dev/sdX) instead of a =
partition =
(/dev/sdX1).</div><div><br></div><div>HTH,</div><div><br></div><div>Gabrie=
l</div><div><br></div><div><br><div><div>On May 31, 2013, at 5:37 AM, =
Christian Lahti &lt;<a =
href=3D"mailto:clahti@gmail.com">clahti@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr">Sorry forgot to copy the =
list.<br><br><div class=3D"gmail_quote">---------- Forwarded message =
----------<br>From: <b class=3D"gmail_sendername">Christian Lahti</b> =
<span dir=3D"ltr">&lt;<a =
href=3D"mailto:clahti@gmail.com">clahti@gmail.com</a>&gt;</span><br>
Date: Thu, May 30, 2013 at 8:36 PM<br>Subject: Re: [linux-lvm] =
file-based locking initialization failed after pvresize<br>To: matthew =
patton &lt;<a =
href=3D"mailto:pattonme@yahoo.com">pattonme@yahoo.com</a>&gt;<br><br><br><=
div dir=3D"ltr">
Thank you for your reply, I realize that I must have done something =
rather bone-headed and I am usually pretty clued. &nbsp;That being said =
I am still in the same pickle I was in to begin with, something =
constructive would be fantastically appreciated. &nbsp;If there were =
proper documentation *anywhere* google-able I would not have bothered =
the mailing list. &nbsp;I am pretty sure the data must be in tact since =
this was done in single user mode and no writes to the disk/volume have =
occurred since the two commands were run, I have /etc/lvm in tact with =
information prior to and after the event. &nbsp;If someone would be so =
kind as to please let me know exactly what information they might need, =
I will do my level best with minimum "back and forth" to provide such =
information to get out of said pickle. &nbsp;And I furthermore promise =
not to do it again.<span class=3D"HOEnZb"><font color=3D"#888888"><div>

<br></div><div>/Christian</div><div><br></div></font></span></div><div =
class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On Thu, May 30, 2013 at 3:14 PM, matthew patton =
<span dir=3D"ltr">&lt;<a href=3D"mailto:pattonme@yahoo.com" =
target=3D"_blank">pattonme@yahoo.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">What's with people and =
"extending" disks? DO NOT DO THAT!!!! But if you do, then you can't =
forget to do all the rest of the necessary steps. You have to fix the =
partition table. And you have to make sure your PVresize doesn't run off =
the end of the media. Is VMware's 250G really 250G when probed by =
PVscan? Doubt it very much.<br>


<br>
Next time don't partition disks for starters. And "grow" filesystems by =
ADDing disks and adding them to the volume group and then resize2fs. =
Just because Windows was written for dummies and lets you get away with =
what you did, doesn't mean you should attempt it in Linux if you don't =
know what you're doing.<br>


</blockquote></div><br></div>
</div></div></div><br></div>
_______________________________________________<br>linux-lvm mailing =
list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</blockquote></div><br></div></body></html=
>=

--Apple-Mail=_0844B3A9-8374-4BD5-AE18-72CCCA7AFAA8--
