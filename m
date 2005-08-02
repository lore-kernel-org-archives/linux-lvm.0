Message-ID: <42EF3177.409@gmx.net>
Date: Tue, 02 Aug 2005 10:40:23 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: [Fwd: Re: [linux-lvm] Progress on LVM2 snapshots]]
Content-Transfer-Encoding: 8bit
Reply-To: hubgor@poczta.fm,
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com, agk@redhat.com
Cc: hubgor@poczta.fm



-------- Original-Nachricht --------
Betreff: Re: [linux-lvm] Progress on LVM2 snapshots]
Datum: Tue, 02 Aug 2005 10:39:47 +0200
Von: Hubert <hubgor@poczta.fm>
An: Klaus Strebel <klaus.strebel@gmx.net>
Referenzen: <42EDD9A3.5060602@gmx.net>

Hello Klaus ;-)

Could you ask Alasdair wich dm devel patches should be added with kernel
2.6.12-rc5 ?

I noticed that in this kerenel release are added many dm devel patches.

Best regards and many thanks ;-)

Have a nice day

Hubert

Klaus Strebel napisa�(a):

> FYI
>
> -------- Original-Nachricht --------
> Betreff: Re: [linux-lvm] Progress on LVM2 snapshots
> Datum: Fri, 29 Jul 2005 21:47:57 +0100
> Von: Alasdair G Kergon <agk@redhat.com>
> Antwort an: LVM general discussion and development <linux-lvm@redhat.com>
> An: LVM general discussion and development <linux-lvm@redhat.com>
> Referenzen: <1119267914.21477.3.camel@dilbert> 
> <1122572640.9888.27.camel@localhost.localdomain>
>
> On Thu, Jul 28, 2005 at 01:44:00PM -0400, Ming Zhang wrote:
>
>> 1) very hard to solve technically. or
>> 2) not so easy but doable, just no time and human resource?
>
>
> The hardest part of the fix involves changing the sequence of
> device-mapper ioctls that LVM2 uses, and that's a couple of weeks'
> development work, now pencilled into the RHEL4 Update 3 timescale.
>
> In the meantime, you can apply the snapshot patches in the -udm
> tree and use 'dmsetup' manually to activate and deactivate snapshots
> when lvm2 fails.
>
> Patches 8 and 9 at:
>
> ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/ 
>
> (Further patches are needed, but those two plus correct dmsetup use
> should avoid machine lockups.)
>
> Alasdair


----------------------------------------------------------------------
Najlepszy serwis MOTO w Polsce! >>> http://link.interia.pl/f18a8


-- 
Mit freundlichen Gr�ssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
