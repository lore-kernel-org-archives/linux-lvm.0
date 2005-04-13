Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3DEwZO15643
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:58:35 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3DEwYjP018418
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:58:34 -0400
Message-ID: <425D3399.5050307@online.de>
Date: Wed, 13 Apr 2005 16:58:33 +0200
From: Klaus Strebel <klaus.strebel@online.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 und Snapshots =?ISO-8859-1?Q?f=FCr_mein_?=
	=?ISO-8859-1?Q?Abschlussprojekt?=
References: <614019203@web.de> <200504121140.00117.ulf.kellermann@exaecon.com>
In-Reply-To: <200504121140.00117.ulf.kellermann@exaecon.com>
Content-Transfer-Encoding: 7bit
Reply-To: klaus.strebel@gmx.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ulf Kellermann wrote:
> Hallo Melanie,
> 
> ich glaube um eine Antwort zu bekommen solttest Du in englisch schreiben.
... the rest of list can read your messages too, without using a 
bablefish and the chance of getting a rood answer is bigger ;-) ...

> Mein Tip an Dich:
> 	Installiere Red Hat, u.U. auch SuSE 9.x (ich finde die LVM konfiguration als 
> User gelungen) und wenn Du ein bisschen das Gefuehl bekommst, stelle Deine 
> Fragen an die Mailinglist, aber in Englisch.

Neither the 'data' nor the 'directory-tree' is saved, the changed blocks 
on the lowest access level are stored in the snapshot. So, your snapshot 
  has to be big enough to save all changed blocks of the day ( at max, 
the full volume size ! ).

> 
> Meines Wissen lebt Heinz Mauelshagen in den USA und es mir nicht bewusst, dass 
> er Deutsch kann.
I remembered the beginning of LVM just 'some' years ago, Heinz's email 
signature was (found it in the LVM-mail archives):

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                  Entwicklungszentrum 
Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                  64205 Darmstadt
mge ez-darmstadt telekom de                      Germany
                                                  +49 6151 886-425
                                                           FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

so, i'd expect him to speak german quite fluently ;-).

Ciao
Klaus
