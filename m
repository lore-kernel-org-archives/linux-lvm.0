Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBMFp6gI019978
	for <linux-lvm@redhat.com>; Fri, 22 Dec 2006 10:51:07 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.233])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBMFp4cu018554
	for <linux-lvm@redhat.com>; Fri, 22 Dec 2006 10:51:04 -0500
Received: by wr-out-0506.google.com with SMTP id 50so1435348wri
	for <linux-lvm@redhat.com>; Fri, 22 Dec 2006 07:51:04 -0800 (PST)
Message-ID: <859a78260612220751n3f0570abgdf4e865fabeb90d5@mail.gmail.com>
Date: Fri, 22 Dec 2006 09:51:04 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Mirror between different SAN fabrics
In-Reply-To: <2482337.1166623357215.JavaMail.mailer@post.ch>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_35851_481326.1166802664049"
References: <2482337.1166623357215.JavaMail.mailer@post.ch>
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

------=_Part_35851_481326.1166802664049
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can't think of any Volume Manager that would let you mirror disks from 2
separate VGs... I know Veritas won't let you, unless they've changed
something in the last version or 2... But other than that I wouldn't see why
you couldn't use 2 different fabrics, they're just disks to LVM... If you're
having trouble managing 200+ PVs, just build the LV first using only disks
from 1 fabric, then make the second fabric available/visible, and add a
mirror using only those disks... I think that would work...

On 12/20/06, mathias.herzog@postfinance.ch <mathias.herzog@postfinance.ch>
wrote:
>
> Hi,
>
> Using lvm2, I would like to mirror a logical volume between two
> different SAN fabrics to guarantee high availability for my data, even
> if a whole SAN fabric crashes.
> Is there a possibility in lvm2 to define two volume groups, put the
> disks from fabric1 into group 1 and the disks from fabric2 into group 2
> and then create the mirror over the two groups? I didn't find much
> documentation for lvm2 about this, I just know that other Volume
> Managers can handle it.
>
> It's essential to group the discs together because I use like 100 discs
> for each mirror and I have to be sure that mirroring takes place between
> the two different SAN storages.
>
> Mathias
>
>
>
> Sicherheitshinweis:
> Dieses E-Mail von PostFinance ist signiert. Weitere Informationen finden
> Sie unter:
> https://www.postfinance.ch/e-signature.
> Geben Sie Ihre Sicherheitselemente niemals Dritten bekannt.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>

------=_Part_35851_481326.1166802664049
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I can&#39;t think of any Volume Manager that would let you mirror disks from 2 separate VGs... I know Veritas won&#39;t let you, unless they&#39;ve changed something in the last version or 2... But other than that I wouldn&#39;t see why you couldn&#39;t use 2 different fabrics, they&#39;re just disks to LVM... If you&#39;re having trouble managing 200+ PVs, just build the LV first using only disks from 1 fabric, then make the second fabric available/visible, and add a mirror using only those disks... I think that would work...
<br><br><div><span class="gmail_quote">On 12/20/06, <b class="gmail_sendername"><a href="mailto:mathias.herzog@postfinance.ch">mathias.herzog@postfinance.ch</a></b> &lt;<a href="mailto:mathias.herzog@postfinance.ch">mathias.herzog@postfinance.ch
</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hi,<br><br>Using lvm2, I would like to mirror a logical volume between two
<br>different SAN fabrics to guarantee high availability for my data, even<br>if a whole SAN fabric crashes.<br>Is there a possibility in lvm2 to define two volume groups, put the<br>disks from fabric1 into group 1 and the disks from fabric2 into group 2
<br>and then create the mirror over the two groups? I didn&#39;t find much<br>documentation for lvm2 about this, I just know that other Volume<br>Managers can handle it.<br><br>It&#39;s essential to group the discs together because I use like 100 discs
<br>for each mirror and I have to be sure that mirroring takes place between<br>the two different SAN storages.<br><br>Mathias<br><br><br><br>Sicherheitshinweis:<br>Dieses E-Mail von PostFinance ist signiert. Weitere Informationen finden Sie unter:
<br><a href="https://www.postfinance.ch/e-signature">https://www.postfinance.ch/e-signature</a>.<br>Geben Sie Ihre Sicherheitselemente niemals Dritten bekannt.<br><br>_______________________________________________<br>linux-lvm mailing list
<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br><br></blockquote></div><br>

------=_Part_35851_481326.1166802664049--
