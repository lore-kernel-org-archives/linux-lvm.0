Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1CG00O11745
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 11:00:00 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j1CFxxHD029354
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 10:59:59 -0500
Date: Sat, 12 Feb 2005 15:59:54 +0100 (MET)
From: "Thomas Meller" <thomas.meller@gmx.net>
MIME-Version: 1.0
References: <OFBAE0E4B6.042046DD-ONC1256FA4.003CCFFB-C1256FA4.003D216A@uz.tengelmann.de>
Subject: Re: [linux-lvm] HA Functionality for LVM
Message-ID: <7332.1108220394@www37.gmx.net>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Joerg,

LVM is not cluster aware. There is a descendant named EVMS. You can find it
on sourceforge. I have no idea about it's status.
We are using LVM on a self-designed HA solution. It is really hostile when
you use RAID underneath. There is a free command line utility named SCU to
solve concurrency problems. We are still evaluating it. Some painstaking
work, though.

Good luck

Thomas
-----------------
thomas
| .dot. |
meller AT
GMX
? .dot. ?
net

> Hi there,
> 
> i have the question if there is a ha functionality for lvm especially
> to activate one vg in excusive mode (like hp lvm). Or are there other ways
> to
> do this ?
> 
> Any ideas?
> 
> Regards
> 
> 
> J�rg Middendorf
> Tengelmann Warenhandelsgesellschaft KG
> Betriebssysteme Unix / Linux
> Wissollstr. 5-43
> 45478 M�lheim
> Deutschland
> +++++++++++++++++
> Tel: 0208-5806-6625
> Fax: 0208-5806-6804
> e-mail : middendorf@uz.tengelmann.de
> Groupmail : unixadm@uz.tengelmann.de
> http: www.tengelmann.de
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
DSL Komplett von GMX +++ Superg�nstig und stressfrei einsteigen!
AKTION "Kein Einrichtungspreis" nutzen: http://www.gmx.net/de/go/dsl
