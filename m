Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PDRAoH020564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 09:27:10 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C503562645
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 13:27:08 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 6DC327FCC6
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 15:27:07 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Apr 2016 13:27:07 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <CALm7yL33yCtUDA4g8_F0mrrbt5kJ6UqRbK_By2BUBVNii4+A-Q@mail.gmail.com>
References: <CALm7yL33yCtUDA4g8_F0mrrbt5kJ6UqRbK_By2BUBVNii4+A-Q@mail.gmail.com>
Message-ID: <87e5bd8183d08066ac92c280c2efa632@dds.nl>
Subject: Re: [linux-lvm] No way to waive "WARNING: Sum of all thin volumes
 sizes ..." concern, causes need to script around this?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Mark Mielke schreef op 23-04-2016 22:23:

> Thoughts?

Noticed it too. It didn't use to happen like a year ago. Personally 
myself I don't know the use case of non-overprovisioning. It seems to me 
that that is what thin is for; however, perhaps another important use 
case is easy snapshot creation to begin with.

Just stating that personally I was a little incredulous at the warning 
because it seemed and seems to me that that is what thin is for: 
overprovisioning.

The whole idea is having extents that can go in either direction, right.

Well, just my 2 cents. Nothing against that option though.
