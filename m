Message-Id: <199911041105.AA23293@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Plattenwanderung
Date: Thu, 04 Nov 1999 12:04:50 MET
In-Reply-To: <382152F9.3AE204E5@rz.rwth-aachen.de>; from "Frau A. Lorenz" at Nov 04, 99 10:33 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Frau A. Lorenz" <lorenz@rz.rwth-aachen.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi,

es reicht "vgchange -ay virt1_vg" und "vgexport virt1_vg"
auf der 1ten Maschine und nach uminstallieren der Platten
eine "vgimport virt1_vg /dev/sd[bc]1" auf der 2ten Maschine.

Evtl. sind andere Zuordnungen der special files auf der 2ten
Maschinen gegeben und man muss diese zuerst per pvscan herausfinden.

vgmknodes ist nicht erforderlich, da vgscan die device specials
fuer die volume group neu mit anlegt.

Gruss,
Heinz

> 
> Hallo,
> 
> ich m=F6chte meine logical Volume Group virt1_vg, welche sich auf zwei
> SCSI-Platten verteilt von einem Rechner auf einen anderen verlagern.
> Mu=DF ich au=DFer
>    vgexport virt1_vg
>    vgimport virt1_vg /dev/sd[bc]1
> noch etwas beachten, vielleicht ein vgmknodes oder so ???
> 
> Gruss Andrea
> 
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
