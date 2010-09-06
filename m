Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o86IiDGx014746
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 14:44:13 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o86Ii5Td012011
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2010 14:44:05 -0400
Received: by gyd8 with SMTP id 8so2036871gyd.33
	for <linux-lvm@redhat.com>; Mon, 06 Sep 2010 11:44:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1283753187.12826.52@raydesk1.bettercgi.com>
References: <4c844eef.6482e50a.4cd8.ffff8f39@mx.google.com>
	<1283753187.12826.52@raydesk1.bettercgi.com>
From: Misc Things <formisc@gmail.com>
Date: Mon, 6 Sep 2010 14:43:45 -0400
Message-ID: <AANLkTimppj==nUyU+AOiMtA5jf6kKLYiNVtneNG71Z9J@mail.gmail.com>
Content-Type: multipart/alternative; boundary=0015174ff2d23546df048f9baa41
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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

--0015174ff2d23546df048f9baa41
Content-Type: text/plain; charset=ISO-8859-1

Thank you Ray, that explains it.
Andrew

On Mon, Sep 6, 2010 at 2:06 AM, Ray Morris <support@bettercgi.com> wrote:

> On 09/05/2010 09:16:09 PM, For Miscelenious wrote:
>
>  Re: extended partition overlap .
>>
>> Speaking of partitions. I'm looking at my other drives,
>>  they do not have an extended partition somehow.
>> I always thought that the only way to cteate multiple
>> partitions is to have one primary and one extended. And
>> then further partition it. Is it a case or lm just been naive?
>>
>
>  You can have up to four primary partitions.  The previous statement
> is oversimplying, though, and not quite true.  Technically,
> the partition table always lists _exactly_ four partitions, though
> some may have zero size.  The reason you can (and must) have four
> is beause there are exactly 64 bytes which tell where those partitions
> are and what type they are.  More can not be described in the space
> allowed.
>
>  Of those four, one may be an extended partition.  Extended
> partitions contain a partition table within the partition which
> allows for four more partitions, one of which may be another
> extended partition.
>
>   All of the above is true of the DOS partition table format.
> Remember in that format the whole partition table is 64 bytes -
> sixteen bytes per partition.  The size of the partition is soted
> in four bytes, and it's starting position in another four bytes.
> Those four bytes are enough to describe a partition of up to 2 TB,
> and one starting up to 2TB from the beginning of the disk.
> Therefore, the DOS partition tabel format can only be used with
> drives smaller than 4TB, and loses functionallity on drives more
> than 2TB.  To get over 2TB, one must use a newer type of partition
> table such as GPT.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
>
> On 09/05/2010 09:16:09 PM, For Miscelenious wrote:
>
>> -- I appologies for the terrible spelling - writing from the cell phone is
>> not smth I do well.
>>
>> Re: extended partition overlap .
>> Agree, that would be really stupid. Speaking of partitions. I'm looking at
>> my other drives, they do not have an extended partition somehow. I always
>> thought that the only way to cteate multiple partitions is to have one
>> primary and one extended. And then further partition it. Is it a case or lm
>> just been naive?
>>
>> Re: log/messagesI actually have it (tail on /var/log/messages) defaulted
>> to 11 terminal- old habbit. And thru the whole ordeal I didn't see anything
>> worth mentioning.
>>
>> Thank you.
>> Andrew
>> -----Original message-----
>> From: Stuart D Gathman <stuart@bmsi.com>
>> To: linux-lvm@redhat.com
>> Sent: Sun, Sep 5, 2010 23:23:18 GMT+00:00
>> Subject: Re: [linux-lvm] Important diretories are missing after adding
>> space.
>>
>>
> ------quoted attachment------
>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0015174ff2d23546df048f9baa41
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you Ray, that explains it.<br>Andrew<br><br><div class=3D"gmail_quote=
">On Mon, Sep 6, 2010 at 2:06 AM, Ray Morris <span dir=3D"ltr">&lt;<a href=
=3D"mailto:support@bettercgi.com">support@bettercgi.com</a>&gt;</span> wrot=
e:<br>

