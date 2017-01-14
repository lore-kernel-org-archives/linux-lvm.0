Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0E9q6PS017290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 04:52:06 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41C89C04B936
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 09:52:05 +0000 (UTC)
Received: from [192.168.0.229] (p5DE005BF.dip0.t-ipconnect.de [93.224.5.191])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: cvoelker)
	by mail.knebb.de (Postfix) with ESMTPSA id 2529B9C00D4
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 10:51:53 +0100 (CET)
References: <3f1173f8-9bd0-34c8-fb44-a799b0db276e@knebb.de>
	<e886dc5f-d68f-781b-ad5b-16e665086eee@gmail.com>
From: knebb@knebb.de
Message-ID: <a0a8cb16-d53e-cdad-7288-a5cea1f7a0af@knebb.de>
Date: Sat, 14 Jan 2017 10:50:57 +0100
MIME-Version: 1.0
In-Reply-To: <e886dc5f-d68f-781b-ad5b-16e665086eee@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Again: duplicate PVs - filter rules
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
To: linux-lvm@redhat.com

Thanks!

To be honest, I was not aware of global filters. And not aware of using
lvmetad, but it is enabled by default (CentOS7).

So I added the global_filter and now everything is fine:

global_filter = [ "r|/dev/sdb|","r|/dev/sdc|" ]

Greetings


Christian
