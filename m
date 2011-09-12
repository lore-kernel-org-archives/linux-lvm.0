Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8CDvVEd013076
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 09:57:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CDvRYn016282
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 09:57:27 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8CDv7xB010576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 09:57:07 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8CDv6Oh009346
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 09:57:07 -0400
Date: Mon, 12 Sep 2011 09:57:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20110912023345.476db018@bettercgi.com>
Message-ID: <alpine.LRH.2.00.1109120949090.9046@bmsred.bmsi.com>
References: <4E6D5600.4060008@tlinx.org>
	<20110912023345.476db018@bettercgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] more vg problems or oddities...not using dmsetup
 remove seems to be bad?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 12 Sep 2011, Ray Morris wrote:

> --force means, in my opinion at least, "Yes, I know what I'm doing.
> I understand why the system is saying I better not do this, but
> I want to force it to happen anyway". When it's used to mean "I don't
> understand what's going on, I don't know why this is a bad idea,
> but do it anyway", that sounds to me like a recipe for problems.

The problem is, when the snapshot is "active" (has an 'a' in the status
in lvs), but not "open" (no 'o' in the status), lvremove still
refuses to remove, complaining about the LV being "active".

There seems to be some confusion about terminology.  Active means
it is loaded into device mapper and mapped to /dev/vgname/lvname AFAIKT.

Fortunately, lvremove -f seems to complain when the LV is actually open.

In the OP problem, we don't know the exact error message, so perhaps
the snapshot really was open.  In any case, she needs to stop the
merge from happening the next time the LV is activated.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
