MIME-Version: 1.0
References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Thu, 10 Jan 2019 15:34:39 +0100
Message-ID: <CACrcyfLBRPnFXxxo8jKYYUJkH+GpUL3vjO7ORfvYhHQ74Wykfw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000034fee4057f1b7b04"
Subject: Re: [linux-lvm] how to copy a snapshot,
 or restore snapshot without deleting it
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
Cc: Marian Csontos <mcsontos@redhat.com>

--00000000000034fee4057f1b7b04
Content-Type: text/plain; charset="UTF-8"

Checkout this
https://github.com/mpalmer/lvmsync

This can probably do what you are asking for.

Regards Tomas

Den tors 10 jan. 2019 kl 10:12 skrev Davis, Matthew <
Matthew.Davis.2@team.telstra.com>:

> Hi Marian,
>
> I'm trying to do it with thin snapshots now. It's all very confusing, and
> I can't get it to work.
> I've read a lot of the documentation about thin stuff, and it isn't clear
> what's happening.
>
> I took a snapshot with
>
>     sudo lvcreate -s --name mySnap1 centos/root
>
> Then I copied that snapshot with
>
>     sudo lvcreate -s --name mySnap2 centos/mySnap1
>
> When I try to restore mySnap1 it says:
>
>     $sudo lvconvert --merge centos/mySnap1
>     centos/mySnap1 is not a mergeable logical volume
>
> The same happens if I use `--mergethin`.
> When I try to restore mySnap2 it just "merges" it into mySnap1. I'm trying
> to merge it into root. I've looked through the man pages and can't find any
> destination argument.
>
>     $ sudo lvconvert --merge centos/fresh2
>     Volume centos/fresh2 replaced origin centos/fresh.
>
> When I merged mySnap2 into mySnap1 and then merged that into root, and
> rebooted, it didn't actually merge. The files are not as they were when I
> made mySnap1, and `lvs` shows mySnap1 still exists. And if I try to run the
> merge command again it says
>
>     $ sudo lvconvert --merge centos/mySnap1
>     Command on LV centos/mySnap1 is invalid on LV with properties:
> lv_is_merging_origin .
>     Command not permitted on LV centos/mySnap1.
>
> What is `lv_is_merging_origin` ? It doesn't appear when I run `lvs`,
> `lvdisplay`, `pvdisplay`, `man lvmthin` or `man lvm`.
> The snapshot should have taken about 20 bytes of differences, so I don't
> expect it would take very long to restore.
> How can I check on the status of the merge? For thick volumes too, I
> couldn't find a way to check, other than just polling the command to create
> a new snapshot.
>
> What is a "thin snapshot"? I thought the whole point of LVM snapshots was
> that they only store the changes in the data.
> e.g. If I snapshot a 100GB volume and then add a 1GB file, my snapshot is
> only 1GB big, not 100GB. So aren't snapshots already thin?
>
> Also, when I take any snapshot on my thinly provisioned system, I get some
> warning about thresholds and auto-extending.
> What is "auto-extending"? I thought the whole point of thin volumes/pools
> is that the volume only takes up as much space as it needs. If more data is
> added, it takes up more space automatically.
> I think I've already allocated all my physical disks to this thin pool, so
> what could "auto-extend" mean?
>
> Thanks,
> Matt
>
> -----Original Message-----
> From: Marian Csontos [mailto:mcsontos@redhat.com]
> Sent: Friday, 4 January 2019 1:09 AM
> To: LVM general discussion and development <linux-lvm@redhat.com>; Davis,
> Matthew <Matthew.Davis.2@team.telstra.com>
> Subject: Re: [linux-lvm] how to copy a snapshot, or restore snapshot
> without deleting it
>
> On 1/3/19 5:46 AM, Davis, Matthew wrote:
> > Hi,
> >
> > I want to restore a snapshot without deleting the snapshot.
>
> Hi, I think this should be possible using thin snapshots - snapshot the
> snapshot you want to restore, and merge the snapshot - may be not perfect,
> but it is at least possible. This is fast, as there is no need to write
> huge amounts of data, it is just a switching tree's root away (or very
> close to it.)
>
> Perhaps more convenient alternative is to use boom boot manager (boom-boot
> package available on rhel8+ and fedora27+). Not sure it is available in
> ubuntu/debian.
>
> NOTE:
>
> *Thin pools*
>
> When using thin pools make sure you have enough space and you do not run
> out of space in data and metadata devices, or you risk serious trouble.
>
> 1. you must enable monitoring and threshold for extending thin pool.
> 2. using recent lvm2 2.02.* releases is recommended.
>
> *Boom*
>
> Boom also requires a minor change in initramfs to pass `-K` option to
> lvchange to allow activation of volumes with skip activation flag.
>
> -- Martian
>
>
> >
> > My use case is that I'm experimenting with a lot of different drivers,
> kernel modules, and file modifications all over my machine.
> > I want to
> > 1. take a snapshot of the working system 2. make changes 3. restore
> > the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then
> > reboot) 4. make new changes 5. restore to the snapshot again
> >
> > The problem is that step 3 deletes the snapshot, so step 5 fails.
> >
> > My current workaround is:
> > 1. take a snapshot of the working system 2. make changes 3. restore
> > the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then
> > reboot) 4. Wait 1.5 hours, without making any changes to the machine
> > 5. Take a new snapshot, with the same name as the original 6. make new
> > changes 7. restore to the snapshot
> >
> > This is not great because:
> > * I sometimes forget to do step 5
> > * I can't take a snapshot of the volume while it is still merging.
> > This takes 1.5 hours. I want to be able to restore my snapshots
> > multiple times per day
> >
> >
> > Is there a flag I can add to `lvconvert` to make it not delete the
> snapshot?
> > Alternatively, is there a way I can make a copy of the snapshot before I
> restore it?
> >
> > It looks like someone else asked this question 10 years ago.
> > https://www.redhat.com/archives/linux-lvm/2008-November/msg00000.html
> > Has this problem been solved since then?
> >
> > Thanks,
> > Matt Davis
> >
> > Technical Specialist
> > Telstra | Product Strategy & Innovation - Telstra Labs | Programmable
> > Infrastructure E  Matthew.Davis.2@team.telstra.com
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--00000000000034fee4057f1b7b04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Checkout this <br></div><div><a href=
=3D"https://github.com/mpalmer/lvmsync">https://github.com/mpalmer/lvmsync<=
/a></div><div><br></div><div>This can probably do what you are asking for.<=
/div><div><br></div><div>Regards Tomas<br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">Den tors 10 jan. 2019 kl 10:12 skrev Davi=
s, Matthew &lt;<a href=3D"mailto:Matthew.Davis.2@team.telstra.com">Matthew.=
Davis.2@team.telstra.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Marian,<br>
<br>
I&#39;m trying to do it with thin snapshots now. It&#39;s all very confusin=
g, and I can&#39;t get it to work.<br>
I&#39;ve read a lot of the documentation about thin stuff, and it isn&#39;t=
 clear what&#39;s happening.<br>
