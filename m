Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0T7wa1J016046
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 02:58:36 -0500
Received: from xenon22.um.es (xenon22.um.es [155.54.212.162])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0T7wXqS005004
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 02:58:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by xenon22.um.es (Postfix) with ESMTP id 8A3E8E543
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 08:58:32 +0100 (CET)
Received: from xenon22.um.es ([127.0.0.1])
	by localhost (xenon22.um.es [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rpx2189hlBtL for <linux-lvm@redhat.com>;
	Wed, 29 Jan 2014 08:58:32 +0100 (CET)
Received: from [155.54.67.5] (joshua.atica.um.es [155.54.67.5])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: amateo@um.es)
	by xenon22.um.es (Postfix) with ESMTPSA id 700A0E53D
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 08:58:31 +0100 (CET)
Message-ID: <52E8B4C3.6010703@um.es>
Date: Wed, 29 Jan 2014 08:58:59 +0100
From: "Angel L. Mateo" <amateo@um.es>
MIME-Version: 1.0
References: <52E7A3CC.9000406@um.es>
	<CAD+pdNdm+02V3UZfbHfaM1h+DB7gd7Yg0E1hg2eZH2-_HGTpmA@mail.gmail.com>
In-Reply-To: <CAD+pdNdm+02V3UZfbHfaM1h+DB7gd7Yg0E1hg2eZH2-_HGTpmA@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

El 28/01/14 16:22, Fran Garcia escribi�:
> hola Angel,
>
> you need to present your snapshot as a RW LUN ; otherwise you won't be
> able to activate the VG.
>
> As you should be writing your metadata to the snapshot the original data
> will remain unharmed.
>
	Ok. I'm going to try it. Thank you.


-- 
Angel L. Mateo Mart�nez
Secci�n de Telem�tica
�rea de Tecnolog�as de la Informaci�n
y las Comunicaciones Aplicadas (ATICA)
http://www.um.es/atica
Tfo: 868887590
Fax: 868888337
