Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9Q0Orr23158
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2004 20:24:53 -0400
Message-Id: <200410260024.i9Q0OkYL030617@mx3.redhat.com>
From: "THORSTEN TOVACOVSKY" <THORSTEN.TOVACOVSKY@KARLSRUHER.DE>
Date: 26 Oct 2004 01:28:00 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm und raid0 auf z/linux
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LINUX-LVM@sistina.com

--- Erhalten von  A12.TOVACO 0721/353-4569                   26.10.04 01.28

  -> LINUX-LVM@SISTINA.COM

Hallo Heinz,

meine Mail damals ging scheinbar in das Diskussionsforum zum LVM. Ich bekam nie
Antwort...Durch Zufall bin ich nun doch �ber die Antwort im WEB gestolpert.

Zu deiner Antwort:
Ich wei�, da� ich Stripes per lvcreate definieren kann, aber was ist, wenn ich
zus�tzliche Platten in die VG h�ngen will ?

raid0 im lvm kann ja nicht erweitert werden, oder ?

gr��e
thorsten

--------------------------------------------------------------
On Fri, Sep 26, 2003 at 04:46:00PM +0200, THORSTEN TOVACOVSKY wrote:
> --- Erhalten von  A12.TOVACO 0721/353-4569                   26.09.03 15.46
>
>   -> LINUX-LVM(A)SISTINA.COM
>
> Hallo Herr Mauelshagen,
>
> wir nutzen Suse SLS8 31Bit auf einer z900 (2C1) unter z/VM (64Bit).
>
> Wir versuchen den LVM mit Raid0 - Devices arbeiten zu lassen.

Hallo Herr Tovacovsky,

LVM unterst�tzt RAID0 direkt. Eine Kombination mit MD ist nich erforderlich
(siehe "lvcreate -i n -I n ...").

>
> Des �fteren kommt bei diversen Commands der LVM scheinbar durcheinander und
> zeigt pl�tzlich das 1.Devices unterm Raid0-Device an.
>
> Beispiel:
> VG mit 6 PVs
> per pvmove eines dieser PVs freigeschaufelt,
> dann per vgreduce dieses aus der VG versucht zu entfernen.
>
> ein pvscan bringt dann pl�tzlich sowohl das md-dev als auch die 1.device im md
> als inaktiv.

Sollte im Prinzip funktionieren. Ich vermute, das SuSE noch eine �ltere
LVM Tool Version ausliefert.

Aber wie oben gesagt: Sie k�nnen RAID0 LVs komplett ohne MD direkt
mit LVM erzeugen.

>
> Da ist also sowieso schon was schiefgegangen. Leider sind diese beiden dann
per
> pvchange -xn /dev/xxx nicht als PVs entfernbar. Siehe Meldung:
>
>  > pvchange -- unable to find volume group of "/dev/dasdk1" (VG not active?) <
>
> Scheints mu� die VG doch noch aktiv sein, doch dann bekomm ich die PVs ja auch
> nicht raus, dann dann folgende Meldung kommt:
>
>  > pvchange -- physical volume "/dev/md0" is unallocatable <
>
>
> Und nun ?
> Haben Sie�nen Tipp f�r uns ?
> K�nnen Wir sie bei einer eventuellen Fehlersuche unterst�tzen ?
>
> Gr��e
> Thorsten
> (Karlsruher Lebensversicherung AG)
> ###########################################################
>
> This e-mail message has been scanned for Viruses
> by a Content Security Software.
>
> KARLSRUHER Lebensversicherung AG, 2003
>
> ###########################################################
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm sistina com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--

Gru�,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen Sistina com                           +49 2626 141200
                                                       FAX 924446
###########################################################

This e-mail message has been scanned for Viruses 
by a Content Security Software. 

KARLSRUHER Lebensversicherung AG, 2004

###########################################################
