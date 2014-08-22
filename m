Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7M92d6D026908
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2014 05:02:39 -0400
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7M92ZFQ012302
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2014 05:02:36 -0400
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 72699317623
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2014 10:58:39 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Fri, 22 Aug 2014 11:02:32 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F8@XCH11.scidom.de>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] problem with lvcreate and
	redirection	of	stdout/stderr
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


Alasdair wrote:

On Thu, Aug 21, 2014 at 11:57:51AM -0500, Roger Heflin wrote:
> I can see how with the vg suspended that might have a problem.

> But nothing should be getting written to stderr while the device is suspended.


Hi,

i don't understand what you mean with "should be getting written". Does that mean "it's not possible that something is written" or "it would be better if nothing is written" ?

Bernd

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Helmholtz Zentrum München
Deutsches Forschungszentrum für Gesundheit und Umwelt (GmbH)
Ingolstädter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir´in Bärbel Brumme-Bothe
Geschäftsführer: Prof. Dr. Günther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
Registergericht: Amtsgericht München HRB 6466
USt-IdNr: DE 129521671
