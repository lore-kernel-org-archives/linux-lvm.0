Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9IHPfJj007030
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 18:25:41 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GaFAj-0000aJ-22
	for linux-lvm@redhat.com; Wed, 18 Oct 2006 18:25:41 +0100
Date: Wed, 18 Oct 2006 18:25:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "System ID" entry missing in metadata (LVM2) ?!
Message-ID: <20061018172540.GS17654@agk.surrey.redhat.com>
References: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
	<3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
	<de2c187f9caa97b59d590fc079a61702@redhat.com>
	<45365026.90006@anykey.de>
	<ef27ef6e007de550b667566332420b44@redhat.com>
	<453662B3.6000603@anykey.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <453662B3.6000603@anykey.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Try setting hosttags - see man lvm.conf.

lvchange --addtag host1 vg1/lv1
lvchange -ay vg1/lv1

lvchange -an vg1/lv1
lvchange --addtag host2 vg1/lv1
lvchange -ay vg1/lv1

Alasdair
-- 
agk@redhat.com
