MIME-Version: 1.0
References: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
	<20181011142550.GA15437@redhat.com>
	<CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com>
	<581cfd57-aca0-70f5-b715-f05357e4bbad@redhat.com>
In-Reply-To: <581cfd57-aca0-70f5-b715-f05357e4bbad@redhat.com>
From: Sherpa Sherpa <norbuurgen@gmail.com>
Date: Fri, 12 Oct 2018 21:31:35 +0545
Message-ID: <CACkv3pVvLc5L0QgB0j-vog+O_Lt7+GJLH3ZGzyuk1AK2pvmX=g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000374fb405780a00c8"
Subject: Re: [linux-lvm] what is the IOPS behavior when partitions of single
 disk(raid5 backend) are used in an LVM?
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
To: linux-lvm@redhat.com, heinzm@redhat.com

--000000000000374fb405780a00c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for reply i dont mind if fstab sees partitions.  I read this "To
avoid striping performance
 problems LVM can't tell that two PVs are on the same physical disk, so if
you create a striped LV then the stripes could be on different partitions  =
on
the same disk resulting in a *decrease* in performance rather than an
increase."
in the tldp.org but does this apply to disks made from RAID backend ?

Warm Regards
Urgen Sherpa


On Fri, Oct 12, 2018 at 9:09 PM Heinz Mauelshagen <heinzm@redhat.com> wrote=
:

> On 10/11/18 4:31 PM, Emmanuel Gelati wrote:
>
> If you use sdb only for data, you don't have need to use partition on the
> disk.
>
> Though that's true, keeping 1 partition per disk for each LVM PV adds
> additional
> 'visibility' by tools like fdisk/[cs]fdisk, parted etc. showing the
> partition type to be 'Liinux LVM'.
>
> Using the whole disk, blkid or lsblk will provide that information still,
> e.g. 'blkid --match-token TYPE=3DLVM2_member'.
>
> Heinz
>
>
> Il giorno gio 11 ott 2018 alle ore 16:26 David Teigland <
> teigland@redhat.com> ha scritto:
>
>> On Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:
>> > I have LVM(backed by hardware RAID5) with logical volume and a volume
>> group
>> > named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2 sdb3 created
>> from
>> > same sdb disk.
>>
>> > sdb                                8:16   0  19.7T  0 disk
>> > =E2=94=9C=E2=94=80sdb1                             8:17   0   7.7T  0 =
part
>> > =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0 =
  9.4T  0 lvm
>> /var/db/st01
>> > =E2=94=9C=E2=94=80sdb2                             8:18   0   1.7T  0 =
part
>> > =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)              252:1    0 =
  9.4T  0 lvm
>> /var/db/st01
>> > =E2=94=94=E2=94=80sdb3                             8:19   0  10.3T  0 =
part
>> >   =E2=94=94=E2=94=80archive--archivedbstore--lv (dm-0)     252:0    0 =
 10.3T  0 lvm
