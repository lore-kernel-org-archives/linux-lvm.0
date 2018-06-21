Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB52C290A3
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2018 07:26:36 +0000 (UTC)
Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AB823086254
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2018 07:26:35 +0000 (UTC)
From: Michael Lipp <mnl@mnl.de>
Message-ID: <ba2de1c3-518b-f252-1435-9c4ebd7aa6fd@mnl.de>
Date: Thu, 21 Jun 2018 09:26:33 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] How to get a list of all logical groups or volumes
	using dbus API
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,

I searched, but I cannot find the "root hook". Using the Manager
interface, I can lookup a LV if I have some id (LookUpByLvmId). But how
can I achieve the same results as vgs/lvs using the dbus API? I *could*
get the list of paths and pattern match them, but IMHO this would be a hack.

=C2=A0- Michael
