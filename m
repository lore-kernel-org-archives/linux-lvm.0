Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n472JxL8031820
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 22:19:59 -0400
Received: from mail-gx0-f158.google.com (mail-gx0-f158.google.com
	[209.85.217.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n472JbCD017824
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 22:19:38 -0400
Received: by gxk2 with SMTP id 2so1014995gxk.3
	for <linux-lvm@redhat.com>; Wed, 06 May 2009 19:19:37 -0700 (PDT)
MIME-Version: 1.0
Sender: jgspratt@gmail.com
In-Reply-To: <4A02268F.8010105@whgl.uni-frankfurt.de>
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
	<4A02268F.8010105@whgl.uni-frankfurt.de>
Date: Wed, 6 May 2009 19:19:37 -0700
Message-ID: <1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
Subject: Re: [linux-lvm] LVM and Truecrypt
From: Gordon Fogus <gordon.fogus@gmail.com>
Content-Type: multipart/alternative; boundary=001e680f13e8cc510c0469492499
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

--001e680f13e8cc510c0469492499
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Sven (and all),

I have been concerned that a failure on one of the disk controllers would
result in data loss in the following way:
1. A mainboard fails that has a JOBD RAID connected
2. The mainboard is replaced and the drives from the original set are
connected.
3. Because of hardware changes and/or operating system changes and/or "disk
order" changes, no data can be read from the RAID.
I'd be curious to know this: if I had a JOBD under LVM and I tried to plug
the disks into another PC entirely, would I be able to read the files I had
on those drives?  How does LVM know which drive was where in the order of
drives in the JOBD?

I am not actually worried about data loss from a drive failure.  I backup
regularly (but I have never had a hard drive fail.  I attribute this partly
to the temperature at which I keep my drives).  I have had several RAID
controller failures (which is why I no longer consider any RAID level to be
a backup).

By asking, "Is there any partuclar reason for using truecrypt?" do you mean,
"Why truecrypt as opposed to any other encryption solution?"?  If so, I use
truecrypt because it is opensource and has received a lot of attention from
experienced cryptographers.  I wouldn't trust closed source or obscure
encryption software.  On the other hand, if you were asking, "Why use
encryption?", then you might be interested in Sans news bites:
http://www.sans.org/newsletters/newsbites/ .  Sans covers many data leaks.

(Do you live in Scandinavia?)

Gordon

On Wed, May 6, 2009 at 5:08 PM, Sven Eschenberg
<sven@whgl.uni-frankfurt.de>wrote:

> Hi Gordon,
>
> Is there any particular Reason, why a mainboard failure should result in
> massive data loss?
> But you can be assured, that a disk failure in such a volume will most
> certainly result in massive dataloss, since the filesystem spans across all
> disks.
> Is there any partuclar reason for using truecrypt?
>
> Regards
>
> -Sven
>
> Gordon Fogus schrieb:
>
>> Hello all,
>>
>> I am trying to create a 10TB network share (like a NAS share, but with
>> permission levels) on a dedicated GNU+Linux server to be used on a
>> Linux/Windows network.
>>
>> I must use truecrypt for full drive encryption. I need the disks to be
>> independently mountable (no striping, parity bits or files spanning across
>> physical drives) (this is because I am afraid of massive data loss from a
>> mainboard failure.  If you can show me that this fear is unfounded and that
>> I would definitely be able to recover my data after a mainboard failure,
>> then I would not hesitate to use files spanning across drives). Most
>> importantly, the combined space of the disks (10TB) must appear as 10TB on
>> the network, not 10 @ 1TB drives (if I were using 1TB drives, for example).
>> Resonable continuous write speed is also a factor for me.
>> It is essential that this drive space can be "mounted" (i.e., "mount
>> network drive") on a Windows machine.
>> Different folders must be able to have different permissionn levels for
>> different users, similar to the permission levels available in Microsoft
>> shares (write new files/edit files/delete files/make new folders/delete
>> folders/etc.).  After someone connects to the file server, he must not be
>> able to access every file, only those specificly shared to him.
>>
>> Can someone point me to info on using truecrypt with LVM?
>> (I am new to GNU+Linux.  File serving on a Windows Active Directory server
>> is... unpredictable.)
>>
>> Gordon
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001e680f13e8cc510c0469492499
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Sven (and all),<br><br>I have been concerned that a failure on one of=
 the disk controllers would result in data loss in the following way:<br>1.=
 A mainboard fails that has a JOBD RAID connected<br>2. The mainboard is re=
placed and the drives from the original set are connected.<br>
3. Because of hardware changes and/or operating system changes and/or &quot=
;disk order&quot; changes, no data can be read from the RAID.<br>I&#39;d be=
 curious to know this: if I had a JOBD under LVM and I tried to plug the di=
sks into another PC entirely, would I be able to read the files I had on th=
ose drives?=A0 How does LVM know which drive was where in the order of driv=
es in the JOBD?<br>
<br>I am not actually worried about data loss from a drive failure.=A0 I ba=
ckup regularly (but I have never had a hard drive fail.=A0 I attribute this=
 partly to the temperature at which I keep my drives).=A0 I have had severa=
l RAID controller failures (which is why I no longer consider any RAID leve=
l to be a backup).<br>
<br>By asking, &quot;Is there any partuclar reason for using truecrypt?&quo=
t; do you mean, &quot;Why truecrypt as opposed to any other encryption solu=
tion?&quot;?=A0 If so, I use truecrypt because it is opensource and has rec=
eived a lot of attention from experienced cryptographers.=A0 I wouldn&#39;t=
 trust closed source or obscure encryption software.=A0 On the other hand, =
if you were asking, &quot;Why use encryption?&quot;, then you might be inte=
rested in Sans news bites: <a href=3D"http://www.sans.org/newsletters/newsb=
ites/">http://www.sans.org/newsletters/newsbites/</a> .=A0 Sans covers many=
 data leaks.<br>
<br>(Do you live in Scandinavia?)<br><br>Gordon<br><br><div class=3D"gmail_=
quote">On Wed, May 6, 2009 at 5:08 PM, Sven Eschenberg <span dir=3D"ltr">&l=
t;<a href=3D"mailto:sven@whgl.uni-frankfurt.de">sven@whgl.uni-frankfurt.de<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hi Gordon,<br>
<br>
Is there any particular Reason, why a mainboard failure should result in ma=
ssive data loss?<br>
But you can be assured, that a disk failure in such a volume will most cert=
ainly result in massive dataloss, since the filesystem spans across all dis=
ks.<br>
Is there any partuclar reason for using truecrypt?<br>
<br>
Regards<br>
<br>
-Sven<br>
<br>
Gordon Fogus schrieb:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div><div></div><=
div class=3D"h5">
Hello all,<br>
<br>
I am trying to create a 10TB network share (like a NAS share, but with perm=
ission levels) on a dedicated GNU+Linux server to be used on a Linux/Window=
s network.<br>
<br>
I must use truecrypt for full drive encryption. I need the disks to be inde=
pendently mountable (no striping, parity bits or files spanning across phys=
ical drives) (this is because I am afraid of massive data loss from a mainb=
oard failure. =A0If you can show me that this fear is unfounded and that I =
would definitely be able to recover my data after a mainboard failure, then=
 I would not hesitate to use files spanning across drives). Most importantl=
y, the combined space of the disks (10TB) must appear as 10TB on the networ=
k, not 10 @ 1TB drives (if I were using 1TB drives, for example). Resonable=
 continuous write speed is also a factor for me.<br>

It is essential that this drive space can be &quot;mounted&quot; (i.e., &qu=
ot;mount network drive&quot;) on a Windows machine.<br>
Different folders must be able to have different permissionn levels for dif=
ferent users, similar to the permission levels available in Microsoft share=
s (write new files/edit files/delete files/make new folders/delete folders/=
etc.). =A0After someone connects to the file server, he must not be able to=
 access every file, only those specificly shared to him.<br>

<br>
Can someone point me to info on using truecrypt with LVM? <br>
(I am new to GNU+Linux. =A0File serving on a Windows Active Directory serve=
r is... unpredictable.)<br>
<br>
Gordon<br>
<br>
<br></div></div>
------------------------------------------------------------------------<br=
>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--001e680f13e8cc510c0469492499--
