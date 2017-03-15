Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2F18MGP023174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2017 21:08:22 -0400
Received: from nm11-vm10.bullet.mail.gq1.yahoo.com
	(nm11-vm10.bullet.mail.gq1.yahoo.com [98.136.218.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB4CD7E9C4
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2017 01:08:21 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <20170315010819.5783638.1837.14686@yahoo.com>
Date: Tue, 14 Mar 2017 21:08:19 -0400
From: pattonme@yahoo.com
In-Reply-To: <CAB-bdyTrKbjREU_vRAHiLQvWBh=rt8Mh45CZ0_-3BsHKSkz_Nw@mail.gmail.com>
References: <CAB-bdyTrKbjREU_vRAHiLQvWBh=rt8Mh45CZ0_-3BsHKSkz_Nw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vgcreate failed when using iscsi + dm-multipath +
	lvm
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
To: Neutron Sharc <linux-lvm@redhat.com>

How about posting mdadm status and pvs output? Are you doing this with a sc=
ript in rapid fire? What happens =E2=80=8Eif you slow it down with a sleep?=
 Why the -f flag to pvcreate?
