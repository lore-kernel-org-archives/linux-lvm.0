Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4JDr30D000948
	for <linux-lvm@redhat.com>; Fri, 19 May 2006 09:53:03 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4JDqtxF008322
	for <linux-lvm@redhat.com>; Fri, 19 May 2006 09:52:56 -0400
Received: by py-out-1112.google.com with SMTP id 39so857210pyu
	for <linux-lvm@redhat.com>; Fri, 19 May 2006 06:52:55 -0700 (PDT)
Message-ID: <87f94c370605190652w64f92cfl91ea9bc3d59925a3@mail.gmail.com>
Date: Fri, 19 May 2006 09:52:55 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] realtime snapshot or ?
In-Reply-To: <1282.85.107.14.146.1146382053.squirrel@85.107.14.146>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_64783_27512109.1148046775611"
References: <1282.85.107.14.146.1146382053.squirrel@85.107.14.146>
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
To: omer@faruk.net, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_64783_27512109.1148046775611
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 4/30/06, Omer Faruk Sen <omer@faruk.net> wrote:
>
> <snip>
>
> I have found that nbd ord drbd does similar things. But nbd just exports =
a
> block device (JUST ONE block device) so other machines can mount it. DRBD
> is closer to what I want but I can't mount drbd on secondary (backup
> machine) even as read-only


You should check out drbd 0.8 and see if it still has the same restriction.
0.8 is in beta or pre-release.  It is supposed to allow "active/active"
environments.  I believe a clustered FS like GFS is intended to be used wit=
h
the new functionality, but it may be that the slave can do a read-only
mount.  If not, you could use GFS as your filesystem and achieve your goal.
The big trouble with that is locking.  I'm pretty sure GFS only does file
locking.  Not very helpful for a DB.

Greg
--=20
Greg Freemyer
The Norcross Group
Forensics for the 21st Century

------=_Part_64783_27512109.1148046775611
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div><span class=3D"gmail_quote">On 4/30/06, <b class=3D"gmail_send=
ername">Omer Faruk Sen</b> &lt;<a href=3D"mailto:omer@faruk.net">omer@faruk=
.net</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border=
-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-lef=
t: 1ex;">
&lt;snip&gt;<br><br>I have found that nbd ord drbd does similar things. But=
 nbd just exports a<br>block device (JUST ONE block device) so other machin=
es can mount it. DRBD<br>is closer to what I want but I can't mount drbd on=
 secondary (backup
<br>machine) even as read-only</blockquote><div><br>You should check out dr=
bd 0.8 and see if it still has the same restriction.&nbsp; 0.8 is in beta o=
r pre-release.&nbsp; It is supposed to allow &quot;active/active&quot;&nbsp=
; environments.&nbsp; I believe a clustered FS  like GFS is intended to be =
used with the new functionality, but it may be that the slave can do a read=
-only mount.&nbsp; If not, you could use GFS as your filesystem and achieve=
 your goal.&nbsp; The big trouble with that is locking.&nbsp; I'm pretty su=
re GFS only does file locking.&nbsp; Not very helpful for a DB.
<br></div><br></div>Greg<br>-- <br>Greg Freemyer<br>The Norcross Group<br>F=
orensics for the 21st Century

------=_Part_64783_27512109.1148046775611--
