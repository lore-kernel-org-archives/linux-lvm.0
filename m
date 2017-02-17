Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HHAr5Q009689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 12:10:53 -0500
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DCD891C03
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 17:10:52 +0000 (UTC)
Received: from quad.stoffel.org (unknown [66.189.62.98])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id B726D5FF46
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 12:01:51 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22695.11391.98129.185244@quad.stoffel.home>
Date: Fri, 17 Feb 2017 12:01:51 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
	<58A64774.10004@tlinx.org>
	<2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Roy" == Roy Sigurd Karlsbakk <roy@karlsbakk.net> writes:

Roy> I get 200MB on a cold day and 500 on a nice one from this
Roy> SAN. These 40-50MB/s seem really being limited by pvmove
Roy> alone. Nothing else shows this limit. That's why I'm asking.
Roy> Vennlig hilsen / Best regards

Is any one CPU pegged on your server running the pmove?  It's probably
single threaded and if it's a single LV you're moving, that might
explain the problem.

It might also be that even though you have 4 x 1gb to one server,
since it's the same IP pair on each end, it's not really spreading the
load across all the links.

It might be faster to do a clone on the source side, and then use DD
to copy the data from the quiet clone to the destination.  Then mount
the destination and use rsync to bring them up to sync.

But it would be helpful to see more details about the OS, etc.

John