>>
>> > I am assuming this is due to disk seek problem as the same disk
>> partitions
>> > are used for same LVM or may be its due to saturation of the disks
>>
>> You shouldn't add different partitions as different PVs.  If it's too la=
te
>> to fix, it might help to create new LV that uses only one of the
>> partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then copy your
>> current LV to the new one.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> --
>   .~.
>   /V\
>  //  \\
> /(   )\
> ^`~'^
>
> _______________________________________________
> linux-lvm mailing listlinux-lvm@redhat.comhttps://www.redhat.com/mailman/=
listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--000000000000374fb405780a00c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for reply i dont mind if fstab sees partitions.=
=C2=A0<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">=C2=A0I read th=
is &quot;To avoid striping performance<br>=C2=A0problems LVM can&#39;t tell=
 that two PVs are on the same physical disk, so if<br>you create a striped =
LV then the stripes could be on different partitions=C2=A0</span>=C2=A0on t=
he same disk resulting in a *decrease* in performance rather than an<span c=
lass=3D"gmail-im" style=3D"color:rgb(80,0,80)">=C2=A0increase.&quot; in the=
 <a href=3D"http://tldp.org">tldp.org</a> but does this apply to disks made=
 from RAID backend ?</span><div><h3 class=3D"gmail-iw" style=3D"overflow:hi=
dden;white-space:nowrap;max-width:92%;font-size:0.75rem;font-weight:inherit=
;margin:inherit;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;l=
etter-spacing:0.3px;color:rgb(95,99,104);line-height:20px"><br></h3><div><d=
iv dir=3D"ltr" class=3D"m_-8662274235435088732gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div>Warm Regards<br></div>Urgen Sh=
erpa<br></div></div></div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Fri, Oct 12, 2018 at 9:09 PM Heinz Mauelshagen &lt;<a hre=
f=3D"mailto:heinzm@redhat.com" target=3D"_blank">heinzm@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"m_-8662274235435088732m_-8027134236677368943moz-cite-pref=
ix">On 10/11/18 4:31 PM, Emmanuel Gelati
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">If you use sdb only for data, you don&#39;t have nee=
d
        to use partition on the disk.<br>
      </div>
    </blockquote>
    <p>Though that&#39;s true, keeping 1 partition per disk for each LVM PV
      adds additional<br>
      &#39;visibility&#39; by tools like fdisk/[cs]fdisk, parted etc. showi=
ng
      the partition type to be &#39;Liinux LVM&#39;.<br>
    </p>
    <p>Using the whole disk, blkid or lsblk will provide that
      information still,<br>
      e.g. &#39;blkid --match-token TYPE=3DLVM2_member&#39;.</p>
    <p>Heinz<br>
    </p>
    <blockquote type=3D"cite"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr">Il giorno gio 11 ott 2018 alle ore 16:26 David
          Teigland &lt;<a href=3D"mailto:teigland@redhat.com" target=3D"_bl=
ank">teigland@redhat.com</a>&gt; ha
          scritto:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Thu, Oct
          11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:<br>
          &gt; I have LVM(backed by hardware RAID5) with logical volume
          and a volume group<br>
          &gt; named &quot;dbstore-lv&quot; and &quot;dbstore-vg&quot; whic=
h have sdb1 sdb2
          sdb3 created from<br>
          &gt; same sdb disk.<br>
          <br>
          &gt; sdb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8:16=C2=A0 =C2=A00=
=C2=A0 19.7T=C2=A0 0
          disk<br>
          &gt; =E2=94=9C=E2=94=80sdb1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:17=C2=
=A0 =C2=A00=C2=A0 =C2=A07.7T=C2=A0 0
          part<br>
          &gt; =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 252:1=C2=A0 =C2=A0 0=C2=A0 =C2=A09.4T=C2=
=A0 0
          lvm=C2=A0 /var/db/st01<br>
          &gt; =E2=94=9C=E2=94=80sdb2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:18=C2=
=A0 =C2=A00=C2=A0 =C2=A01.7T=C2=A0 0
          part<br>
          &gt; =E2=94=82 =E2=94=94=E2=94=80dbstore-lv (dm-1)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 252:1=C2=A0 =C2=A0 0=C2=A0 =C2=A09.4T=C2=
=A0 0
          lvm=C2=A0 /var/db/st01<br>
          &gt; =E2=94=94=E2=94=80sdb3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:19=C2=
=A0 =C2=A00=C2=A0 10.3T=C2=A0 0
          part<br>
          &gt;=C2=A0 =C2=A0=E2=94=94=E2=94=80archive--archivedbstore--lv (d=
m-0)=C2=A0 =C2=A0 =C2=A0252:0=C2=A0 =C2=A0 0=C2=A0
          10.3T=C2=A0 0 lvm<br>
          <br>
          &gt; I am assuming this is due to disk seek problem as the
          same disk partitions<br>
          &gt; are used for same LVM or may be its due to saturation of
          the disks<br>
          <br>
          You shouldn&#39;t add different partitions as different PVs.=C2=
=A0 If
          it&#39;s too late<br>
          to fix, it might help to create new LV that uses only one of
          the<br>
          partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then
          copy your<br>
          current LV to the new one.<br>
          <br>
          _______________________________________________<br>
          linux-lvm mailing list<br>
          <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-l=
vm@redhat.com</a><br>
          <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=
=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/l=
inux-lvm</a><br>
          read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO=
/" rel=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a=
></blockquote>
      </div>
      <br clear=3D"all">
      <br>
      -- <br>
      <div dir=3D"ltr" class=3D"m_-8662274235435088732m_-802713423667736894=
3gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 .~.<br>
        =C2=A0 /V\<br>
        =C2=A0// =C2=A0\\<br>
        /( =C2=A0 )\<br>
        ^`~&#39;^</div>
      <br>
      <fieldset class=3D"m_-8662274235435088732m_-8027134236677368943mimeAt=
tachmentHeader"></fieldset>
      <pre class=3D"m_-8662274235435088732m_-8027134236677368943moz-quote-p=
re">_______________________________________________
linux-lvm mailing list
<a class=3D"m_-8662274235435088732m_-8027134236677368943moz-txt-link-abbrev=
iated" href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@red=
hat.com</a>
<a class=3D"m_-8662274235435088732m_-8027134236677368943moz-txt-link-freete=
xt" href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_b=
lank">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class=3D"m_-8662274235435088732m_-802713423667736=
8943moz-txt-link-freetext" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <pre class=3D"m_-8662274235435088732m_-8027134236677368943moz-signature=
" cols=3D"72">
</pre>
  </div>

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

--000000000000374fb405780a00c8--
