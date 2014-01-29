Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0TBwE2P027994
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 06:58:14 -0500
Received: from sneak2.sneakemail.com (sneak2.sneakemail.com [38.113.6.65])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s0TBw7Cu028017
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 06:58:08 -0500
From: "Seb A" <4jngrhkk3c@snkmail.com>
References: <52E7A3CC.9000406@um.es>
	<CAD+pdNdm+02V3UZfbHfaM1h+DB7gd7Yg0E1hg2eZH2-_HGTpmA@mail.gmail.com>
	<52E8B4C3.6010703@um.es> <52E8E9C8.10207@um.es>
In-Reply-To: <52E8E9C8.10207@um.es>
Date: Wed, 29 Jan 2014 11:58:10 -0000
Message-ID: <23523-1390996685-660187@sneakemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Mounting a read only disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Glad it's working for you now Angel. I noticed you had exactly the same
error messages as I did in my post yesterday.

Was there any way of telling from the information you gave, or the output of
any other command, if the LUNs are RW or RO?

Kind regards, 

Sebastian  


 

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Angel L. 
> Mateo amateo-at-um.es |linux-lvm/Allow + Forward to Syn&Yahoo&Gmail|
> Sent: 29 January 2014 11:45
> To: ****************; ********************; 
> *****************; linux-lvm@redhat.com
> Subject: Re: [linux-lvm] Mounting a read only disk
> 
> El 29/01/14 08:58, Angel L. Mateo escribi�:
> > El 28/01/14 16:22, Fran Garcia escribi�:
> >> hola Angel,
> >>
> >> you need to present your snapshot as a RW LUN ; otherwise 
> you won't be
> >> able to activate the VG.
> >>
> >> As you should be writing your metadata to the snapshot the 
> original data
> >> will remain unharmed.
> >>
> >      Ok. I'm going to try it. Thank you.
> >
> >
> 	It works now with RW LUNs. Thank you very much.
> 
> -- 
> Angel L. Mateo Mart�nez
> Secci�n de Telem�tica
> �rea de Tecnolog�as de la Informaci�n
> y las Comunicaciones Aplicadas (ATICA)
> http://www.um.es/atica
> Tfo: 868887590
> Fax: 868888337
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
