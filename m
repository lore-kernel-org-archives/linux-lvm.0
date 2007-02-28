Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1S14T2Z006546
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 20:04:29 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.232])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1S14QlR012292
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 20:04:26 -0500
Received: by wr-out-0506.google.com with SMTP id 69so2352570wra
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 17:04:26 -0800 (PST)
Message-ID: <170fa0d20702271704w469bec42t743b33d4dd82c584@mail.gmail.com>
Date: Tue, 27 Feb 2007 20:04:25 -0500
From: "Mike Snitzer" <snitzer@gmail.com>
Subject: Re: [linux-lvm] snapshots documentation clarification
In-Reply-To: <4384431.130961172620690322.JavaMail.root@zimbra.greatschools.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4384431.130961172620690322.JavaMail.root@zimbra.greatschools.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 2/27/07, Dane Miller <dane@greatschools.net> wrote:
>
> Section 3.8 "Snapshots" of the LVM Howto has a scary warning after the first paragraph (http://tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html), with a caveat in the last sentence:
>   "If the snapshot size equals the origin size, it will never overflow."
>
> What exactly does this mean?

It means there isn't any risk of the snapshot LV getting invalidated
because of overflow.  Reason being, the copy-on-write would only ever
fill (but _not_ overflow) the snapshot LV if the entire origin LV
changed.  Even if that were the case you wouldn't overflow because the
snap LV would accomodate such extensive change.

That said, I can't see how a long-term (3yr) _single_ snapshot is
useful but thats up to you.  Generally snapshots are done periodically
rather than maintaining a single snap for such a long period.  Do you
understand that LVM snapshots need a new snapshot LV for each snapshot
you create?  So if you want N snapshots, without the risk of overflow,
during the 3yr period you'd consume N*(size_of_origin_LV) space.

Mike
