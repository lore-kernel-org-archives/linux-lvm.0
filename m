Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0RFRXb2020447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 10:27:33 -0500
Received: from mx2.megagroup.ru (mx2.megagroup.ru [89.175.255.3])
	by mx1.redhat.com (Postfix) with ESMTPS id EB28EC0B66D0
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 15:27:30 +0000 (UTC)
Received: from mx2.megagroup.ru (localhost [127.0.0.1])
	by mx2.megagroup.ru (8.14.9/8.14.9/TX) with ESMTP id u0RFPrrx028253
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 18:27:28 +0300
Received: from mastodon.megagroup.ru (mail.megagroup.ru [89.175.251.227])
	by mx2.megagroup.ru (8.14.9/8.14.9/RX) with ESMTP id u0RFPn6u028182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Jan 2016 18:25:50 +0300
Received: (from andrey@localhost)
	by mastodon.megagroup.ru (8.14.9/8.14.4/Submit) id u0RFPnTR028175
	for linux-lvm@redhat.com; Wed, 27 Jan 2016 18:25:49 +0300
Date: Wed, 27 Jan 2016 18:25:49 +0300
From: Andrey Staselko <andrey@megagroup.ru>
Message-ID: <20160127152549.GL7782@mastodon>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] bug in lvmlockd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

If lvm configured with --enable-lockd-dlm and without --enable-lockd-sanlock,
then "lvmlockd --adopt 1" always produces error "adopt_locks failed, reset host" in adopt_locks().

lm_get_lockspaces_sanlock() stub in daemons/lvmlockd/lvmlockd-internal.h line 577 returns -1,
that breaks the adopt_locks() function in daemons/lvmlockd/lvmlockd-core.c line 5160:
        
	rv = lm_get_lockspaces_sanlock(&ls_found);
	if ((rv < 0) && (rv != -ECONNREFUSED))
		goto fail;

AS
