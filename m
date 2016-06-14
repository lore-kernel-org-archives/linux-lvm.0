Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EFZJ4R026297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 11:35:19 -0400
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4EDCC04B307
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 15:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id B69F2141CC0
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:32 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id S8raRrsNAGze for <linux-lvm@redhat.com>;
	Tue, 14 Jun 2016 17:27:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 08517141B86
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:29 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QN6_vEkiyqKb for <linux-lvm@redhat.com>;
	Tue, 14 Jun 2016 17:27:28 +0200 (CEST)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 2B666141D44
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 1B5241018C8
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:25 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZJu1gdxKWH6x for <linux-lvm@redhat.com>;
	Tue, 14 Jun 2016 17:27:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 79E74101BC8
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:24 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M5DzIljLYN7i for <linux-lvm@redhat.com>;
	Tue, 14 Jun 2016 17:27:24 +0200 (CEST)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 4D9221018C8
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:27:24 +0200 (CEST)
Date: Tue, 14 Jun 2016 17:27:24 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1947646611.4779055.1465918044103.JavaMail.zimbra@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] managing "local" LVM and cLVM concurrently ?
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
To: LVM Mailingliste <linux-lvm@redhat.com>

Hi,

i have a configuration where i have some local logical volumes (on an internal RAID-Controller) and also some logical volumes on a SAN which are shared with a second host. Is this possible concurrently ?
Which locking_type to i have to povide ?

Thanks.


Bernd

-- 
Bernd Lentes 

Systemadministration 
institute of developmental genetics 
Gebäude 35.34 - Raum 208 
HelmholtzZentrum München 
bernd.lentes@helmholtz-muenchen.de 
phone: +49 (0)89 3187 1241 
fax: +49 (0)89 3187 2294 

Wer glaubt das Projektleiter Projekte leiten 
der glaubt auch das Zitronenfalter 
Zitronen falten
 

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen, Renate Schlusen (komm.)
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
