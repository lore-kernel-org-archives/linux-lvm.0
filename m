Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2071207ABFA
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 13:22:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE5CF18AE955
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 13:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id 2B5E52410BF
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 09:12:38 -0400 (EDT)
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CCpS2JxQTd3U for <linux-lvm@redhat.com>;
	Fri,  9 Oct 2020 09:12:37 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id BAA1E599
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 09:12:37 -0400 (EDT)
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jThUYFg_BbnI for <linux-lvm@redhat.com>;
	Fri,  9 Oct 2020 09:12:37 -0400 (EDT)
Received: from pulsar.alteeve.com (dhcp-108-168-17-168.cable.user.start.ca
	[108.168.17.168])
	by zimbra.alteeve.com (Postfix) with ESMTPSA id 9941B674
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 09:12:37 -0400 (EDT)
From: Digimer <lists@alteeve.ca>
Message-ID: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
Date: Fri, 9 Oct 2020 09:12:38 -0400
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM PV UUID problem
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hi all,

  I'm storing LVM information in a postgres database, and wanted to use
the UUID from the PVs / VGs / LVs as the UUIDs in the database. I
noticed when I tried to do this that postgres complained that the UUID
was not valid. I checked with an online UUID validator
(https://www.freecodeformat.com/validate-uuid-guid.php) and it also
reported as invalid.

Example;

=3D=3D=3D=3D
# pvdisplay | grep UUID
  PV UUID               jLkli2-dEXx-5Y8n-pYlw-nCcy-9dFL-3B6jU3
=3D=3D=3D=3D

  Is this a known issue?

Thanks for any help/insight!

--=20
Digimer
Papers and Projects: https://alteeve.com/w/
"I am, somehow, less interested in the weight and convolutions of
Einstein=E2=80=99s brain than in the near certainty that people of equal ta=
lent
have lived and died in cotton fields and sweatshops." - Stephen Jay Gould