<br>
I took a snapshot with<br>
<br>
=C2=A0 =C2=A0 sudo lvcreate -s --name mySnap1 centos/root<br>
<br>
Then I copied that snapshot with<br>
<br>
=C2=A0 =C2=A0 sudo lvcreate -s --name mySnap2 centos/mySnap1<br>
<br>
When I try to restore mySnap1 it says:<br>
<br>
=C2=A0 =C2=A0 $sudo lvconvert --merge centos/mySnap1<br>
=C2=A0 =C2=A0 centos/mySnap1 is not a mergeable logical volume<br>
<br>
The same happens if I use `--mergethin`.<br>
When I try to restore mySnap2 it just &quot;merges&quot; it into mySnap1. I=
&#39;m trying to merge it into root. I&#39;ve looked through the man pages =
and can&#39;t find any destination argument.<br>
<br>
=C2=A0 =C2=A0 $ sudo lvconvert --merge centos/fresh2<br>
=C2=A0 =C2=A0 Volume centos/fresh2 replaced origin centos/fresh.<br>
<br>
When I merged mySnap2 into mySnap1 and then merged that into root, and rebo=
oted, it didn&#39;t actually merge. The files are not as they were when I m=
ade mySnap1, and `lvs` shows mySnap1 still exists. And if I try to run the =
merge command again it says <br>
<br>
=C2=A0 =C2=A0 $ sudo lvconvert --merge centos/mySnap1<br>
=C2=A0 =C2=A0 Command on LV centos/mySnap1 is invalid on LV with properties=
: lv_is_merging_origin .<br>
=C2=A0 =C2=A0 Command not permitted on LV centos/mySnap1.<br>
<br>
What is `lv_is_merging_origin` ? It doesn&#39;t appear when I run `lvs`, `l=
vdisplay`, `pvdisplay`, `man lvmthin` or `man lvm`.<br>
The snapshot should have taken about 20 bytes of differences, so I don&#39;=
t expect it would take very long to restore.<br>
How can I check on the status of the merge? For thick volumes too, I couldn=
&#39;t find a way to check, other than just polling the command to create a=
 new snapshot.<br>
<br>
What is a &quot;thin snapshot&quot;? I thought the whole point of LVM snaps=
hots was that they only store the changes in the data.<br>
e.g. If I snapshot a 100GB volume and then add a 1GB file, my snapshot is o=
nly 1GB big, not 100GB. So aren&#39;t snapshots already thin?<br>
<br>
Also, when I take any snapshot on my thinly provisioned system, I get some =
warning about thresholds and auto-extending.<br>
What is &quot;auto-extending&quot;? I thought the whole point of thin volum=
es/pools is that the volume only takes up as much space as it needs. If mor=
e data is added, it takes up more space automatically. <br>
I think I&#39;ve already allocated all my physical disks to this thin pool,=
 so what could &quot;auto-extend&quot; mean?<br>
<br>
Thanks,<br>
Matt<br>
<br>
-----Original Message-----<br>
From: Marian Csontos [mailto:<a href=3D"mailto:mcsontos@redhat.com" target=
=3D"_blank">mcsontos@redhat.com</a>] <br>
Sent: Friday, 4 January 2019 1:09 AM<br>
To: LVM general discussion and development &lt;<a href=3D"mailto:linux-lvm@=
redhat.com" target=3D"_blank">linux-lvm@redhat.com</a>&gt;; Davis, Matthew =
&lt;<a href=3D"mailto:Matthew.Davis.2@team.telstra.com" target=3D"_blank">M=
atthew.Davis.2@team.telstra.com</a>&gt;<br>
Subject: Re: [linux-lvm] how to copy a snapshot, or restore snapshot withou=
t deleting it<br>
<br>
On 1/3/19 5:46 AM, Davis, Matthew wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I want to restore a snapshot without deleting the snapshot.<br>
<br>
Hi, I think this should be possible using thin snapshots - snapshot the sna=
pshot you want to restore, and merge the snapshot - may be not perfect, but=
 it is at least possible. This is fast, as there is no need to write huge a=
mounts of data, it is just a switching tree&#39;s root away (or very close =
to it.)<br>
<br>
Perhaps more convenient alternative is to use boom boot manager (boom-boot =
package available on rhel8+ and fedora27+). Not sure it is available in ubu=
ntu/debian.<br>
<br>
NOTE:<br>
<br>
*Thin pools*<br>
<br>
When using thin pools make sure you have enough space and you do not run ou=
t of space in data and metadata devices, or you risk serious trouble.<br>
<br>
1. you must enable monitoring and threshold for extending thin pool.<br>
2. using recent lvm2 2.02.* releases is recommended.<br>
<br>
*Boom*<br>
<br>
Boom also requires a minor change in initramfs to pass `-K` option to lvcha=
nge to allow activation of volumes with skip activation flag.<br>
<br>
-- Martian<br>
<br>
<br>
&gt; <br>
&gt; My use case is that I&#39;m experimenting with a lot of different driv=
ers, kernel modules, and file modifications all over my machine.<br>
&gt; I want to<br>
&gt; 1. take a snapshot of the working system 2. make changes 3. restore <b=
r>
&gt; the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then =
<br>
&gt; reboot) 4. make new changes 5. restore to the snapshot again<br>
&gt; <br>
&gt; The problem is that step 3 deletes the snapshot, so step 5 fails.<br>
&gt; <br>
&gt; My current workaround is:<br>
&gt; 1. take a snapshot of the working system 2. make changes 3. restore <b=
r>
&gt; the snapshot (` sudo lvconvert --merge /dev/ubuntu-vg/$SNAPSHOT` then =
<br>
&gt; reboot) 4. Wait 1.5 hours, without making any changes to the machine <=
br>
&gt; 5. Take a new snapshot, with the same name as the original 6. make new=
 <br>
&gt; changes 7. restore to the snapshot<br>
&gt; <br>
&gt; This is not great because:<br>
&gt; * I sometimes forget to do step 5<br>
&gt; * I can&#39;t take a snapshot of the volume while it is still merging.=
 <br>
&gt; This takes 1.5 hours. I want to be able to restore my snapshots <br>
&gt; multiple times per day<br>
&gt; <br>
&gt; <br>
&gt; Is there a flag I can add to `lvconvert` to make it not delete the sna=
pshot?<br>
&gt; Alternatively, is there a way I can make a copy of the snapshot before=
 I restore it?<br>
&gt; <br>
&gt; It looks like someone else asked this question 10 years ago.<br>
&gt; <a href=3D"https://www.redhat.com/archives/linux-lvm/2008-November/msg=
00000.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/arc=
hives/linux-lvm/2008-November/msg00000.html</a><br>
&gt; Has this problem been solved since then?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Matt Davis<br>
&gt; <br>
&gt; Technical Specialist<br>
&gt; Telstra | Product Strategy &amp; Innovation - Telstra Labs | Programma=
ble <br>
&gt; Infrastructure E =C2=A0<a href=3D"mailto:Matthew.Davis.2@team.telstra.=
com" target=3D"_blank">Matthew.Davis.2@team.telstra.com</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"n=
oreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-=
lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt; <br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div>

--00000000000034fee4057f1b7b04--
