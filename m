Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3EFVgea008321
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 11:31:42 -0400
Received: from mail-iw0-f200.google.com (mail-iw0-f200.google.com
	[209.85.214.200])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3EFVc4i005804
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 11:31:38 -0400
Received: by iwn3 with SMTP id 3so3976141iwn.3
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 08:31:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110413224025.GA18589@redhat.com>
Message-ID: <20cf3054a0590b032304a0e29f43@google.com>
Date: Thu, 14 Apr 2011 15:31:38 +0000
From: DarkNovaNick@gmail.com
Content-Type: multipart/alternative; boundary=20cf3054a0590b030504a0e29f40
Subject: Re: [linux-lvm] [PATCH] dm snapshot: add discard support to the
 snapshot-origin target [was: Re: Testing TRIM wi
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--20cf3054a0590b030504a0e29f40
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On Apr 13, 2011 5:40pm, Mike Snitzer <snitzer@redhat.com> wrote:

> Unfortunately, the failed discard to the snapshot-origin device disables

> ext4's discards for the entire volume (even after you remove the

> snapshot).



> But the following patch fixes that:



> Subject: dm snapshot: add discard support to the snapshot-origin target



> Allow the snapshot-origin target to pass discards to the origin device

> (after any copyout of the region being discarded; but generally speaking

> that copyout won't be needed as the region will have already been copied

> to the cow).



> So for example, when you remove a file from an ext4 mounted origin

> volume it triggers copyout to the snapshot. When the DISCARD is then

> issued during the subsequent journal commit no copyout is needed.



> Signed-off-by: Mike Snitzer snitzer@redhat.com>

> ---

> drivers/md/dm-snap.c | 3 ++-

> 1 files changed, 2 insertions(+), 1 deletions(-)



> diff --git a/drivers/md/dm-snap.cb/drivers/md/dm-snap.c

> index a2d3309..028d216 100644

> --- a/drivers/md/dm-snap.c

> +++ b/drivers/md/dm-snap.c

> @@ -2076,6 +2076,7 @@ static int origin_ctr(struct dm_target *ti,  
> unsigned int argc, char **argv)



> ti->private = dev;

> ti->num_flush_requests = 1;

> + ti->num_discard_requests = 1;



> return 0;

> }

> @@ -2153,7 +2154,7 @@ static int origin_iterate_devices(struct dm_target  
> *ti,



> static struct target_type origin_target = {

> .name = "snapshot-origin",

> - .version = {1, 7, 1},

> + .version = {1, 8, 0},

> .module = THIS_MODULE,

> .ctr = origin_ctr,

> .dtr = origin_dtr,



Thanks, I will put that patch in my kernel. Do you anticipate this change  
making its way into the main kernel source at some point in the future?  
Thanks again,

Nick

--20cf3054a0590b030504a0e29f40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Apr 13, 2011 5:40pm, Mike Snitzer &lt;snitzer@redhat.com&gt; wrote:<br /=
>&gt; <br />&gt; Unfortunately, the failed discard to the snapshot-origin d=
evice disables<br />&gt; <br />&gt; ext4&#39;s discards for the entire volu=
me (even after you remove the<br />&gt; <br />&gt; snapshot).<br />&gt; <br=
 />&gt; <br />&gt; <br />&gt; But the following patch fixes that:<br />&gt;=
 <br />&gt; <br />&gt; <br />&gt; Subject: dm snapshot: add discard support=
 to the snapshot-origin target<br />&gt; <br />&gt; <br />&gt; <br />&gt; A=
llow the snapshot-origin target to pass discards to the origin device<br />=
&gt; <br />&gt; (after any copyout of the region being discarded; but gener=
ally speaking<br />&gt; <br />&gt; that copyout won&#39;t be needed as the =
region will have already been copied<br />&gt; <br />&gt; to the cow).<br /=
>&gt; <br />&gt; <br />&gt; <br />&gt; So for example, when you remove a fi=
le from an ext4 mounted origin<br />&gt; <br />&gt; volume it triggers copy=
out to the snapshot. =A0When the DISCARD is then<br />&gt; <br />&gt; issue=
d during the subsequent journal commit no copyout is needed.<br />&gt; <br =
/>&gt; <br />&gt; <br />&gt; Signed-off-by: Mike Snitzer snitzer@redhat.com=
&gt;<br />&gt; <br />&gt; ---<br />&gt; <br />&gt; =A0drivers/md/dm-snap.c =
| =A0 =A03 ++-<br />&gt; <br />&gt; =A01 files changed, 2 insertions(+), 1 =
deletions(-)<br />&gt; <br />&gt; <br />&gt; <br />&gt; diff --git a/driver=
s/md/dm-snap.c b/drivers/md/dm-snap.c<br />&gt; <br />&gt; index a2d3309..0=
28d216 100644<br />&gt; <br />&gt; --- a/drivers/md/dm-snap.c<br />&gt; <br=
 />&gt; +++ b/drivers/md/dm-snap.c<br />&gt; <br />&gt; @@ -2076,6 +2076,7 =
@@ static int origin_ctr(struct dm_target *ti, unsigned int argc, char **ar=
gv)<br />&gt; <br />&gt; <br />&gt; <br />&gt;  =A0 =A0 =A0 =A0ti-&gt;priva=
te =3D dev;<br />&gt; <br />&gt;  =A0 =A0 =A0 =A0ti-&gt;num_flush_requests =
=3D 1;<br />&gt; <br />&gt; + =A0 =A0 =A0 ti-&gt;num_discard_requests =3D 1=
;<br />&gt; <br />&gt; <br />&gt; <br />&gt;  =A0 =A0 =A0 =A0return 0;<br /=
>&gt; <br />&gt; =A0}<br />&gt; <br />&gt; @@ -2153,7 +2154,7 @@ static int=
 origin_iterate_devices(struct dm_target *ti,<br />&gt; <br />&gt; <br />&g=
t; <br />&gt; =A0static struct target_type origin_target =3D {<br />&gt; <b=
r />&gt;  =A0 =A0 =A0 =A0.name =A0 =A0=3D &quot;snapshot-origin&quot;,<br /=
>&gt; <br />&gt; - =A0 =A0 =A0 .version =3D {1, 7, 1},<br />&gt; <br />&gt;=
 + =A0 =A0 =A0 .version =3D {1, 8, 0},<br />&gt; <br />&gt;  =A0 =A0 =A0 =
=A0.module =A0=3D THIS_MODULE,<br />&gt; <br />&gt;  =A0 =A0 =A0 =A0.ctr =
=A0 =A0 =3D origin_ctr,<br />&gt; <br />&gt;  =A0 =A0 =A0 =A0.dtr =A0 =A0 =
=3D origin_dtr,<br />&gt; <br /><br /><br />Thanks, I will put that patch i=
n my kernel. Do you anticipate this change making its way into the main ker=
nel source at some point in the future? Thanks again,<br /><br />Nick
--20cf3054a0590b030504a0e29f40--
