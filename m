Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i95Apvr06347
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 06:51:57 -0400
Received: from gw-eur4.philips.com (gw-eur4.philips.com [161.85.125.10])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i95Apvha025321
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 06:51:57 -0400
Received: from smtpscan-eur4.philips.com (smtpscan-eur4.mail.philips.com
	[130.144.57.167])
	by gw-eur4.philips.com (Postfix) with ESMTP id BE6D74998C
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2004 10:51:51 +0000 (UTC)
Received: from smtpscan-eur4.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 5AB781522
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2004 10:51:51 +0000 (GMT)
Received: from smtprelay-eur2.philips.com (smtprelay-eur2.philips.com
	[130.144.57.171])
	by smtpscan-eur4.philips.com (Postfix) with ESMTP id 26013151E
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2004 10:51:51 +0000 (GMT)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-eur2.philips.com (8.9.3p3/8.9.3-1.2.2m-20040401) with
	ESMTP id KAA21044
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2004 10:51:50 GMT
From: seva.feldman@philips.com
MIME-Version: 1.0
Message-ID: <OF59BDAAE7.F295BD07-ONC2256F24.003B2D1E-C2256F24.003BDF32@philips.com>
Date: Tue, 5 Oct 2004 12:50:38 +0200
Content-Type: multipart/alternative;
	boundary="=_alternative 003BAEF4C2256F24_="
Subject: [linux-lvm] extend the PV
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
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 003BAEF4C2256F24_=
Content-Type: text/plain; charset="US-ASCII"

Hi All,

I have external Promise v15100 SATA storage. Few days ago I've added 5 
250GB HD's and migrated my raid from 512GB to 1TB. When I first time setup 
a PV I put it on /dev/sda (storage virtual disk). Now this disk has 512GB 
more, but I can not find a way to extend the PV. May be some one can help 
me?

Thanks!
--=_alternative 003BAEF4C2256F24_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi All,</font>
<br>
<br><font size=2 face="sans-serif">I have external Promise v15100 SATA
storage. Few days ago I've added 5 250GB HD's and migrated my raid from
512GB to 1TB. When I first time setup a PV I put it on /dev/sda (storage
virtual disk). Now this disk has 512GB more, but I can not find a way to
extend the PV. May be some one can help me?</font>
<br>
<br><font size=2 face="sans-serif">Thanks!</font>
--=_alternative 003BAEF4C2256F24_=--
