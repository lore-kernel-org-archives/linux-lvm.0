Message-ID: <3D0F5DB8.2070802@ibourgogne.net>
From: =?ISO-8859-1?Q?S=E9bastien_GALLET?= <sgallet@ibourgogne.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pb with vgimport
References: <mnet3.1023803882.15501.sgallet@netcourrier.com> <20020618130736.C26268@sistina.com> <3D0F4889.4080704@ibourgogne.net> <20020618171317.A27032@sistina.com>
Content-Type: multipart/alternative;
 boundary="------------090302050900030103020300"
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
Date: Tue Jun 18 11:20:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--------------090302050900030103020300
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

1.0.4 with redhat 7.3 (2.4.18 patched by myself)
More informations :
When i did

vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 :
vgimports said that only 3 PVs ( of the 4) were given in arguments

but when i did=20

vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdk :
vgimport said :=20
vgimport -- ERROR: wrong number of physical volumes to import volume group =
"lvmvg1

That's why i think that there's a problem with hdk (which is a whole LVM=20
disk not a LVM partition).
But data on this disk seems to be good because i've restore them by=20
changing
PV_EXPlvmvg1PV_EXPPV_EXPPV_EXP
into
PV_IMPlvmvg1 with Linux Disk Editor
Any idea ???

Ps : Sorry for my english ...:">
Heinz J . Mauelshagen wrote:

