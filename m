Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1H1OFeN016179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 20:24:15 -0500
Received: from nm14-vm6.bullet.mail.gq1.yahoo.com
	(nm14-vm6.bullet.mail.gq1.yahoo.com [98.136.218.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFB49C057873
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 01:24:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Message-ID: <20170217012411.5795927.25908.11697@yahoo.com>
Date: Thu, 16 Feb 2017 20:24:11 -0500
From: pattonme@yahoo.com
In-Reply-To: <58A64774.10004@tlinx.org>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
	<58A64774.10004@tlinx.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove speed
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
To: L A Walsh <linux-lvm@redhat.com>LVM general discussion and development <linux-lvm@redhat.com>

They both being dell products the smartest method is to do array to array snapshot replication. Then at some point quiescing the source and do the final sync. Pvmove has an implicit transaction size and is probably too small for good efficiency.

Unless you are running parrallel‎ tcp copy threads more links doesn't help. 