<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 09/05/2010 09:=
16:09 PM, For Miscelenious wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Re: extended partition overlap .<div class=3D"im"><br>
Speaking of partitions. I&#39;m looking at my other drives,<br>
=A0they do not have an extended partition somehow.<br>
I always thought that the only way to cteate multiple<br>
partitions is to have one primary and one extended. And<br>
then further partition it. Is it a case or lm just been naive?<br>
</div></blockquote>
<br>
 =A0You can have up to four primary partitions. =A0The previous statement<b=
r>
is oversimplying, though, and not quite true. =A0Technically,<br>
the partition table always lists _exactly_ four partitions, though<br>
some may have zero size. =A0The reason you can (and must) have four<br>
is beause there are exactly 64 bytes which tell where those partitions<br>
are and what type they are. =A0More can not be described in the space<br>
allowed.<br>
<br>
 =A0Of those four, one may be an extended partition. =A0Extended<br>
partitions contain a partition table within the partition which<br>
allows for four more partitions, one of which may be another<br>
extended partition.<br>
<br>
 =A0 All of the above is true of the DOS partition table format.<br>
Remember in that format the whole partition table is 64 bytes -<br>
sixteen bytes per partition. =A0The size of the partition is soted<br>
in four bytes, and it&#39;s starting position in another four bytes.<br>
Those four bytes are enough to describe a partition of up to 2 TB,<br>
and one starting up to 2TB from the beginning of the disk.<br>
Therefore, the DOS partition tabel format can only be used with<br>
drives smaller than 4TB, and loses functionallity on drives more<br>
than 2TB. =A0To get over 2TB, one must use a newer type of partition<br>
table such as GPT.<br>
--<br>
Ray Morris<br>
<a href=3D"mailto:support@bettercgi.com" target=3D"_blank">support@bettercg=
i.com</a><br>
<br>
Strongbox - The next generation in site security:<br>
<a href=3D"http://www.bettercgi.com/strongbox/" target=3D"_blank">http://ww=
w.bettercgi.com/strongbox/</a><br>
<br>
Throttlebox - Intelligent Bandwidth Control<br>
<a href=3D"http://www.bettercgi.com/throttlebox/" target=3D"_blank">http://=
www.bettercgi.com/throttlebox/</a><br>
<br>
Strongbox / Throttlebox affiliate program:<br>
<a href=3D"http://www.bettercgi.com/affiliates/user/register.php" target=3D=
"_blank">http://www.bettercgi.com/affiliates/user/register.php</a><div clas=
s=3D"im"><br>
<br>
<br>
On 09/05/2010 09:16:09 PM, For Miscelenious wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div class=
=3D"im">
-- I appologies for the terrible spelling - writing from the cell phone is =
not smth I do well.<br>
<br>
Re: extended partition overlap .<br>
Agree, that would be really stupid. Speaking of partitions. I&#39;m looking=
 at my other drives, they do not have an extended partition somehow. I alwa=
ys thought that the only way to cteate multiple partitions is to have one p=
rimary and one extended. And then further partition it. Is it a case or lm =
just been naive?<br>


<br></div>
Re: log/messagesI actually have it (tail on /var/log/messages) defaulted to=
 11 terminal- old habbit. And thru the whole ordeal I didn&#39;t see anythi=
ng worth mentioning.<div class=3D"im"><br>
Thank you.<br>
Andrew<br>
-----Original message-----<br>
From: Stuart D Gathman &lt;<a href=3D"mailto:stuart@bmsi.com" target=3D"_bl=
ank">stuart@bmsi.com</a>&gt;<br>
To: <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@red=
hat.com</a><br>
Sent: Sun, Sep 5, 2010 23:23:18 GMT+00:00<br>
Subject: Re: [linux-lvm] Important diretories are missing after adding spac=
e.<br>
<br>
</div></blockquote><div><div></div><div class=3D"h5">
<br>
------quoted attachment------<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
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
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--0015174ff2d23546df048f9baa41--