>On Tue, Jun 18, 2002 at 04:49:45PM +0200, S=EF=BF=BDbastien GALLET wrote:
> =20
>
>>Thank you for your answer, but I found a solution by editing  disc and=20
>>partitions with Linux Disk Editor ....
>>Now, everything is ok and I found my data back.=20
>>
>>lvmvg1PV_EXPPV_EXPPV_EXP:  I exported 3 times the VG.  Is the result=20
>>normal???=20
>>   =20
>>
>
>Nope :-(
>
>Which LVM version was it?
>
>Regards,
>Heinz    -- The LVM Guy --
>
>
> =20
>
>>It would seem that the problem comes from export (or the importation) on =

>>hdk.
>>.
>>
>>
>>Heinz J . Mauelshagen wrote:
>>
>>   =20
>>
>>>"lvmvg1PV_EXPPV_EXPPV_EXP" looks very strange.
>>>The suffix PV_EXP should only be there once.
>>>
>>>Which LVM versions of the tools and driver did you use?
>>>Do you remmeber the steps which lead to this situation?
>>>
>>>Please send a bzipped tasball which contains the output files retrieved =
with
>>>
>>>for d in /dev/hd[e-g]1 /dev/hdk
>>>do
>>>	dd if=3D$d of=3D`basename $d`.vgda bs=3D1k count=3D4k
>>>done
>>>
>>>to me directly <mge@sistina.com> to fix this.
>>>
>>>On Tue, Jun 11, 2002 at 03:58:03PM +0200, sgallet@netcourrier.com wrote:
>>>=20
>>>
>>>     =20
>>>
>>>>Hello,
>>>>I have an error when i do=20
>>>>vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdk
>>>>vgimport -- ERROR: wrong number of physical volumes to import volume gr=
oup "lvmvg1
>>>>
>>>>This is my pvscan
>>>>pvscan -- reading all physical volumes (this may take a while...)
>>>>pvscan -- inactive PV "/dev/hdk"   is in EXPORTED VG "lvmvg1PV_EXPPV_EX=
PPV_EXP" [76.69 GB / 0 free]
>>>>pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EX=
PPV_EXP" [37.27 GB / 0 free]
>>>>pvscan -- ACTIVE   PV "/dev/hdh1" of VG "lvmvg2"                       =
  [74.52 GB / 55.89 GB free]
>>>>pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EX=
PPV_EXP" [38.34 GB / 0 free]
>>>>pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "lvmvg1PV_EXPPV_EX=
PPV_EXP" [28.62 GB / 0 free]
>>>>pvscan -- total: 5 [255.47 GB] / in use: 5 [255.47 GB] / in no VG: 0 [0]
>>>>
>>>>Help me please
>>>>
>>>>CONFIDENTIALITE :=20
>>>>Ce message et les =EF=BF=BDventuelles pi=EF=BF=BDces attach=EF=BF=BDes =
sont confidentiels.=20
>>>>Si vous n'=EF=BF=BDtes pas dans la liste des destinataires, veuillez in=
former l'exp=EF=BF=BDditeur imm=EF=BF=BDdiatement et ne pas divulguer le co=
ntenu =EF=BF=BD une tierce personne, ne pas l'utiliser pour quelque raison =
que ce soit, ne pas stocker ou copier l'information qu'il contient sur un q=
uelconque support.
>>>>
>>>>-------------------------------------------------------------
>>>>NetCourrier, votre bureau virtuel sur Internet : Mail, Agenda, Clubs, T=
oolbar...
>>>>Web/Wap : www.netcourrier.com
>>>>T=EF=BF=BDl=EF=BF=BDphone/Fax : 08 92 69 00 21 (0,34 EUR TTC/min)
>>>>Minitel: 3615 NETCOURRIER (0,15 EUR TTC/min)
>>>>
>>>>
>>>>_______________________________________________
>>>>linux-lvm mailing list
>>>>linux-lvm@sistina.com
>>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>>  =20
>>>>
>>>>       =20
>>>>
>>>=20
>>>
>>>     =20
>>>
>
>*** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                  56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                       FAX 924446
>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> =20
>


--------------090302050900030103020300
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
1.0.4 with redhat 7.3 (2.4.18 patched by myself)<br>
More informations :<br>
When i did<br>
<pre wrap="">vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 :
vgimports said that only 3 PVs ( of the 4) were given in arguments

but when i did 
</pre>
<pre wrap="">vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdk :
vgimport said : 
vgimport -- ERROR: wrong number of physical volumes to import volume group "lvmvg1</pre>
That's why i think that there's a problem with hdk (which is a whole LVM
disk not a LVM partition).<br>
But data on this disk seems to be good because i've restore them by changing
<br>
PV_EXPlvmvg1PV_EXPPV_EXPPV_EXP <br>
into <br>
PV_IMPlvmvg1 with Linux Disk Editor<br>
Any idea ???<br>
<br>
Ps : Sorry for my english ...:"&gt; <br>
Heinz J . Mauelshagen wrote:<br>
<blockquote type="cite" cite="mid20020618171317.A27032@sistina.com">
  <pre wrap="">On Tue, Jun 18, 2002 at 04:49:45PM +0200, S&eacute;bastien GALLET wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Thank you for your answer, but I found a solution by editing  disc and 
partitions with Linux Disk Editor ....
Now, everything is ok and I found my data back. 

lvmvg1PV_EXPPV_EXPPV_EXP:  I exported 3 times the VG.  Is the result 
normal??? 
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Nope :-(

Which LVM version was it?

Regards,
Heinz    -- The LVM Guy --


  </pre>
  <blockquote type="cite">
    <pre wrap="">It would seem that the problem comes from export (or the importation) on 
hdk.
.


Heinz J . Mauelshagen wrote:

    </pre>
    <blockquote type="cite">
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
T&eacute;l&eacute;phone/Fax : 08 92 69 00 21 (0,34 EUR TTC/min)
Minitel: 3615 NETCOURRIER (0,15 EUR TTC/min)


_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</a>
<a class="moz-txt-link-freetext" href="http://lists.sistina.com/mailman/listinfo/linux-lvm">http://lists.sistina.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://www.sistina.com/lvm/Pages/howto.html">http://www.sistina.com/lvm/Pages/howto.html</a>
   

        </pre>
      </blockquote>
      <pre wrap=""> 

      </pre>
    </blockquote>
  </blockquote>
  <pre wrap=""><!---->
*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
<a class="moz-txt-link-abbreviated" href="mailto:Mauelshagen@Sistina.com">Mauelshagen@Sistina.com</a>                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</a>
<a class="moz-txt-link-freetext" href="http://lists.sistina.com/mailman/listinfo/linux-lvm">http://lists.sistina.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://www.sistina.com/lvm/Pages/howto.html">http://www.sistina.com/lvm/Pages/howto.html</a>

  </pre>
</blockquote>
<br>
</body>
</html>

--------------090302050900030103020300--
