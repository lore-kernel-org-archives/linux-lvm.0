Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4EF0784BE
	for <linux-lvm@redhat.com>; Tue, 23 May 2017 16:06:21 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D48309784E
	for <linux-lvm@redhat.com>; Tue, 23 May 2017 16:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 77B4F413
	for <linux-lvm@redhat.com>; Tue, 23 May 2017 17:57:52 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id YbfGmE6rWqwe for <linux-lvm@redhat.com>;
	Tue, 23 May 2017 17:57:52 +0200 (CEST)
Received: from [192.168.178.48] (p50802F36.dip0.t-ipconnect.de [80.128.47.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 28DEC410
	for <linux-lvm@redhat.com>; Tue, 23 May 2017 17:57:52 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <4857621d-c73a-081f-5264-cee196ddc6b2@mglug.de>
Date: Tue, 23 May 2017 17:57:51 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm.conf parameter for PVs to use for lvcreate ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

if I use mulitiple PVs, Im able to select these PVs which should be used
by my lv, i.e.

lvcreate --size 10G --name mylv myvg /dev/sda3 /dev/sdb3

Is it possible to set these "/dev/sda3 /dev/sdb3" as default in lvm.conf
if nothing is explicitly given?

Tfh!
Oliver
