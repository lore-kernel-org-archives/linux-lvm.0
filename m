Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u440uhga005393
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 20:56:43 -0400
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 852CC7DCC1
	for <linux-lvm@redhat.com>; Wed,  4 May 2016 00:56:41 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d62so39882522iof.2
	for <linux-lvm@redhat.com>; Tue, 03 May 2016 17:56:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1614984310.1700582.1462280490763.JavaMail.yahoo@mail.yahoo.com>
References: <1614984310.1700582.1462280490763.JavaMail.yahoo.ref@mail.yahoo.com>
	<1614984310.1700582.1462280490763.JavaMail.yahoo@mail.yahoo.com>
Date: Tue, 3 May 2016 20:56:40 -0400
Message-ID: <CALm7yL3d+Rj0r7gkA_pdT9eBK9-GCbh3b65+DVPLTsdAAetaQQ@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c056102dc67b50531f9b216
Subject: Re: [linux-lvm] thin handling of available space
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

--94eb2c056102dc67b50531f9b216
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 9:01 AM, matthew patton <pattonme@yahoo.com> wrote:

> On Mon, 5/2/16, Mark Mielke <mark.mielke@gmail.com> wrote:
> <quote>
>  very small use case in reality. I think large service
>  providers would use Ceph or EMC or NetApp, or some such
>  technology to provision large amounts of storage per
>  customer, and LVM would be used more at the level of a
>  single customer, or a single machine.
> </quote>
>
> Ceph?!? yeah I don't think so.
>

I don't use Ceph myself. I only listed it as it may be more familiar to
others, and because I was responding to a Red Hat engineer. We use NetApp
and EMC for the most part.


> If you thin-provision an EMC/Netapp volume and the block device runs out
> of blocks (aka Raid Group is full) all volumes on it will drop OFFLINE.
> They don't even go RO. Poof, they disappear. Why? Because there is no
> guarantee that every NFS client, every iSCSI client, every FC client is
> going to do the right thing. The only reliable means of telling everyone
> "shit just broke" is for the asset to disappear.
>

I think you are correct. Based upon experience, I don't recall this ever
happening, but upon reflection, it may just be that our IT team always
caught the situation before it became too bad, and either extended the
storage, or asked permission to delete snapshots.



> All in-flight writes to the volume that the array ACK'd are still good
> even if they haven't been de-staged to the intended device thanks to NVRAM
> and the array's journal device.
>

Right. A good feature. An outage occurs, but the data that was properly
written stays written.


<quote>
>  In these cases, I
>  would expect that LVM thin volumes should not be used across
>  multiple customers without understanding the exact type of
>  churn expected, to understand what the maximum allocation
>  that would be required.
> </quote>
>
> sure, but that spells responsible sysadmin. Xen's post implied he didn't
> want to be bothered to manage his block layer  that magically the FS' job
> was to work closely with the block layer to suss out when it was safe to
> keep accepting writes. There's an answer to "works closely with block
> layer" - it's spelled BTRFS and ZFS.
>

I get a bit lost here in the push towards BTRFS and ZFS for people with
these expectations as I see BTRFS and ZFS as having a similar problem. They
can both still fill up. They just might get closer to 100% utilization
before they start to fail.

My use case isn't about reaching closer to 100% utilization. For example,
when I first proposed our LVM thinp model for dealing with host-side
snapshots, there were people in my team that felt that "fstrim" should be
run very frequently (even every 15 minutes!), so as to make maximum use of
the available free space across multiple volumes and reduce churn captured
in snapshots. I think anybody with this perspective really should be
looking at BTRFS or ZFS. Myself, I believe fstrim should run once a week or
less, and not really to save space, but more to hint to the flash device
which blocks are definitely not in use over time, to make the best use of
the flash storage over time. If we start to pass 80%, I raise the alarm
that we need to consider increasing the local storage, or moving more
content out of the thin volumes. Usually we find out that more-than-normal
churn occurred, and we just need to prune a few snapshots to drop below 50%
again. I still made them move the content that doesn't need to be snapshot
out of the thin volume, and to a stand-alone LVM thick volume so as to
entirely eliminate this churn from being trapped in snapshots and
accumulating.


LVM has no obligation to protect careless sysadmins doing dangerous things
> from themselves. There is nothing wrong with using THIN every which way you
> want just as long as you understand and handle the eventuality of extent
> exhaustion. Even thin snaps go invalid if it needs to track a change and
> can't allocate space for the 'copy'.
>

Right.


> Amazon would make sure to have enough storage to meet my requirement if I
> need them.
>
> Yes, because Amazon is a RESPONSIBLE sysadmin and has put in place tools
> to manage the fact they are thin-provisoning and to make damn sure they can
> cash the checks they are writing.
>

