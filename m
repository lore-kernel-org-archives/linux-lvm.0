Return-Path: <terje.eggestad@scali.no>
Message-Id: <200012210915.KAA32105@elin.scali.no>
Date: Thu, 21 Dec 2000 10:15:40 +0100 (CET)
From: Terje Eggestad <terje.eggestad@scali.no>
Subject: Re: [linux-lvm] Can I use LVM with ReiserFS?
In-Reply-To: <a05001923b66697749fe8@[129.98.91.150]>
References: <a05001923b66697749fe8@[129.98.91.150]>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-Disposition: INLINE
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@sistina.com, mvolaski@aecom.yu.edu

The correct procedure to do this is NOT to create a new fs on the second
RAID volume. What you do is this:
(NB: I've only done this on HP-UX before, and even if linux lvm is modelled
after  HP's I do not know if there are any error here, but I REALLY doubt
it ).=20

* add the RAID device to the volume group the first RAID device belong to
using vgextend.=20
* increase the logical volume you have your reiserfs on using lvextend
* resize the reiser fs using procedure in http://www.namesys.com/rsz.html

And it seems it can all be done online!

TJ

On Wed, 20 Dec 2000 12:31:06 -0500 Maurice Volaski <Maurice Volaski <mvolas=
ki@aecom.yu.edu>> wrote:

> I'm getting ready to install a server that will use hardware RAID 5=20
> and I want to make a hardware RAID volume, put ReiserFS on it and=20
> initially make it appear as /home to my users. Then at some point=20
> later, I want to take another hardware RAID volume, put ReiserFS on=20
> it and add it to the existing /home so that users all of a sudden see=20
> a huge increase in the size of /home. Can this be done or will my use=20
> of ReiserFS make it a problem?
> --=20
>=20
> Maurice Volaski, mvolaski@aecom.yu.edu
> Computing Support, Rose F. Kennedy Center
> Albert Einstein College of Medicine of Yeshiva University
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


--
_________________________________________________________________________

Terje Eggestad                  terje.eggestad@scali.no
Scali Scalable Linux Systems    http://www.scali.com

Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
N-0621 Oslo                     fax:    +47 22 62 89 51
NORWAY           =20
_________________________________________________________________________
