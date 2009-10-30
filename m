Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9UL4CSb001378
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 17:04:12 -0400
Received: from mail-qy0-f185.google.com (mail-qy0-f185.google.com
	[209.85.221.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9UL3r9Z030967
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 17:03:54 -0400
Received: by qyk15 with SMTP id 15so1747503qyk.23
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 14:03:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256931963.28005.3@raydesk1.bettercgi.com>
References: <868096450910300152s271d34dcl74980fff211d15b4@mail.gmail.com>
	<1256931963.28005.3@raydesk1.bettercgi.com>
Date: Fri, 30 Oct 2009 22:03:53 +0100
Message-ID: <868096450910301403v59e71749n910a9c99807aafb2@mail.gmail.com>
Subject: Re: [linux-lvm] Best Practices deploying LVM
From: =?ISO-8859-1?Q?Abraham_P=E9rez?= <jockah@gmail.com>
Content-Type: multipart/alternative; boundary=0015175770ea8b4dfc04772d5d4d
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

--0015175770ea8b4dfc04772d5d4d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, finally my english results a barrier for explain myself (lol).

Anyway, now I have another point of view, so thank you all very much for
your assistance!!!

2009/10/30 Ray Morris <support@bettercgi.com>

>   With your way, you can add a new 2GB disk and use
> half of it for /home, half for /opt, if you wish.
> You can also leave some of it unused and expand
> any LV in the future as needed.  That's one important
> reason why most people use voluem groups as groups -
> contianing several volumes.  Does your colleague know
> of ANY advantage to creating a bunch of different
> groups?   If not, your way wins - it has advantages
> over his way, and his way has no advantage.
>
>
>  we have to discard different kinds of hard disk
>> because they're exactly the same
>>
>
>  I have no idea what this is supposed to mean.
> Different kinds of hard disk are exactly the same?
> If this is supposed to mean "we are not able to
> use different types of drives for different
> partitions", I can understand that.  However,
> for what purpose would you use different types
> of disks?  Perhaps he wants a fast disk for one
> partition, and a large, cheap disk for another
> partition?  If you use two cheap disks in a
> striped LV it's going to be faster AND cheaper
> than the "fast drive" option.  MAYBE if you were
> going to use a super fast RAID array of SSD drives
> for some small amount of data, but not if we're
> talking standard magnetic hard drives.
>
>
>
>  a lot of servers running under VMware. This client
>> have a lot of problems with the storage, because they
>> never have enough space so when they have to allocate
>> disk in servers, they add small virtual hard disks
>> with, for example, 5 or 10GB.
>>
>
> lvextend.  Ours resize automatically on the fly, using
> a cron job that checks to see if any virtual servers
> need more space.
>
>
>  discarding concept things like a volume group was designed
>> to be a group, because we're looking for good reasons
>>
>
>  "Concept reasons", like using the tool designed for the
> job, may be the very best reasons because that one reason
> actually covers the hundred reasons that don't come to mind
> immediately.  You don't know what issues you'll run into
> next week or next month, but you can bet you won't be the
> first one - other people will have had the same issues,
> and will use the standard tools for the standard purposes
> to solve that problem.  Better for you if you can use
> the same solutions.  Also, there are certain features
> and optimizations you don't know about, but you'll gain
> from those grouping features if you use groups as groups.
> No one knows about the features and optimizations that
> will be added next year, but if you use the tools the
> way they were designed you'll benefit from future
> enhancements that allow you to better use them for their
> purposes.
> --
>
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
> On 10/30/2009 03:52:43 AM, Abraham P=E9rez wrote:
>
>> Thanks for the instant answers!
>>
>> Well... I'll try to explain myself better. I'm working in a client who
>> have
>> a lot of servers running under VMware. This client have a lot of problem=
s
>> with the storage, because they never have enough space so when they have
>> to
>> allocate disk in servers, they add small virtual hard disks with, for
>> example, 5 or 10GB.
>>
>> Then for the OS installation, we follow the basic schema based on disk
>> partitions (/dev/sda1 pointing to / with ext3, /dev/sda2 pointing to /ho=
me
>> and so on) and for the applications data, we use VG and LV pointing to
>> /opt
>>
>> The client have some applications who need a lot of mountpoints, so my
>> colleague adds 1-3 LV per VG (aproximated) and I only create only one VG
>> and
>> inside it, different LVs.  With this infrastructure, we have to discard
>> different kinds of hard disk because they're exactly the same... and we
>> have
>> that doubt: what schema is better and why, discarding concept things lik=
e
>> a
>> volume group was designed to be a group, because we're looking for good
>> reasons based in performance of future actions, it's not important... or
>> am
>> I mistaken???
>>
>> I don't know if I explained myself very well, so thanks all anyway!
>>
>> Regards,
>> Abraham P=E9rez
>>
>> 2009/10/30 <malahal@us.ibm.com>
>>
>> > Ray Morris [support@bettercgi.com] wrote:
>> > >     I don't know about a whitepaper, but I can address
>> > > your example.
>> > >
>> > > > he makes one volume group for each logical volume (more or less)
>> > >
>> > >     If each one has one volume, that's not exactly a volume
>> > > GROUP, is it?  If groups and volumes are basically synomous,
>> > > he gives up all the benfits of groups.  In fact, he gives
>> > > up most of the benefits of logical volumes, since each PV
>> > > has to be in one group, and each VG is one LV, you're left
>> > > with one LV per PV - might as well just use partitions
>> > > directly.
>> >
>> > I agree, you lose some flexibility but it has some advantage compared =
to
>> > plain partitions without LVM. E.g. he can make a file system larger th=
an
>> > any disk with multiple disks in the above LVM (one LV per VG)
>> > configuration.  There are other advantages. I am not sure the reason f=
or
>> > making only one LV per VG though!
>> >
>> > Thanks, Malahal.
>> >
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >
>>
>>
> ------quoted attachment------
>
>  _______________________________________________
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

--0015175770ea8b4dfc04772d5d4d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, finally my english results a barrier for explain myself (lol).<br><br=
>Anyway, now I have another point of view, so thank you all very much for y=
our assistance!!!<br><br><div class=3D"gmail_quote">2009/10/30 Ray Morris <=
span dir=3D"ltr">&lt;<a href=3D"mailto:support@bettercgi.com">support@bette=
rcgi.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"> =A0 With your wa=
y, you can add a new 2GB disk and use<br>
half of it for /home, half for /opt, if you wish.<br>
You can also leave some of it unused and expand<br>
any LV in the future as needed. =A0That&#39;s one important<br>
reason why most people use voluem groups as groups -<br>
contianing several volumes. =A0Does your colleague know<br>
of ANY advantage to creating a bunch of different<br>
groups? =A0 If not, your way wins - it has advantages<br>
over his way, and his way has no advantage.<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
we have to discard different kinds of hard disk<br>
because they&#39;re exactly the same<br>
</blockquote>
<br></div>
 =A0I have no idea what this is supposed to mean.<br>
Different kinds of hard disk are exactly the same?<br>
If this is supposed to mean &quot;we are not able to<br>
use different types of drives for different<br>
partitions&quot;, I can understand that. =A0However,<br>
for what purpose would you use different types<br>
of disks? =A0Perhaps he wants a fast disk for one<br>
partition, and a large, cheap disk for another<br>
partition? =A0If you use two cheap disks in a<br>
striped LV it&#39;s going to be faster AND cheaper<br>
than the &quot;fast drive&quot; option. =A0MAYBE if you were<br>
going to use a super fast RAID array of SSD drives<br>
for some small amount of data, but not if we&#39;re<br>
talking standard magnetic hard drives.<div class=3D"im"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
a lot of servers running under VMware. This client<br>
have a lot of problems with the storage, because they<br>
never have enough space so when they have to allocate<br>
disk in servers, they add small virtual hard disks<br>
with, for example, 5 or 10GB.<br>
</blockquote>
<br></div>
lvextend. =A0Ours resize automatically on the fly, using<br>
a cron job that checks to see if any virtual servers<br>
need more space.<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
discarding concept things like a volume group was designed<br>
to be a group, because we&#39;re looking for good reasons<br>
</blockquote>
<br></div>
 =A0&quot;Concept reasons&quot;, like using the tool designed for the<br>
job, may be the very best reasons because that one reason<br>
actually covers the hundred reasons that don&#39;t come to mind<br>
immediately. =A0You don&#39;t know what issues you&#39;ll run into<br>
next week or next month, but you can bet you won&#39;t be the<br>
first one - other people will have had the same issues,<br>
and will use the standard tools for the standard purposes<br>
to solve that problem. =A0Better for you if you can use<br>
the same solutions. =A0Also, there are certain features<br>
and optimizations you don&#39;t know about, but you&#39;ll gain<br>
from those grouping features if you use groups as groups.<br>
No one knows about the features and optimizations that<br>
will be added next year, but if you use the tools the<br>
way they were designed you&#39;ll benefit from future<br>
enhancements that allow you to better use them for their<br>
purposes.<br>
--<div class=3D"im"><br>
Ray Morris<br>
<a href=3D"mailto:support@bettercgi.com" target=3D"_blank">support@bettercg=
i.com</a><br>
<br></div>
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
"_blank">http://www.bettercgi.com/affiliates/user/register.php</a><div><div=
></div><div class=3D"h5"><br>
<br>
<br>
On 10/30/2009 03:52:43 AM, Abraham P=E9rez wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Thanks for the instant answers!<br>
<br>
Well... I&#39;ll try to explain myself better. I&#39;m working in a client =
who have<br>
a lot of servers running under VMware. This client have a lot of problems<b=
r>
with the storage, because they never have enough space so when they have to=
<br>
allocate disk in servers, they add small virtual hard disks with, for<br>
example, 5 or 10GB.<br>
<br>
Then for the OS installation, we follow the basic schema based on disk<br>
partitions (/dev/sda1 pointing to / with ext3, /dev/sda2 pointing to /home<=
br>
and so on) and for the applications data, we use VG and LV pointing to /opt=
<br>
<br>
The client have some applications who need a lot of mountpoints, so my<br>
colleague adds 1-3 LV per VG (aproximated) and I only create only one VG an=
d<br>
inside it, different LVs. =A0With this infrastructure, we have to discard<b=
r>
different kinds of hard disk because they&#39;re exactly the same... and we=
 have<br>
that doubt: what schema is better and why, discarding concept things like a=
<br>
volume group was designed to be a group, because we&#39;re looking for good=
<br>
reasons based in performance of future actions, it&#39;s not important... o=
r am<br>
I mistaken???<br>
<br>
I don&#39;t know if I explained myself very well, so thanks all anyway!<br>
<br>
Regards,<br>
Abraham P=E9rez<br>
<br>
2009/10/30 &lt;<a href=3D"mailto:malahal@us.ibm.com" target=3D"_blank">mala=
hal@us.ibm.com</a>&gt;<br>
<br>
&gt; Ray Morris [<a href=3D"mailto:support@bettercgi.com" target=3D"_blank"=
>support@bettercgi.com</a>] wrote:<br>
&gt; &gt; =A0 =A0 I don&#39;t know about a whitepaper, but I can address<br=
>
&gt; &gt; your example.<br>
&gt; &gt;<br>
&gt; &gt; &gt; he makes one volume group for each logical volume (more or l=
ess)<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 If each one has one volume, that&#39;s not exactly a volu=
me<br>
&gt; &gt; GROUP, is it? =A0If groups and volumes are basically synomous,<br=
>
&gt; &gt; he gives up all the benfits of groups. =A0In fact, he gives<br>
&gt; &gt; up most of the benefits of logical volumes, since each PV<br>
&gt; &gt; has to be in one group, and each VG is one LV, you&#39;re left<br=
>
&gt; &gt; with one LV per PV - might as well just use partitions<br>
&gt; &gt; directly.<br>
&gt;<br>
&gt; I agree, you lose some flexibility but it has some advantage compared =
to<br>
&gt; plain partitions without LVM. E.g. he can make a file system larger th=
an<br>
&gt; any disk with multiple disks in the above LVM (one LV per VG)<br>
&gt; configuration. =A0There are other advantages. I am not sure the reason=
 for<br>
&gt; making only one LV per VG though!<br>
&gt;<br>
&gt; Thanks, Malahal.<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=
=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
<br>
</blockquote>
<br></div></div>
------quoted attachment------<div><div></div><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
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

--0015175770ea8b4dfc04772d5d4d--
