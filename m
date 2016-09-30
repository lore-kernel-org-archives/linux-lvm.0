Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UHeIpw030963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 13:40:18 -0400
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C917C256A
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 17:40:15 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id t83so138279856oie.3
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2016 10:40:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1d992f9f-02e1-96db-6168-1c72c7f7a063@redhat.com>
References: <CABGge9y-NDG1YdF3M5BSxems4wHHy2YiaXOi7dqFfG6VOGasSg@mail.gmail.com>
	<1d992f9f-02e1-96db-6168-1c72c7f7a063@redhat.com>
From: Charles Koprowski <cko@audaxis.com>
Date: Fri, 30 Sep 2016 19:39:54 +0200
Message-ID: <CABGge9z6pOOtHQbZmBKmbFFGQfpedFeg-NKBjM8KMzc=KJPpXQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1140bcda4106ee053dbd16f3
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way to
 increase PV metadatasize?
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

--001a1140bcda4106ee053dbd16f3
Content-Type: text/plain; charset=UTF-8

2016-09-29 11:23 GMT+02:00 Zdenek Kabelac <zkabelac@redhat.com>:

> Dne 28.9.2016 v 15:51 Charles Koprowski napsal(a):
>
>>  On Sun, 10 Aug 2008 18:45:16 +0100, John Leach wrote:
>>
>>     On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:
>>     > To remove the metadata areas you need to:
>>     >
>>     >    get an up-to-date metadata backup (vgcfgbackup)
>>     >
>>     >   pvcreate --restorefile pointing at a copy of that backup file
>>     requesting 0 metadata areas
>>     > and specifying the same uuid as it had before
>>     >
>>     >   vgcfgrestore from the backup file
>>     >
>>     This doesn't look like something you can do with the volume group
>> active
>>     (with cluster lvm anyway):
>>     [root testnode0 ~]# pvcreate --restorefile san-metadata -u
>>     fTLglk-j1C1-02Z7-8k6l-DTAm-2WNj-9ZGT19 --metadatacopies 0 /dev/hdb
>> -ff
>>     Really INITIALIZE physical volume "/dev/hdb" of volume group "san"
>> [y/n]? y
>>       Can't open /dev/hdb exclusively.  Mounted filesystem?
>>     Is that right, or am I missing something?
>>
>>
>> Hi John,
>>
>> I know it's been a long time but, Did you found out a solution for this ?
>>
>> I'm trying to follow the same scenario to increase the metadatasize and
>> got
>> stuck at the same point.
>>
>
>
>
>
> Hi
>
> I've no real idea what's the original problem  - but here is clear error
> on user side. This message:
>
> "Can't open /dev/hdb exclusively.  Mounted filesystem?"
>
> indicates that device is NOT UNUSED and it has to be unused for this
> operation - i.e. you MAY NOT run this operation while there are active LVs
> from this PV (one of possible reasons why  'hdb' cannot be opened
> exclusively)
>
>
>

Hi Zdenek,

I'm running a 5 nodes XEN dom0s cluster which uses a shared VG and few
hundreds LVs to store virtual machines disks.

As we were running out of space in the actual VG, I was about to add a new
PV and take the opportunity to increase the metadata size as you described
below.

I was wondering if I could run the "pvcreate --restorefile --metadatacopies
0" while the VG (and PV) were online.

Now I got the answer :-)

Thank you !

Charles



>
> To increase 'metadata' size - you ether have to add some NEW PV with
> much bigger metadata size space (and such operation still needs some
> extra space to proceed with existing size). Then disable existing metadata
> areas - so you will end-up of storing bigger MDA only to this new bigger
> MDA on a new PV -  note - it's quite risky plan to leave MDA only on single
> PV in multi-PV VG  - so I'd not advice this for any serious use.
>
> You may PV via pvmove to a new bigger PV.
> (adviced operation - though it may take its time...)
>
> There is NOT lvm2  native support for  'online' resize of PV mda size -
> and while it's possible to do this operation manually - it's quite complex
> task - so I'd not advice to do this either - unless you have FULL backup of
> everything.
>
> So back to your original problem - please describe  EXACTLY what is your
> problem and attach  outputs of  pvs,vgs,lvs  and what you want to achieve.
>
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Charles Koprowski
Systems & Networks
<http://www.audaxis.com/>
cko@audaxis.com
Tel : +33 3 20 63 88 70 <+33+3+20+63+88+70>
GSM : +33 6 29 32 63 33 <+33+6+29+32+63+33>
<http://twitter.com/audaxis>
<http://www.linkedin.com/company/audaxis>

