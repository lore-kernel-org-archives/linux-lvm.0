Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0TCRWF4028915
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 07:27:32 -0500
Received: from xenon22.um.es (xenon22.um.es [155.54.212.162])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0TCRUI0014068
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 07:27:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by xenon22.um.es (Postfix) with ESMTP id EBB7CE65D
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 13:27:29 +0100 (CET)
Received: from xenon22.um.es ([127.0.0.1])
	by localhost (xenon22.um.es [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PiLQl8oOK+rr for <linux-lvm@redhat.com>;
	Wed, 29 Jan 2014 13:27:29 +0100 (CET)
Received: from [155.54.67.5] (joshua.atica.um.es [155.54.67.5])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: amateo@um.es)
	by xenon22.um.es (Postfix) with ESMTPSA id C8906E62C
	for <linux-lvm@redhat.com>; Wed, 29 Jan 2014 13:27:29 +0100 (CET)
Message-ID: <52E8F3CD.5080300@um.es>
Date: Wed, 29 Jan 2014 13:27:57 +0100
From: "Angel L. Mateo" <amateo@um.es>
MIME-Version: 1.0
References: <52E7A3CC.9000406@um.es>	<CAD+pdNdm+02V3UZfbHfaM1h+DB7gd7Yg0E1hg2eZH2-_HGTpmA@mail.gmail.com>	<52E8B4C3.6010703@um.es>
	<52E8E9C8.10207@um.es> <23523-1390996685-660187@sneakemail.com>
In-Reply-To: <23523-1390996685-660187@sneakemail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

El 29/01/14 12:58, Seb A escribi�:
> Glad it's working for you now Angel. I noticed you had exactly the same
> error messages as I did in my post yesterday.
>
> Was there any way of telling from the information you gave, or the output of
> any other command, if the LUNs are RW or RO?
>
	In my system, there are messages like:

Jan 28 14:15:25 myotis52fa kernel: [    1.724926] sd 3:0:2:0: [sdc] 
Write Protect is on

-- 
Angel L. Mateo Mart�nez
Secci�n de Telem�tica
�rea de Tecnolog�as de la Informaci�n
y las Comunicaciones Aplicadas (ATICA)
http://www.um.es/atica
Tfo: 868887590
Fax: 868888337
