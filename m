From: sgallet@netcourrier.com
Mime-Version: 1.0
Message-Id: <mnet3.1023803882.15501.sgallet@netcourrier.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pb with vgimport
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
Date: Tue Jun 11 08:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Hello,
I have an error when i do =

vgimport lvmvg1 /dev/hde1 /dev/hdf1 /dev/hdg1 /dev/hdk
vgimport -- ERROR: wrong number of physical volumes to import volume group=
 =22lvmvg1

This is my pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV =22/dev/hdk=22   is in EXPORTED VG =22lvmvg1PV=5FEXP=
PV=5FEXPPV=5FEXP=22 =5B76.69 GB / 0 free=5D
pvscan -- inactive PV =22/dev/hdg1=22  is in EXPORTED VG =22lvmvg1PV=5FEXP=
PV=5FEXPPV=5FEXP=22 =5B37.27 GB / 0 free=5D
pvscan -- ACTIVE   PV =22/dev/hdh1=22 of VG =22lvmvg2=22                  =
       =5B74.52 GB / 55.89 GB free=5D
pvscan -- inactive PV =22/dev/hde1=22  is in EXPORTED VG =22lvmvg1PV=5FEXP=
PV=5FEXPPV=5FEXP=22 =5B38.34 GB / 0 free=5D
pvscan -- inactive PV =22/dev/hdf1=22  is in EXPORTED VG =22lvmvg1PV=5FEXP=
PV=5FEXPPV=5FEXP=22 =5B28.62 GB / 0 free=5D
pvscan -- total: 5 =5B255.47 GB=5D / in use: 5 =5B255.47 GB=5D / in no VG:=
 0 =5B0=5D

Help me please

CONFIDENTIALITE : =

Ce message et les =E9ventuelles pi=E8ces attach=E9es sont confidentiels. =

Si vous n'=EAtes pas dans la liste des destinataires, veuillez informer l'=
exp=E9diteur imm=E9diatement et ne pas divulguer le contenu =E0 une tierce=
 personne, ne pas l'utiliser pour quelque raison que ce soit, ne pas stock=
er ou copier l'information qu'il contient sur un quelconque support.

-------------------------------------------------------------
NetCourrier, votre bureau virtuel sur Internet : Mail, Agenda, Clubs, Tool=
bar...
Web/Wap : www.netcourrier.com
T=E9l=E9phone/Fax : 08 92 69 00 21 (0,34 =80 TTC/min)
Minitel: 3615 NETCOURRIER (0,15 =80 TTC/min)
