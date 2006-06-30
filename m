Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5U5pK1X027914
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 01:51:20 -0400
Received: from web31410.mail.mud.yahoo.com (web31410.mail.mud.yahoo.com
	[68.142.198.122])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k5U5pCI2025079
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 01:51:12 -0400
Message-ID: <20060630055107.87219.qmail@web31410.mail.mud.yahoo.com>
Date: Thu, 29 Jun 2006 22:51:07 -0700 (PDT)
From: Teak Billard <teamwassily@yahoo.com>
Subject: Re: [linux-lvm] Uuid for unknown device blows up VolGroup00
In-Reply-To: <44A38C9E.3020406@conterra.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-659304570-1151646667=:83906"
Content-Transfer-Encoding: 8bit
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

--0-659304570-1151646667=:83906
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Dieter St=EF=BF=BDken <stueken@conterra.de> wrote: Teak Billard wrote:
> I recently tried to add an old 30 GB hard drive lying in my machine to
> my FC5 system.  I was trying to add the 30 GB to VolGroup00.  I failed
> somehow and now the entire VolGroup00 is inaccessible.  When booting I
> get a Kernel panic - not syncing: Attempted to kill init!  I think if I
> removed the offending Uuid from VolGroup00 things would go back to normal.
> ....
> When I do an lvm pvdisplay, it reveals that VolGroup00 has two uuid's in
> it. One is /dev/hdb3 with uuid M3CWKv-a2yK-b5Qu-rLzq-Aj27-lXxE-WzvkWE
> and the other is unknown device with uuid
> 8YsyEa-r5RX-2LLI-Zz7n-Xr8s-VksP-Mhs0Wi.

seems you did NOT fail adding the new disk. Have a look into your=20
/etc/lvm/backup/VolGroup00 to find how your VG is composed.

It seems, you succeed in adding the disk, but you finally did
not use it and disconnected it. LVM however has registered
the new disk, even if you did not copy any data to it.

You should reconnect the formerly added disk and unregister
it from your volume group by "vgreduce". If you don't have the
disk any more or used it elsewhere, you may try the option
"vgreduce --removemissing".

> I failed somehow and now ...

can you tell us, why it did not work as you expected?

Dieter.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

This is exactly what I did to fix the problem: vgreduce --removemissing Vol=
Group00.
=20
 > can you tell us, why it did not work as you expected?
=20
 First time using volume groups.  Installed FC5 back when it came out and d=
idn't really know what I was doing.  Now I do.  After fixing the problem, I=
 got wise, used the lvm commands and added the new hard disk as a physical =
volume, and merged it into the existing volume group.
=20
 I had messed around with the lvm gui beforehand and may have caused a prob=
lem then.
=20
 In my getting wise period I read that the problem with volume groups is th=
at if one hard drive fails, the entire volume group is finished.  That to m=
e is extremely dangerous.  Am I right to be concerned?
=20
 Teak



 	=09
---------------------------------
Do you Yahoo!?
 Everyone is raving about the  all-new Yahoo! Mail Beta.
--0-659304570-1151646667=:83906
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<br><br><b><i>Dieter St=EF=BF=BDken &lt;stueken@conterra.de&gt;</i></b> wro=
te:<blockquote class=3D"replbq" style=3D"border-left: 2px solid rgb(16, 16,=
 255); margin-left: 5px; padding-left: 5px;"> Teak Billard wrote:<br>&gt; I=
 recently tried to add an old 30 GB hard drive lying in my machine to<br>&g=
t; my FC5 system.  I was trying to add the 30 GB to VolGroup00.  I failed<b=
r>&gt; somehow and now the entire VolGroup00 is inaccessible.  When booting=
 I<br>&gt; get a Kernel panic - not syncing: Attempted to kill init!  I thi=
nk if I<br>&gt; removed the offending Uuid from VolGroup00 things would go =
back to normal.<br>&gt; ....<br>&gt; When I do an lvm pvdisplay, it reveals=
 that VolGroup00 has two uuid's in<br>&gt; it. One is /dev/hdb3 with uuid M=
3CWKv-a2yK-b5Qu-rLzq-Aj27-lXxE-WzvkWE<br>&gt; and the other is unknown devi=
ce with uuid<br>&gt; 8YsyEa-r5RX-2LLI-Zz7n-Xr8s-VksP-Mhs0Wi.<br><br>seems y=
ou did NOT fail adding the new disk. Have a look into your <br>/etc/lvm/bac=
kup/VolGroup00 to find
 how your VG is composed.<br><br>It seems, you succeed in adding the disk, =
but you finally did<br>not use it and disconnected it. LVM however has regi=
stered<br>the new disk, even if you did not copy any data to it.<br><br>You=
 should reconnect the formerly added disk and unregister<br>it from your vo=
lume group by "vgreduce". If you don't have the<br>disk any more or used it=
 elsewhere, you may try the option<br>"vgreduce --removemissing".<br><br>&g=
t; I failed somehow and now ...<br><br>can you tell us, why it did not work=
 as you expected?<br><br>Dieter.<br><br>___________________________________=
____________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://t=
ldp.org/HOWTO/LVM-HOWTO/<br></blockquote><br>This is exactly what I did to =
fix the problem: vgreduce --removemissing VolGroup00.<br> <br> &gt; can you=
 tell us, why it did not work as you expected?<br> <br> First time using vo=
lume
 groups.&nbsp; Installed FC5 back when it came out and didn't really know w=
hat I was doing.&nbsp; Now I do.&nbsp; After fixing the problem, I got wise=
, used the lvm commands and added the new hard disk as a physical volume, a=
nd merged it into the existing volume group.<br> <br> I had messed around w=
ith the lvm gui beforehand and may have caused a problem then.<br> <br> In =
my getting wise period I read that the problem with volume groups is that i=
f one hard drive fails, the entire volume group is finished.&nbsp; That to =
me is extremely dangerous.&nbsp; Am I right to be concerned?<br> <br> Teak<=
br><br><br><p>&#32;
		<hr size=3D1>Do you Yahoo!?<br> Everyone is raving about the <a href=3D"h=
ttp://us.rd.yahoo.com/evt=3D42297/*http://advision.webevents.yahoo.com/hand=
raisers"> all-new Yahoo! Mail Beta.</a>
--0-659304570-1151646667=:83906--