Right.



> > the nature of the block device, such as "how much space
> > do you *really* have left?"
>
> So you're going to write and then backport "second guess the block layer"
> code to all filesystems in common use and god knows how many versions back?
> Of course not. Just try to get on the EXT developer mailing list and ask
> them to write "block layer second-guessing code (aka branch on device
> flag=thin)" because THINP will cause problems for the FS when it runs out
> of extents. To which the obvious and correct response will be "Don't use
> THINP if you're not prepared to handle it's pre-requisites."
>

Bad things happen. Sometimes they happen very quickly. I don't intend to
dare fate, but if fate comes knocking, I prefer to be prepared. For
example, we had two monitoring systems in place for one particularly
critical piece of storage, where the application is particularly poor at
dealing with "out of space". No thin volumes in use here. Thick volumes all
the way. The system on the storage appliance stopped sending notifications
a few weeks prior as a result of some mistake during a reconfiguration or
upgrade. The separate monitoring system using entirely different software
and configuration, on different host, also failed for a different reason
that I no longer recall. The volume became full, and the application data
was corrupted in a bad way that required recovery. My immediate reaction
after best addressing the corruption, was to demand three monitoring
systems instead of two. :-)




> > you and the other people. You think the block storage should
> > be as transparent as possible, as if the storage was not
> > thin. Others, including me, think that this theory is
> > impractical
> Then by all means go ahead and retrofit all known filesystems with the
> extra logic. ALL of the filesystems were written with the understanding
> that the block layer is telling the truth and that any "white lie" was
> benign in so much that it would be made good and thus could be assumed to
> be "truth" for practical purpose.


I think this relates more closely to your other response, that I will
respond to separately...


-- 
Mark Mielke <mark.mielke@gmail.com>

--94eb2c056102dc67b50531f9b216
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Tue, May 3, 2016 at 9:01 AM, matthew patton <span =
dir=3D"ltr">&lt;<a href=3D"mailto:pattonme@yahoo.com" target=3D"_blank">pat=
tonme@yahoo.com</a>&gt;</span> wrote:<br></div><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 5/2/16, Ma=
rk Mielke &lt;<a href=3D"mailto:mark.mielke@gmail.com">mark.mielke@gmail.co=
m</a>&gt; wrote:<br>
&lt;quote&gt;<br>
<span class=3D"">=C2=A0very small use case in reality. I think large servic=
e<br>
=C2=A0providers would use Ceph or EMC or NetApp, or some such<br>
=C2=A0technology to provision large amounts of storage per<br>
=C2=A0customer, and LVM would be used more at the level of a<br>
=C2=A0single customer, or a single machine.<br>
</span>&lt;/quote&gt;<br>
<br>
Ceph?!? yeah I don&#39;t think so.<br></blockquote><div><br></div><div>I do=
n&#39;t use Ceph myself. I only listed it as it may be more familiar to oth=
ers, and because I was responding to a Red Hat engineer. We use NetApp and =
EMC for the most part.</div><div>=C2=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
If you thin-provision an EMC/Netapp volume and the block device runs out of=
 blocks (aka Raid Group is full) all volumes on it will drop OFFLINE. They =
don&#39;t even go RO. Poof, they disappear. Why? Because there is no guaran=
tee that every NFS client, every iSCSI client, every FC client is going to =
do the right thing. The only reliable means of telling everyone &quot;shit =
just broke&quot; is for the asset to disappear.<br></blockquote><div><br></=
div><div>I think you are correct. Based upon experience, I don&#39;t recall=
 this ever happening, but upon reflection, it may just be that our IT team =
always caught the situation before it became too bad, and either extended t=
he storage, or asked permission to delete snapshots.</div><div><br></div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
All in-flight writes to the volume that the array ACK&#39;d are still good =
even if they haven&#39;t been de-staged to the intended device thanks to NV=
RAM and the array&#39;s journal device.<br></blockquote><div><br></div><div=
>Right. A good feature. An outage occurs, but the data that was properly wr=
itten stays written.</div><div><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
&lt;quote&gt;<br>
<span class=3D"">=C2=A0In these cases, I<br>
=C2=A0would expect that LVM thin volumes should not be used across<br>
=C2=A0multiple customers without understanding the exact type of<br>
=C2=A0churn expected, to understand what the maximum allocation<br>
=C2=A0that would be required.<br>
</span>&lt;/quote&gt;<br>
<br>
sure, but that spells responsible sysadmin. Xen&#39;s post implied he didn&=
#39;t want to be bothered to manage his block layer=C2=A0 that magically th=
e FS&#39; job was to work closely with the block layer to suss out when it =
was safe to keep accepting writes. There&#39;s an answer to &quot;works clo=
sely with block layer&quot; - it&#39;s spelled BTRFS and ZFS.<br></blockquo=
te><div><br></div><div>I get a bit lost here in the push towards BTRFS and =
ZFS for people with these expectations as I see BTRFS and ZFS as having a s=
imilar problem. They can both still fill up. They just might get closer to =
100% utilization before they start to fail.</div><div><br></div><div>My use=
 case isn&#39;t about reaching closer to 100% utilization. For example, whe=
