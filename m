From: bertrand.sirodot@bnpparibas.com
Message-ID: <80256997.0037B109.00@lonn000101.uk.paribas.com>
Date: Tue, 14 Nov 2000 10:18:09 +0000
Subject: [linux-lvm] vgimport failed due to not enough pv
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



Hi,

I am running a Mandrake 7.1 distribution with a 2.4.0-test10 kernel. Yesterday,
I needed to reboot my workstation and since then it didn't come back.
After lots of problem, I managed to export my volume group, but I can't reimport
it as it gives me the following message:
"vgimport -- ERROR pv_read_all_pv_of_vg(): PV number reading data of volume
group vg00".
I checked the number of pvs in my volume group using "vgcfgrestore -l -n vg00"
and it says 4, and I am sure that the ones I give in the command line are the
right ones. Has anybody an idea on how to force it to import my volume group?


Cheers.
Bertrand Sirodot
bertrand.sirodot@bnpparibas.com




___________________________________________________________

This message and any attachments (the "message") are intended solely for
the addressees and are confidential.  If you receive this message in error,
please delete it and immediately notify the sender.

Any use not in accord with its purpose, any dissemination or disclosure,
either whole or patial, is prohibited except formal approval.

The internet can not guarantee the integrity of this message.  BNP PARIBAS
(and its subsidiaries) shall (will) not therefore be liable for the message
if modified.
                      ---------------------------------------------

Ce message et toutes les pieces jointes (ci-apres le "message") sont
etablis a l'intention exclusive de ses destinataires et sont confidentiels.
Si vous recevez ce message par erreur, merci de le detruire et d'en avertir
immediatement l'expediteur.

Toute utilisation de ce message non conforme a sa destination, toute
diffusion ou toute publication, totale ou partielle, est interdite, sauf
autorisation expresse.

L'internet ne permettant pas d'assurer l'integrite de ce message, BNP
PARIBAS (et ses filiales) decline(nt) toute responsabilite au titre de ce
message, dans l'hypothese ou il aurait ete modifie.
___________________________________________________________
