Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7TFGE6A001705
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2014 11:16:14 -0400
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7TFGBZG002328
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2014 11:16:11 -0400
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 45504317650
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2014 17:11:09 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Fri, 29 Aug 2014 17:16:09 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA501AA8B8A41A2@XCH11.scidom.de>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] reduce size of snapshot - what is about previous
 reduce of file system ? - SOLVED
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>
> Hi,
>
> i have a lv which has a snapshot. Size of the snapshot was too big while
> creating. So I'd like now to reduce the size of the snapshot for being able to
> create a second one. man lvreduce says: Shrinking snapshot logical volumes
> (...) is supported as well. Ok, that's fine. But normally, before shrinking a lv,
> the file system has to be reduced. But does the snapshot have a fs ? I never
> ran a mkfs.xxxx on it. Can I just reduce the size without doing anything
> before ? Or do I have to provide a -r to lvreduce ?
>
> Thanks for any information.
>
>
> Bernd
>
> --


Hi,

I managed to reduce the snapshot without doing anything before with the filesystem.


Bernd

Helmholtz Zentrum München
Deutsches Forschungszentrum für Gesundheit und Umwelt (GmbH)
Ingolstädter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir´in Bärbel Brumme-Bothe
Geschäftsführer: Prof. Dr. Günther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
Registergericht: Amtsgericht München HRB 6466
USt-IdNr: DE 129521671