n I first proposed our LVM thinp model for dealing with host-side snapshots=
, there were people in my team that felt that &quot;fstrim&quot; should be =
run very frequently (even every 15 minutes!), so as to make maximum use of =
the available free space across multiple volumes and reduce churn captured =
in snapshots. I think anybody with this perspective really should be lookin=
g at BTRFS or ZFS. Myself, I believe fstrim should run once a week or less,=
 and not really to save space, but more to hint to the flash device which b=
locks are definitely not in use over time, to make the best use of the flas=
h storage over time. If we start to pass 80%, I raise the alarm that we nee=
d to consider increasing the local storage, or moving more content out of t=
he thin volumes. Usually we find out that more-than-normal churn occurred, =
and we just need to prune a few snapshots to drop below 50% again. I still =
made them move the content that doesn&#39;t need to be snapshot out of the =
thin volume, and to a stand-alone LVM thick volume so as to entirely elimin=
ate this churn from being trapped in snapshots and accumulating.</div><div>=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
LVM has no obligation to protect careless sysadmins doing dangerous things =
from themselves. There is nothing wrong with using THIN every which way you=
 want just as long as you understand and handle the eventuality of extent e=
xhaustion. Even thin snaps go invalid if it needs to track a change and can=
&#39;t allocate space for the &#39;copy&#39;.<br></blockquote><div><br></di=
v><div>Right.</div><div><br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">
&gt; Amazon would make sure to have enough storage to meet my requirement i=
f I need them.<br>
<br>
</span>Yes, because Amazon is a RESPONSIBLE sysadmin and has put in place t=
ools to manage the fact they are thin-provisoning and to make damn sure the=
y can cash the checks they are writing.<br></blockquote><div><br></div><div=
>Right.</div><div><br></div><div>=C2=A0 =C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">
&gt; the nature of the block device, such as &quot;how much space<br>
&gt; do you *really* have left?&quot;<br>
<br>
</span>So you&#39;re going to write and then backport &quot;second guess th=
e block layer&quot; code to all filesystems in common use and god knows how=
 many versions back? Of course not. Just try to get on the EXT developer ma=
iling list and ask them to write &quot;block layer second-guessing code (ak=
a branch on device flag=3Dthin)&quot; because THINP will cause problems for=
 the FS when it runs out of extents. To which the obvious and correct respo=
nse will be &quot;Don&#39;t use THINP if you&#39;re not prepared to handle =
it&#39;s pre-requisites.&quot;<br></blockquote><div><br></div><div>Bad thin=
gs happen. Sometimes they happen very quickly. I don&#39;t intend to dare f=
ate, but if fate comes knocking, I prefer to be prepared. For example, we h=
ad two monitoring systems in place for one particularly critical piece of s=
torage, where the application is particularly poor at dealing with &quot;ou=
t of space&quot;. No thin volumes in use here. Thick volumes all the way. T=
he system on the storage appliance stopped sending notifications a few week=
s prior as a result of some mistake during a reconfiguration or upgrade. Th=
e separate monitoring system using entirely different software and configur=
ation, on different host, also failed for a different reason that I no long=
er recall. The volume became full, and the application data was corrupted i=
n a bad way that required recovery. My immediate reaction after best addres=
sing the corruption, was to demand three monitoring systems instead of two.=
 :-)</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">
&gt; you and the other people. You think the block storage should<br>
&gt; be as transparent as possible, as if the storage was not<br>
&gt; thin. Others, including me, think that this theory is<br>
&gt; impractical<br>
</span>Then by all means go ahead and retrofit all known filesystems with t=
he extra logic. ALL of the filesystems were written with the understanding =
that the block layer is telling the truth and that any &quot;white lie&quot=
; was benign in so much that it would be made good and thus could be assume=
d to be &quot;truth&quot; for practical purpose.</blockquote></div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think this relate=
s more closely to your other response, that I will respond to separately...=
</div><br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature=
">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gmail.com" target=3D"_blank=
">mark.mielke@gmail.com</a>&gt;<br><br></div>
</div></div>

--94eb2c056102dc67b50531f9b216--
