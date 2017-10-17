Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601F95D963
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 21:11:04 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5494C65DA6
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 21:11:02 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v9HKvBiV022942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 16:57:14 -0400
Date: Tue, 17 Oct 2017 16:57:10 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
Message-ID: <alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-1463811830-356833769-1508273834=:1285"
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811830-356833769-1508273834=:1285
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

You still haven't said what you are trying to accomplish.  I wouldn't
have bothered responding to such a vague question until you provided
some tantalizing clues.  Until your lastest clues, I would have advised
using rsync or dd to copy your data to a new volume.  But now it sounds
like you ran out of budget for another disk, or need to minimize down
time, and want to reconfigure in place.

First off, raid10 is a linux specialty (I didn't know LVM supported it,
thanks!), and is not the same as raid1+0 (raid1 on top of raid0).
However, your previous clue tells us that probably you have at least 4
disks in your raid10.  So you should be able to remove 2 legs from the
raid10, and still have the equivalent of a raid0.  But this is not
certain as raid10 works perfectly well with 2 or 3 disks, including the
redundancy.  In any case, you can remove at least 1 leg from your
raid10.  Be sure to backup first in any case.

Now that you've cut the disk used in half (and your data is precariously
dependent on the health of *both* underlying physical disks), what did
you want to do next?  Maybe you just want to create a different kind of
raid with the released space and do that rsync or dd?

On Tue, 17 Oct 2017, lejeczek wrote:

> no other raids but LVM's own.
> not much in configuration, unless I misunderstand, question I'm posing is 
> simple - is it possible to convert/split lvm raid10 LV into two raid0 LVs? 
> (here one thing comes to mind: data stays intact?) Or raid10 LV to any other 
> raid?
>
> As I sroogled I saw there is "mirror spitting" but term raid10 does not 
> appear in that context, or I failed to find it.
>
> But man pages also mention, with regards to raid takeover:
> "..
>        ·  between striped/raid0 and raid10.
> ..."
> So it sounds like possible(so no other raid levels but these two), only might 
> be intricate process/procedure, which is not documented, or again, I failed 
> to find it.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463811830-356833769-1508273834=:1285--
