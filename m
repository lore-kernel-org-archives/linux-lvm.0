From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200005120814.KAA07017@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o proto
In-Reply-To: <200005112151.XAA00152@e35.marxmeier.com> from Michael Marxmeier at "May 11, 2000 11:51:56 pm"
Date: Fri, 12 May 2000 10:14:33 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Michael Marxmeier <mike@msede.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com, tmdg@avbrief.com

> > You don't need a newer kernel. The format changed between <= 0.8 and 0.8final.
> > You have to re-create your physical volumes and to re-compile the new lvm-utils.
> 
> As far as i recall the physical format should be the same. Only the
> format of the data exchanged between kernel and user mode was changed.

Absolutely!

The i/o protocol related message tells you that you have a driver/library
combination which would mess with the data exchanged between user and
kernelspace.

The physical on disk metadata format (the so called VGDA) didn't change!

In future cases where I possibly have to change the VGDA on the disks i'll
provide transparent library functions which do the changes (actually i had this
case already and nobody complained).

Message: I don't like to destroy your installed configurations out there ;-{)

> 
> So using user-mode tools which are compatible with the LVM kernel
> components should be sufficient - no re-creation of PVs or other
> drastic options should be required.

Correct.

Regards,
Heinz

---

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
