Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35Hvj5t003638
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:57:45 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.227])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k35HvbLh029747
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:57:37 -0400
Received: by wproxy.gmail.com with SMTP id i23so1600882wra
	for <linux-lvm@redhat.com>; Wed, 05 Apr 2006 10:57:37 -0700 (PDT)
Message-ID: <859a78260604051057r23b2da4bsd6388a2e193bda66@mail.gmail.com>
Date: Wed, 5 Apr 2006 12:57:37 -0500
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] pvmove to smaller PVs
In-Reply-To: <20060405174425.GX4197@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_12432_12240738.1144259857715"
References: <1144258458.32119.8.camel@pc7.dolda2000.com>
	<20060405174425.GX4197@agk.surrey.redhat.com>
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

------=_Part_12432_12240738.1144259857715
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm no expert, mostly just a lurker on this list, but couldn't you SoftRAID
the 4 120GB's together then PV move the 300GB to the logical disk?

On 4/5/06, Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Wed, Apr 05, 2006 at 07:34:18PM +0200, Fredrik Tolf wrote:
> > Can pvmove not just divide that storage into three "partitions",
>
> There's no logic to do that yet.  It can only move complete sets of
> contiguous extents.
>
> > Is there a way for me to tell it to do so?
>
> As you found: break up contiguous extents explicitly on
> the command line by telling it to move smaller parts that it
> can handle.
>
> Use '--alloc anywhere' if you need to move data within a single PV.
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_12432_12240738.1144259857715
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm no expert, mostly just a lurker on this list, but couldn't you SoftRAID=
 the 4 120GB's together then PV move the 300GB to the logical disk?<br><br>=
<div><span class=3D"gmail_quote">On 4/5/06, <b class=3D"gmail_sendername">A=
lasdair G Kergon
</b> &lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</a>&gt; wrote:</s=
pan><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(2=
04, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">On Wed, Apr 0=
5, 2006 at 07:34:18PM +0200, Fredrik Tolf wrote:
<br>&gt; Can pvmove not just divide that storage into three &quot;partition=
s&quot;,<br><br>There's no logic to do that yet.&nbsp;&nbsp;It can only mov=
e complete sets of<br>contiguous extents.<br><br>&gt; Is there a way for me=
 to tell it to do so?
<br><br>As you found: break up contiguous extents explicitly on<br>the comm=
and line by telling it to move smaller parts that it<br>can handle.<br><br>=
Use '--alloc anywhere' if you need to move data within a single PV.<br>
<br>Alasdair<br>--<br><a href=3D"mailto:agk@redhat.com">agk@redhat.com</a><=
br><br>_______________________________________________<br>linux-lvm mailing=
 list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><b=
r>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=
=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><=
br>
</blockquote></div><br>

------=_Part_12432_12240738.1144259857715--
