content-class: urn:content-classes:message
Subject: RE: [linux-lvm] I:LVM Raw Oracle 9i RAC
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <E1C82FD242FD6243B93A98A1F6BE6B100A8EC8@SBCOR23A.es.gasnatural.com>
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
Date: Fri Sep 19 08:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I try with differents stripes (16, 32, 64) and without stripe. The same r=
esults for all cases. 

are there somebody using lvm and oracle rac 9.2=
.0.4?

Thanks in advanced

Bernat



-----Mensaje original-----
=
De: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com] 
Enviado el: =
viernes, 19 de septiembre de 2003 14:32
Para: linux-lvm@sistina.com
CC:=
 mge@sistina.com
Asunto: Re: [linux-lvm] I:LVM Raw Oracle 9i RAC

On F=
ri, Sep 19, 2003 at 01:12:00PM +0200, Bernat Covacho, Jose Maria wrote:
=
> Hi Heinz
> 
> Yes. We see the same degradation using Oracle

Hmmm, =
I can only assume that the stripe units you choosed (it is a striped LV,
=
right ?) are suboptimal with raw devices in your case.

Because laying =
out striped LVs in the best performing way is very
application specific,=
 you may want to try different stripe sizes
(lvcreate's -I option) and d=
ifferent numbers of stripes (-i option).

I am not aware of any Oracle =
recommendations WRT using striped LVs.

Anyone from Oracle able to comm=
ent on this ?

Regards,
Heinz    -- The LVM Guy --

> 
> Oracle wit=
hout LVM takes 15 sec to read 8 GB , and Oracle with lvm takes 50-60 sec
=
> 
> Thank=B4s
> 
> Bernat
> 
> -----Mensaje original-----
> De: He=
inz J . Mauelshagen [mailto:mauelshagen@sistina.com] 
> Enviado el: vier=
nes, 19 de septiembre de 2003 12:40
> Para: linux-lvm@sistina.com
> Asu=
nto: Re: [linux-lvm] I:LVM Raw Oracle 9i RAC
> 
> 
> dd is no good too=
l to do such performance numbers.
> Do you see any degradations in Oracl=
e compared to non-LVM raw devices ?
> 
> Regards,
> Heinz    -- The LV=
M Guy --
> 
> 
> On Tue, Sep 16, 2003 at 01:30:05PM +0200, Bernat Cova=
cho, Jose Maria wrote:
> > Hello, we have a RedHat Avanced Server 2.1 wi=
th kernel version 2.4.9-e.12smp and we use lvm version 1.0.3 (yes I know =
that the latest "one" version is 1.0.7). I think that the version 2 is to=
o much advanced for us. 
> >  
> > We have a very strange problem with =
lvm, oracle and raw devices. If we take a logical volume manager and test=
 it with a simple dd we get:
> >  
> > --------------------------------=
-------------------------------------------------------------------------=
---------------------------------------------------------------
> > time=
 dd if=3D/dev/MKTP/strip32 of=3D/dev/null bs=3D512k count=3D2048 
> > 20=
48+0 registros le=EDdos
> > 2048+0 registros escritos
> >  
> > real  =
  0m13.394s
> > user    0m0.000s
> > sys     0m6.090s
> > ------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
----------
> >  
> > Ok, It works fine, we have 1Gbyte in 13 seconds.
=
> >  
> > Now we bind this logical volume to a raw device
> >  
> > --=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------
> > raw /dev/MKTP/strip32 /dev/raw/raw15
> > -----=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-----------------
> >  
> > and we try with this:
> >  
> > ---------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------
> > time dd if=3D/dev/raw/raw15  of=3D/dev/null bs=3D512k =
count=3D2048 
> > 2048+0 registros le=EDdos
> > 2048+0 registros escrit=
os
> >  
> > real    0m14.828s
> > user    0m0.020s
> > sys     0m6.1=
80s
> > ----------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------
> >  
> > The same time, more or less, =
all it's ok. 
> >  
> > Now we want use this raw (raw15) with oracle. W=
e create a oracle tablespace put data into. We can access it through orac=
le.
> >  
> > We stop oracle. Now we repeat the same dd:
> >  
> > --=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------
> > time dd if=3D/dev/raw/raw15 of=3D/dev/null bs=3D=
512k count=3D2048
> > 2048+0 registros le=EDdos
> > 2048+0 registros es=
critos
> >  
> > real    0m48.971s
> > user    0m0.010s
> > sys     0=
m11.590s
> > -----------------------------------------------------------=
-------------------------------------------------------------------------=
------------------------------------
> >  
> > Now we have 48 seconds, =
why?, The only one difference is the tablespace creation.
> >  
> > We =
try the same process without lvm and we have the same good time in three =
cases.
> >  
> > There are some problem with lvm, raw and oracle?
> > =
How can I avoid this?
> >  
> > Thanks in advanced
> >  
> >  
> >  =

> >  
> >  
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 
=
> > Esta informaci=F3n es privada y confidencial y est=E1 dirigida =FAnic=
amente a su destinatario. Si usted no es el destinatario original de este=
 mensaje y por este medio pudo acceder a dicha informaci=F3n por favor el=
imine el mensaje y notifique el env=EDo err=F3neo al remitente. La distri=
buci=F3n o copia de este mensaje est=E1 estrictamente prohibida. Esta com=
unicaci=F3n es s=F3lo para prop=F3sitos de informaci=F3n y no deber=EDa s=
er considerada como una declaraci=F3n oficial del Grupo gasNatural. La tr=
ansmisi=F3n de e-mails no garantiza que el correo electr=F3nico sea segur=
o. Por consiguiente, no manifestamos que esta informaci=F3n sea completa =
o precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin previo aviso.=
 Este Correo Electr=F3nico ha sido procesado por nuestro sistema de Antiv=
irus corporativo 
> > 
> >  This information is private and confidentia=
l and intended for the recipient only. If you are not the intended recipi=
ent of this message you are hereby notified that any review it and notify=
 the sender immediately, dissemination, distribution or copying of this m=
essage is strictly prohibited.  This communication is for information pur=
poses only and should not be regarded as an official statement from gasNa=
tural Group. Email transmission cannot be guaranteed to be secure.  There=
fore, we do not represent that this information is complete or accurate a=
nd it should not be relied upon as such.All information is subject to cha=
nge without notice. This email has been scanned by our Antivirus system
=
> > 
> 
> *** Software bugs are stupid.
>     Nevertheless it needs no=
t so stupid people to solve them ***
> 
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> 
> Heinz Mauelsh=
agen                                 Sistina Software Inc.
> Senior Cons=
ultant/Developer                       Am Sonnenhang 11
>               =
                                    56242 Marienrachdorf
>              =
                                     Germany
> Mauelshagen@Sistina.com  =
                         +49 2626 141200
>                              =
                          FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> 
> _________________=
______________________________
> linux-lvm mailing list
> linux-lvm@sis=
tina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read t=
he LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Esta informaci=F3n es privada y confidenc=
ial y est=E1 dirigida =FAnicamente a su destinatario. Si usted no es el d=
estinatario original de este mensaje y por este medio pudo acceder a dich=
a informaci=F3n por favor elimine el mensaje y notifique el env=EDo err=F3=
neo al remitente. La distribuci=F3n o copia de este mensaje est=E1 estric=
tamente prohibida. Esta comunicaci=F3n es s=F3lo para prop=F3sitos de inf=
ormaci=F3n y no deber=EDa ser considerada como una declaraci=F3n oficial =
del Grupo gasNatural. La transmisi=F3n de e-mails no garantiza que el cor=
reo electr=F3nico sea seguro. Por consiguiente, no manifestamos que esta =
informaci=F3n sea completa o precisa. Toda informaci=F3n est=E1 sujeta a =
alterarse sin previo aviso. Este Correo Electr=F3nico ha sido procesado p=
or nuestro sistema de Antivirus corporativo 
> 
>  This information is =
private and confidential and intended for the recipient only. If you are =
not the intended recipient of this message you are hereby notified that a=
ny review it and notify the sender immediately, dissemination, distributi=
on or copying of this message is strictly prohibited.  This communication=
 is for information purposes only and should not be regarded as an offici=
al statement from gasNatural Group. Email transmission cannot be guarante=
ed to be secure.  Therefore, we do not represent that this information is=
 complete or accurate and it should not be relied upon as such.All inform=
ation is subject to change without notice. This email has been scanned by=
 our Antivirus system
> 
> 
> ________________________________________=
_______
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://list=
s.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http:/=
/tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Neverthe=
less it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

Heinz=
 Mauelshagen                                 Sistina Software Inc.
Senio=
r Consultant/Developer                       Am Sonnenhang 11
          =
                                        56242 Marienrachdorf
           =
                                       Germany
Mauelshagen@Sistina.com  =
                         +49 2626 141200
                               =
                        FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

_________________________=
______________________
linux-lvm mailing list
linux-lvm@sistina.com
ht=
tp://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at=
 http://tldp.org/HOWTO/LVM-HOWTO/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Esta informaci=F3n es privada y confidencial y est=E1 dirigida =
=FAnicamente a su destinatario. Si usted no es el destinatario original d=
e este mensaje y por este medio pudo acceder a dicha informaci=F3n por fa=
vor elimine el mensaje y notifique el env=EDo err=F3neo al remitente. La =
distribuci=F3n o copia de este mensaje est=E1 estrictamente prohibida. Es=
ta comunicaci=F3n es s=F3lo para prop=F3sitos de informaci=F3n y no deber=
=EDa ser considerada como una declaraci=F3n oficial del Grupo gasNatural.=
 La transmisi=F3n de e-mails no garantiza que el correo electr=F3nico sea=
 seguro. Por consiguiente, no manifestamos que esta informaci=F3n sea com=
pleta o precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin previo =
aviso. Este Correo Electr=F3nico ha sido procesado por nuestro sistema de=
 Antivirus corporativo 

 This information is private and confidential =
and intended for the recipient only. If you are not the intended recipien=
t of this message you are hereby notified that any review it and notify t=
he sender immediately, dissemination, distribution or copying of this mes=
sage is strictly prohibited.  This communication is for information purpo=
ses only and should not be regarded as an official statement from gasNatu=
ral Group. Email transmission cannot be guaranteed to be secure.  Therefo=
re, we do not represent that this information is complete or accurate and=
 it should not be relied upon as such.All information is subject to chang=
e without notice. This email has been scanned by our Antivirus system