--001a1140bcda4106ee053dbd16f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-09-29 11:23 GMT+02:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&g=
t;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dne 28.9.20=
16 v 15:51 Charles Koprowski napsal(a):<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0On Sun, 10 Aug 2008 18:45:16 +0100, John Leach wrote:<br>
<br>
=C2=A0 =C2=A0 On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:<b=
r>
=C2=A0 =C2=A0 &gt; To remove the metadata areas you need to:<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 get an up-to-date metadata backup (vgcfgbac=
kup)<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0pvcreate --restorefile pointing at a copy of=
 that backup file<br>
=C2=A0 =C2=A0 requesting 0 metadata areas<br>
=C2=A0 =C2=A0 &gt; and specifying the same uuid as it had before<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0vgcfgrestore from the backup file<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 This doesn&#39;t look like something you can do with the volu=
me group active<br>
=C2=A0 =C2=A0 (with cluster lvm anyway):<br>
=C2=A0 =C2=A0 [root testnode0 ~]# pvcreate --restorefile san-metadata -u<br=
>
=C2=A0 =C2=A0 fTLglk-j1C1-02Z7-8k6l-DTAm-2WN<wbr>j-9ZGT19 --metadatacopies =
0 /dev/hdb -ff<br>
=C2=A0 =C2=A0 Really INITIALIZE physical volume &quot;/dev/hdb&quot; of vol=
ume group &quot;san&quot; [y/n]? y<br>
=C2=A0 =C2=A0 =C2=A0 Can&#39;t open /dev/hdb exclusively.=C2=A0 Mounted fil=
esystem?<br>
=C2=A0 =C2=A0 Is that right, or am I missing something?<br>
<br>
<br>
Hi John,<br>
<br>
I know it&#39;s been a long time but, Did you found out a solution for this=
 ?<br>
<br>
I&#39;m trying to follow the same scenario to increase the metadatasize and=
 got<br>
stuck at the same point.<br>
</blockquote>
<br>
<br>
<br>
<br></span>
Hi<br>
<br>
I&#39;ve no real idea what&#39;s the original problem=C2=A0 - but here is c=
lear error on user side. This message:<span class=3D"gmail-"><br>
<br>
&quot;Can&#39;t open /dev/hdb exclusively.=C2=A0 Mounted filesystem?&quot;<=
br>
<br></span>
indicates that device is NOT UNUSED and it has to be unused for this operat=
ion - i.e. you MAY NOT run this operation while there are active LVs from t=
his PV (one of possible reasons why=C2=A0 &#39;hdb&#39; cannot be opened ex=
clusively)<br>
<br>
<br></blockquote><div><br></div><div><br></div><div>Hi Zdenek,</div><div><b=
r></div><div>I&#39;m running a 5 nodes XEN dom0s cluster which uses a share=
d VG and few hundreds LVs to store virtual machines disks.</div><div><br></=
div><div>As we were running out of space in the actual VG, I was about to a=
dd a new PV and take the opportunity to increase the metadata size as you d=
escribed below.</div><div><br></div><div>I was wondering if I could run the=
 &quot;pvcreate --restorefile=C2=A0--metadatacopies 0&quot; while the VG (a=
nd PV) were online.</div><div><br></div><div>Now I got the answer :-)</div>=
<div><br></div><div>Thank you !<br></div><div><br></div><div>Charles</div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
To increase &#39;metadata&#39; size - you ether have to add some NEW PV wit=
h<br>
much bigger metadata size space (and such operation still needs some<br>
extra space to proceed with existing size). Then disable existing metadata<=
br>
areas - so you will end-up of storing bigger MDA only to this new bigger MD=
A on a new PV -=C2=A0 note - it&#39;s quite risky plan to leave MDA only on=
 single PV in multi-PV VG=C2=A0 - so I&#39;d not advice this for any seriou=
