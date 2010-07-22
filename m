Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6MNWRke013863
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:32:27 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6MNWIQ2008223
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 19:32:18 -0400
Received: by pwi5 with SMTP id 5so3962061pwi.33
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 16:32:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100721185404.GA14889@bdmcc-us.com>
References: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
	<20100721185404.GA14889@bdmcc-us.com>
Date: Thu, 22 Jul 2010 16:32:18 -0700
Message-ID: <AANLkTiks7RESsKs1Qjs-P67suhY3tP8lc6ERFfUfjKwZ@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd2df4c409991048c0254e3
Subject: Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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

--000e0cd2df4c409991048c0254e3
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 21, 2010 at 11:54 AM, Brian McCullough <bdmc@bdmcc-us.com>wrote:

> On Wed, Jul 21, 2010 at 11:34:45AM -0700, Ken Bass wrote:
>

> Most of them (that I am interested in)were either image files (jpg, png,
> > bmp), ISO images (DVD, CD), music files (mp3, flac, etc), and a few MS
> > executables. Is there a utiliity that can help restore these files, maybe
> > scan the lost+found files for these types?
>
> Not a lot of help, probably, but the "file" command should at least give
> you some idea of what type of files they are.
>
>
Actually seems to be more help than I thought possible. I ran it
(recursively) through all of the files in the lost+found and the output sent
to a file. Looking through it, I first found several ISO files, and since
they all had labels as part of the structure, I could just move and rename
them.

Next I found a whole lot of audio type files, tagged with ID3. But that was
all of the information "file" could give. Is there a utility to read ID3
tags and generate a file name from it? I seem to remember I had many GBs of
mp3's, flac's, ape's, etc.,  and that would be a real tedious pain to try to
recognize and rename all of them :-(.

The same goes for MS applications (.exe). "file" did recognize them as such,
but, like the audio files, it didn't give enough information to tell what
they were.

So at least this debacle was not a complete unrecoverable catastrophe :-).
Thanks to everyone who helped.

FWIW: I got some helpful information from this page at Novell's site:
http://www.novell.com/coolsolutions/appnote/19386.html . But if you look at
the last step, it does say that if the first PV is trashed, you will be in
the same position as I was. Maybe someone should put together a wiki page
with that and the procedure I just went through? Just a wishful thought.

Thanks again,

ken

--000e0cd2df4c409991048c0254e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Jul 21, 2010 at 11:54 AM, Brian =
McCullough <span dir=3D"ltr">&lt;<a href=3D"mailto:bdmc@bdmcc-us.com">bdmc@=
bdmcc-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<div class=3D"im">On Wed, Jul 21, 2010 at 11:34:45AM -0700, Ken Bass wrote:=
</div></blockquote><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<div class=3D"im">&gt; Most of them (that I am interested in)were either im=
age files (jpg, png,<br>
&gt; bmp), ISO images (DVD, CD), music files (mp3, flac, etc), and a few MS=
<br>
&gt; executables. Is there a utiliity that can help restore these files, ma=
ybe<br>
&gt; scan the lost+found files for these types?<br>
<br>
</div>Not a lot of help, probably, but the &quot;file&quot; command should =
at least give you some idea of what type of files they are.<br>
<br></blockquote></div><br>Actually seems to be more help than I thought po=
ssible. I ran it (recursively) through all of the files in the lost+found a=
nd the output sent to a file. Looking through it, I first found several ISO=
 files, and since they all had labels as part of the structure, I could jus=
t move and rename them.<br>
<br>Next I found a whole lot of audio type files, tagged with ID3. But that=
 was all of the information &quot;file&quot; could give. Is there a utility=
 to read ID3 tags and generate a file name from it? I seem to remember I ha=
d many GBs of mp3&#39;s, flac&#39;s, ape&#39;s, etc.,=A0 and that would be =
a real tedious pain to try to recognize and rename all of them :-(.<br>
<br>The same goes for MS applications (.exe). &quot;file&quot; did recogniz=
e them as such, but, like the audio files, it didn&#39;t give enough inform=
ation to tell what they were.<br><br>So at least this debacle was not a com=
plete unrecoverable catastrophe :-). Thanks to everyone who helped.<br>
<br>FWIW: I got some helpful information from this page at Novell&#39;s sit=
e: <a href=3D"http://www.novell.com/coolsolutions/appnote/19386.html">http:=
//www.novell.com/coolsolutions/appnote/19386.html</a> . But if you look at =
the last step, it does say that if the first PV is trashed, you will be in =
the same position as I was. Maybe someone should put together a wiki page w=
ith that and the procedure I just went through? Just a wishful thought.<br>
<br>Thanks again,<br><br>ken<br><br><br>

--000e0cd2df4c409991048c0254e3--
