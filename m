Message-ID: <3D0F4889.4080704@ibourgogne.net>
From: =?ISO-8859-1?Q?S=E9bastien_GALLET?= <sgallet@ibourgogne.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pb with vgimport
References: <mnet3.1023803882.15501.sgallet@netcourrier.com> <20020618130736.C26268@sistina.com>
Content-Type: multipart/alternative;
 boundary="------------060702000104020902010500"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jun 18 09:50:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--------------060702000104020902010500
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Thank you for your answer, but I found a solution by editing  disc and=20
partitions with Linux Disk Editor ....
Now, everything is ok and I found my data back.=20

lvmvg1PV_EXPPV_EXPPV_EXP:  I exported 3 times the VG.  Is the result=20
normal???=20

It would seem that the problem comes from export (or the importation) on=20
hdk.
.


Heinz J . Mauelshagen wrote:

>"lvmvg1PV_EXPPV_EXPPV_EXP" looks very strange.
>The suffix PV_EXP should only be there once.
>
>Which LVM versions of the tools and driver did you use?
>Do you remmeber the steps which lead to this situation?
>
>Please send a bzipped tasball which contains the output files retrieved wi=
th
>
>for d in /dev/hd[e-g]1 /dev/hdk
>do
>	dd if=3D$d of=3D`basename $d`.vgda bs=3D1k count=3D4k
>done
>
>to me directly <mge@sistina.com> to fix this.
>
>On Tue, Jun 11, 2002 at 03:58:03PM +0200, sgallet@netcourrier.com wrote:
> =20
>
>>Hello,
>>I have an error when i do=20
>>vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdk
>>vgimport -- ERROR: wrong number of physical volumes to import volume grou=
p "lvmvg1
>>
>>This is my pvscan
>>pvscan -- reading all physical volumes (this may take a while...)
>>pvscan -- inactive PV "/dev/hdk"   is in EXPORTED VG "lvmvg1PV_EXPPV_EXPP=
V_EXP" [76.69 GB / 0 free]
>>pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPP=
V_EXP" [37.27 GB / 0 free]
>>pvscan -- ACTIVE   PV "/dev/hdh1" of VG "lvmvg2"                         =
[74.52 GB / 55.89 GB free]
>>pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPP=
V_EXP" [38.34 GB / 0 free]
>>pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPP=
V_EXP" [28.62 GB / 0 free]
>>pvscan -- total: 5 [255.47 GB] / in use: 5 [255.47 GB] / in no VG: 0 [0]
>>
>>Help me please
>>
>>CONFIDENTIALITE :=20
>>Ce message et les =EF=BF=BDventuelles pi=EF=BF=BDces attach=EF=BF=BDes so=
nt confidentiels.=20
>>Si vous n'=EF=BF=BDtes pas dans la liste des destinataires, veuillez info=
rmer l'exp=EF=BF=BDditeur imm=EF=BF=BDdiatement et ne pas divulguer le cont=
enu =EF=BF=BD une tierce personne, ne pas l'utiliser pour quelque raison qu=
e ce soit, ne pas stocker ou copier l'information qu'il contient sur un que=
lconque support.
>>
>>-------------------------------------------------------------
>>NetCourrier, votre bureau virtuel sur Internet : Mail, Agenda, Clubs, Too=
lbar...
>>Web/Wap : www.netcourrier.com
>>T=EF=BF=BDl=EF=BF=BDphone/Fax : 08 92 69 00 21 (0,34 EUR TTC/min)
>>Minitel: 3615 NETCOURRIER (0,15 EUR TTC/min)
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>   =20
>>
>
> =20
>


--------------060702000104020902010500
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Thank you for your answer, but I found a solution by editing&nbsp; disc and partitions
with Linux Disk Editor ....<br>
Now, everything is ok and I found my data back.&nbsp; <br>
<br>
lvmvg1PV_EXPPV_EXPPV_EXP:&nbsp; I exported 3 times the VG.&nbsp; Is the result normal???&nbsp;
<br>
<br>
It would seem that the problem comes from export (or the importation) on
hdk.<br>
.<br>
<br>
<br>
Heinz J . Mauelshagen wrote:<br>
<blockquote type="cite" cite="mid20020618130736.C26268@sistina.com">
  <pre wrap="">"lvmvg1PV_EXPPV_EXPPV_EXP" looks very strange.
The suffix PV_EXP should only be there once.

Which LVM versions of the tools and driver did you use?
Do you remmeber the steps which lead to this situation?

Please send a bzipped tasball which contains the output files retrieved with

for d in /dev/hd[e-g]1 /dev/hdk
do
	dd if=$d of=`basename $d`.vgda bs=1k count=4k
done

to me directly <a class="moz-txt-link-rfc2396E" href="mailto:mge@sistina.com">&lt;mge@sistina.com&gt;</a> to fix this.

On Tue, Jun 11, 2002 at 03:58:03PM +0200, <a class="moz-txt-link-abbreviated" href="mailto:sgallet@netcourrier.com">sgallet@netcourrier.com</a> wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hello,
I have an error when i do 
vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdk
vgimport -- ERROR: wrong number of physical volumes to import volume group "lvmvg1

This is my pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdk"   is in EXPORTED VG "lvmvg1PV_EXPPV_EXPPV_EXP" [76.69 GB / 0 free]
pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPPV_EXP" [37.27 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh1" of VG "lvmvg2"                         [74.52 GB / 55.89 GB free]
pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPPV_EXP" [38.34 GB / 0 free]
pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EXPPV_EXP" [28.62 GB / 0 free]
pvscan -- total: 5 [255.47 GB] / in use: 5 [255.47 GB] / in no VG: 0 [0]

Help me please

CONFIDENTIALITE : 
Ce message et les &eacute;ventuelles pi&egrave;ces attach&eacute;es sont confidentiels. 
Si vous n'&ecirc;tes pas dans la liste des destinataires, veuillez informer l'exp&eacute;diteur imm&eacute;diatement et ne pas divulguer le contenu &agrave; une tierce personne, ne pas l'utiliser pour quelque raison que ce soit, ne pas stocker ou copier l'information qu'il contient sur un quelconque support.

-------------------------------------------------------------
NetCourrier, votre bureau virtuel sur Internet : Mail, Agenda, Clubs, Toolbar...
Web/Wap : <a class="moz-txt-link-abbreviated" href="http://www.netcourrier.com">www.netcourrier.com</a>
T&eacute;l&eacute;phone/Fax : 08 92 69 00 21 (0,34 &#8364; TTC/min)
Minitel: 3615 NETCOURRIER (0,15 &#8364; TTC/min)


_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</a>
<a class="moz-txt-link-freetext" href="http://lists.sistina.com/mailman/listinfo/linux-lvm">http://lists.sistina.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://www.sistina.com/lvm/Pages/howto.html">http://www.sistina.com/lvm/Pages/howto.html</a>
    </pre>
  </blockquote>
  <pre wrap=""><!---->
  </pre>
</blockquote>
<br>
</body>
</html>

--------------060702000104020902010500--