s use.<br>
<br>
You may PV via pvmove to a new bigger PV.<br>
(adviced operation - though it may take its time...)<br>
<br>
There is NOT lvm2=C2=A0 native support for=C2=A0 &#39;online&#39; resize of=
 PV mda size - and while it&#39;s possible to do this operation manually - =
it&#39;s quite complex task - so I&#39;d not advice to do this either - unl=
ess you have FULL backup of everything.<br>
<br>
So back to your original problem - please describe=C2=A0 EXACTLY what is yo=
ur problem and attach=C2=A0 outputs of=C2=A0 pvs,vgs,lvs=C2=A0 and what you=
 want to achieve.<br>
<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman<wbr>/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWT<wbr>O/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">	<table style=3D"font-size:12.8px;font-family:&quot;tr=
ebuchet ms&quot;,sans-serif">
      <tbody>
        <tr>
          <td style=3D"color:rgb(166,166,166);font-size:14px;font-weight:bo=
ld">Charles Koprowski</td>
        </tr>
        <tr>
          <td style=3D"font-size:14px;padding-bottom:20px">Systems &amp; Ne=
tworks</td>
        </tr>
        <tr>
          <td>
            <table cellspacing=3D"0">
              <tbody>
                <tr>
                  <td style=3D"border-right:2px solid red;padding-right:20p=
x">
                    <a href=3D"http://www.audaxis.com/" style=3D"color:rgb(=
17,85,204)" target=3D"_blank"><img src=3D"https://drive.google.com/uc?expor=
t=3Ddownload&amp;id=3D0B_HZi6nqg-rWRTNrcThjNUFfSUU" width=3D"120" height=3D=
"auto"></a>
                  </td>                 =20
                  <td style=3D"border-right:2px solid red;padding-right:20p=
x;padding-left:20px">
                    <table cellspacing=3D"0">
                      <tbody>
                        <tr>
                          <td colspan=3D"4">
                            <a href=3D"mailto:cko@audaxis.com" style=3D"fon=
t-size:14px;color:rgb(0,0,0);letter-spacing:2px;text-decoration:none" targe=
t=3D"_blank">cko@audaxis.com</a>
                          </td>
                        </tr>
                        <tr>
                          <td>Tel :=20
                          <a href=3D"tel:+33+3+20+63+88+70" value=3D"+33 3 =
20 63 88 70" style=3D"font-size:14px;color:rgb(0,0,0);text-decoration:none"=
 target=3D"_blank">
                            +33 3 20 63 88 70
                          </a></td>
                        </tr>
                        <tr>
                          <td>GSM :=20
                          <a href=3D"tel:+33+6+29+32+63+33" value=3D"+33 6 =
29 32 63 33" style=3D"font-size:14px;color:rgb(0,0,0);text-decoration:none"=
 target=3D"_blank">
                            +33 6 29 32 63 33
                          </a></td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                  <td style=3D"padding-left:20px">
                    <table cellspacing=3D"0">
                      <tbody>
                        <tr>
                          <td style=3D"padding:0px">
                            <a href=3D"http://twitter.com/audaxis" style=3D=
"color:rgb(17,85,204)" target=3D"_blank">
                              <img src=3D"https://drive.google.com/uc?expor=
t=3Ddownload&amp;id=3D0B_HZi6nqg-rWbDRGUFFydU1lRUk"></a>
                            <br>
                            <a href=3D"http://www.linkedin.com/company/auda=
xis" style=3D"color:rgb(17,85,204)" target=3D"_blank">
                              <img src=3D"https://drive.google.com/uc?expor=
t=3Ddownload&amp;id=3D0B_HZi6nqg-rWSEZiTURMR09sdGM"></a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table></div>
</div></div>

--001a1140bcda4106ee053dbd16f3--
