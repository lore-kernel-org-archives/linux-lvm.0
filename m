Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KJsmV12783
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 15:54:48 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KJsgNC019659
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 15:54:42 -0400
Received: by qproxy.gmail.com with SMTP id c12so444651qbc
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 12:54:42 -0700 (PDT)
Message-ID: <170fa0d20510201254t60dbd4d6r510c41149ff5487b@mail.gmail.com>
Date: Thu, 20 Oct 2005 15:54:41 -0400
From: Mike Snitzer <snitzer@gmail.com>
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
In-Reply-To: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9944_15797150.1129838081954"
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
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

------=_Part_9944_15797150.1129838081954
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 10/19/05, Craig Hagerman <craighagerman@gmail.com> wrote:
>
> Hi,
>
> I recently got a new HD and thought it was about time I started using
> LVM. Unfortunatly, I think I have ended up loosing all of my data due
> to a typo. I would like to know if my data is lost forever. If not,
> what can I do now to recover. Here is the whole story...


You've changed the partition table of /dev/sdb but the data itself _should_
still be intact (changing the type shouldn't adversely affect the offsets o=
f
your sdb1 partition). You might try the type change on /dev/sda2 and then
restore the backup of the media_vg's VGDA from /etc/lvm/backup/media_vg
using pvcreate and vgcfgrestore, something like:

pvcreate --restorefile /etc/lvm/backup/media_vg --uuid
rlnV4y-B4eJ-Pyc0-RLJm-2Zbv-t04C-dxzU1A /dev/sdb1
pvcreate --restorefile /etc/lvm/backup/media_vg --uuid
ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6
/dev/sda2
vgcfgrestore -f /etc/lvm/backup/media_vg test_vg

That said, its unclear to me why /dev/sda2 is unknown... so take my advise
at your own risk ;)

------=_Part_9944_15797150.1129838081954
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><div><span class=3D"gmail_quote">On 10/19/05, <b class=3D"gmail_sendern=
ame">Craig Hagerman</b> &lt;<a href=3D"mailto:craighagerman@gmail.com">crai=
ghagerman@gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" =
style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8=
ex; padding-left: 1ex;">
Hi,<br><br>I recently got a new HD and thought it was about time I started =
using<br>LVM. Unfortunatly, I think I have ended up loosing all of my data =
due<br>to a typo. I would like to know if my data is lost forever. If not,
<br>what can I do now to recover. Here is the whole story...</blockquote><d=
iv><br>
You've changed the partition table of /dev/sdb but the data itself
_should_ still be intact (changing the type shouldn't adversely affect
the offsets of your sdb1 partition).&nbsp; You might try the type
change on /dev/sda2 and then restore the backup of the media_vg's VGDA
from /etc/lvm/backup/media_vg using pvcreate and vgcfgrestore,
something like:<br>
<br>
pvcreate --restorefile /etc/lvm/backup/media_vg --uuid rlnV4y-B4eJ-Pyc0-RLJ=
m-2Zbv-t04C-dxzU1A /dev/sdb1<br>
pvcreate --restorefile /etc/lvm/backup/media_vg --uuid <span class=3D"q">ZH=
l4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6 </span>/dev/sda2<span class=3D"q"></sp=
an><br>
vgcfgrestore -f /etc/lvm/backup/media_vg test_vg<br>
<br>
That said, its unclear to me why /dev/sda2 is unknown...&nbsp; so take my a=
dvise at your own risk ;) <br>
<br>
<br>
<br>
<br>
</div></div><br>

------=_Part_9944_15797150.1129838081954--
