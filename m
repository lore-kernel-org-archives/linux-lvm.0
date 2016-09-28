Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8SDq6xV030525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 09:52:06 -0400
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1562072D38
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 13:52:05 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id r126so53130346oib.0
	for <linux-lvm@redhat.com>; Wed, 28 Sep 2016 06:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Charles Koprowski <cko@audaxis.com>
Date: Wed, 28 Sep 2016 15:51:43 +0200
Message-ID: <CABGge9y-NDG1YdF3M5BSxems4wHHy2YiaXOi7dqFfG6VOGasSg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11c1829e892c55053d91aa05
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
To: linux-lvm@redhat.com, john@johnleach.co.uk

--001a11c1829e892c55053d91aa05
Content-Type: text/plain; charset=UTF-8

 On Sun, 10 Aug 2008 18:45:16 +0100, John Leach wrote:

On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:
> > To remove the metadata areas you need to:
> >
> >    get an up-to-date metadata backup (vgcfgbackup)
> >
> >   pvcreate --restorefile pointing at a copy of that backup file
> requesting 0 metadata areas
> > and specifying the same uuid as it had before
> >
> >   vgcfgrestore from the backup file
> >
> This doesn't look like something you can do with the volume group active
> (with cluster lvm anyway):
> [root testnode0 ~]# pvcreate --restorefile san-metadata -u
> fTLglk-j1C1-02Z7-8k6l-DTAm-2WNj-9ZGT19 --metadatacopies 0 /dev/hdb -ff
> Really INITIALIZE physical volume "/dev/hdb" of volume group "san" [y/n]? y
>   Can't open /dev/hdb exclusively.  Mounted filesystem?
> Is that right, or am I missing something?
>

Hi John,

I know it's been a long time but, Did you found out a solution for this ?

I'm trying to follow the same scenario to increase the metadatasize and got
stuck at the same point.

Thanks

Charles

-- 
Charles Koprowski
Systems & Networks
<http://www.audaxis.com/>
cko@audaxis.com
Tel : +33 3 20 63 88 70 <+33+3+20+63+88+70>
GSM : +33 6 29 32 63 33 <+33+6+29+32+63+33>
<http://twitter.com/audaxis>
<http://www.linkedin.com/company/audaxis>

--001a11c1829e892c55053d91aa05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0On=C2=A0Sun, 10 Aug 2008 18:45:16 +0100,=C2=A0J=
ohn Leach wrote:</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:<br>=
&gt; To remove the metadata areas you need to:<br>&gt;=C2=A0<br>&gt; =C2=A0=
 =C2=A0get an up-to-date metadata backup (vgcfgbackup)<br>&gt;=C2=A0<br>&gt=
; =C2=A0 pvcreate --restorefile pointing at a copy of that backup file requ=
esting 0 metadata areas<br>&gt; and specifying the same uuid as it had befo=
re<br>&gt;=C2=A0<br>&gt; =C2=A0 vgcfgrestore from the backup file<br>&gt; =
=C2=A0<br>This doesn&#39;t look like something you can do with the volume g=
roup active<br>(with cluster lvm anyway):<br>[root testnode0 ~]# pvcreate -=
-restorefile san-metadata -u fTLglk-j1C1-02Z7-8k6l-DTAm-2WNj-9ZGT19 --metad=
atacopies 0 /dev/hdb -ff<br>Really INITIALIZE physical volume &quot;/dev/hd=
b&quot; of volume group &quot;san&quot; [y/n]? y<br>=C2=A0 Can&#39;t open /=
dev/hdb exclusively.=C2=A0 Mounted filesystem?<br>Is that right, or am I mi=
ssing something?<br></blockquote><div><br></div><div>Hi John,</div><div><br=
></div><div>I know it&#39;s been a long time but, Did you found out a solut=
ion for this ?</div><div><br></div><div>I&#39;m trying to follow the same s=
cenario to increase the metadatasize and got stuck at the same point.</div>=
<div><br></div><div>Thanks</div><div><br></div><div>Charles</div><div><br><=
/div>-- <br><div class=3D"gmail_signature">	<table style=3D"font-size:12.8p=
x;font-family:&quot;trebuchet ms&quot;,sans-serif">
      <tbody>
        <tr>
          <td style=3D"color:rgb(166,166,166);font-size:18px">Charles Kopro=
wski</td>
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
                            <a href=3D"mailto:cko@audaxis.com" style=3D"col=
or:rgb(0,0,0);letter-spacing:2px;text-decoration:none" target=3D"_blank">ck=
o@audaxis.com</a>
                          </td>
                        </tr>
                        <tr>
                          <td>Tel :=20
                          <a href=3D"tel:+33+3+20+63+88+70" value=3D"+33 3 =
20 63 88 70" style=3D"color:rgb(0,0,0);text-decoration:none" target=3D"_bla=
nk">
                            +33 3 20 63 88 70
                          </a></td>
                        </tr>
                        <tr>
                          <td>GSM :=20
                          <a href=3D"tel:+33+6+29+32+63+33" value=3D"+33 6 =
29 32 63 33" style=3D"color:rgb(0,0,0);text-decoration:none" target=3D"_bla=
nk">
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
</div>

--001a11c1829e892c55053d91aa05--
