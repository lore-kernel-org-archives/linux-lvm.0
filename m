content-class: urn:content-classes:message
Subject: RE: [linux-lvm] I:LVM Raw Oracle 9i RAC
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <E1C82FD242FD6243B93A98A1F6BE6B100AA04D@SBCOR23A.es.gasnatural.com>
From: "Bernat Covacho, Jose Maria" <jmbernat@gasnatural.com>
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
Date: Fri Sep 19 06:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Heinz

Yes. We see the same degradation using Oracle

Oracle witho=
ut LVM takes 15 sec to read 8 GB , and Oracle with lvm takes 50-60 sec

=
Thank=B4s

Bernat

-----Mensaje original-----
De: Heinz J . Mauelsha=
gen [mailto:mauelshagen@sistina.com] 
Enviado el: viernes, 19 de septiem=
bre de 2003 12:40
Para: linux-lvm@sistina.com
Asunto: Re: [linux-lvm] I=
:LVM Raw Oracle 9i RAC


dd is no good tool to do such performance num=
bers.
Do you see any degradations in Oracle compared to non-LVM raw devi=
ces ?

Regards,
Heinz    -- The LVM Guy --


On Tue, Sep 16, 2003 a=
t 01:30:05PM +0200, Bernat Covacho, Jose Maria wrote:
> Hello, we have a=
 RedHat Avanced Server 2.1 with kernel version 2.4.9-e.12smp and we use l=
vm version 1.0.3 (yes I know that the latest "one" version is 1.0.7). I t=
hink that the version 2 is too much advanced for us. 
>  
> We have a v=
ery strange problem with lvm, oracle and raw devices. If we take a logica=
l volume manager and test it with a simple dd we get:
>  
> -----------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
----------
> time dd if=3D/dev/MKTP/strip32 of=3D/dev/null bs=3D512k cou=
nt=3D2048 
> 2048+0 registros le=EDdos
> 2048+0 registros escritos
>  =

> real    0m13.394s
> user    0m0.000s
> sys     0m6.090s
> --------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------
>  
> Ok, It works fine, we have 1Gbyte in 13 seconds.
>=
  
> Now we bind this logical volume to a raw device
>  
> -----------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
----------
> raw /dev/MKTP/strip32 /dev/raw/raw15
> -------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--
>  
> and we try with this:
>  
> --------------------------------=
-------------------------------------------------------------------------=
--------------------------------------------------------------
> time dd=
 if=3D/dev/raw/raw15  of=3D/dev/null bs=3D512k count=3D2048 
> 2048+0 re=
gistros le=EDdos
> 2048+0 registros escritos
>  
> real    0m14.828s
=
> user    0m0.020s
> sys     0m6.180s
> -------------------------------=
-------------------------------------------------------------------------=
---------------------------------------------------------------
>  
> T=
he same time, more or less, all it's ok. 
>  
> Now we want use this ra=
w (raw15) with oracle. We create a oracle tablespace put data into. We ca=
n access it through oracle.
>  
> We stop oracle. Now we repeat the sam=
e dd:
>  
> -----------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------------------------
> time dd if=3D/dev/raw/raw15 of=3D/=
dev/null bs=3D512k count=3D2048
> 2048+0 registros le=EDdos
> 2048+0 re=
gistros escritos
>  
> real    0m48.971s
> user    0m0.010s
> sys    =
 0m11.590s
> -----------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------------------------
>  
> Now we have 48 seconds, why?,=
 The only one difference is the tablespace creation.
>  
> We try the s=
ame process without lvm and we have the same good time in three cases.
>=
  
> There are some problem with lvm, raw and oracle?
> How can I avoid=
 this?
>  
> Thanks in advanced
>  
>  
>  
>  
>  
> =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Esta informaci=F3n es privada y =
confidencial y est=E1 dirigida =FAnicamente a su destinatario. Si usted n=
o es el destinatario original de este mensaje y por este medio pudo acced=
er a dicha informaci=F3n por favor elimine el mensaje y notifique el env=ED=
o err=F3neo al remitente. La distribuci=F3n o copia de este mensaje est=E1=
 estrictamente prohibida. Esta comunicaci=F3n es s=F3lo para prop=F3sitos=
 de informaci=F3n y no deber=EDa ser considerada como una declaraci=F3n o=
ficial del Grupo gasNatural. La transmisi=F3n de e-mails no garantiza que=
 el correo electr=F3nico sea seguro. Por consiguiente, no manifestamos qu=
e esta informaci=F3n sea completa o precisa. Toda informaci=F3n est=E1 su=
jeta a alterarse sin previo aviso. Este Correo Electr=F3nico ha sido proc=
esado por nuestro sistema de Antivirus corporativo 
> 
>  This informat=
ion is private and confidential and intended for the recipient only. If y=
ou are not the intended recipient of this message you are hereby notified=
 that any review it and notify the sender immediately, dissemination, dis=
tribution or copying of this message is strictly prohibited.  This commun=
ication is for information purposes only and should not be regarded as an=
 official statement from gasNatural Group. Email transmission cannot be g=
uaranteed to be secure.  Therefore, we do not represent that this informa=
tion is complete or accurate and it should not be relied upon as such.All=
 information is subject to change without notice. This email has been sca=
nned by our Antivirus system
> 

*** Software bugs are stupid.
    Ne=
vertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=

Heinz Mauelshagen                                 Sistina Software Inc.=

Senior Consultant/Developer                       Am Sonnenhang 11
   =
                                               56242 Marienrachdorf
    =
                                              Germany
Mauelshagen@Sistin=
a.com                           +49 2626 141200
                        =
                               FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

_________________=
______________________________
linux-lvm mailing list
linux-lvm@sistina=
.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM H=
OW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Esta informaci=F3n es privada y confidencial y est=E1 =
dirigida =FAnicamente a su destinatario. Si usted no es el destinatario o=
riginal de este mensaje y por este medio pudo acceder a dicha informaci=F3=
n por favor elimine el mensaje y notifique el env=EDo err=F3neo al remite=
nte. La distribuci=F3n o copia de este mensaje est=E1 estrictamente prohi=
bida. Esta comunicaci=F3n es s=F3lo para prop=F3sitos de informaci=F3n y =
no deber=EDa ser considerada como una declaraci=F3n oficial del Grupo gas=
Natural. La transmisi=F3n de e-mails no garantiza que el correo electr=F3=
nico sea seguro. Por consiguiente, no manifestamos que esta informaci=F3n=
 sea completa o precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin=
 previo aviso. Este Correo Electr=F3nico ha sido procesado por nuestro si=
stema de Antivirus corporativo 

 This information is private and confi=
dential and intended for the recipient only. If you are not the intended =
recipient of this message you are hereby notified that any review it and =
notify the sender immediately, dissemination, distribution or copying of =
this message is strictly prohibited.  This communication is for informati=
on purposes only and should not be regarded as an official statement from=
 gasNatural Group. Email transmission cannot be guaranteed to be secure. =
 Therefore, we do not represent that this information is complete or accu=
rate and it should not be relied upon as such.All information is subject =
to change without notice. This email has been scanned by our Antivirus sy=
stem
