Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9NBH2A023647
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 18:11:17 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9NB4il002989
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 18:11:05 -0500
Received: by fxm3 with SMTP id 3so229905fxm.3
	for <linux-lvm@redhat.com>; Tue, 09 Dec 2008 15:11:04 -0800 (PST)
Message-ID: <b072968d0812091511o268e89bamd1cf615a40ea60d3@mail.gmail.com>
Date: Tue, 9 Dec 2008 23:11:04 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: FW: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
In-Reply-To: <20081207224843.GO26097@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081207224843.GO26097@agk.fab.redhat.com>
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Looks like I'm able to edit the wiki page now - thanks :-)

I went to add Bryn's instructions then discovered that they're already
in the wiki, so I've added an entry to the FAQ briefly explaining the
issue and pointing to the existing page[1]. I added a few new pages
too, one explaining the duplicate PV messages[2], and one for using
LVM with SAN based snapshots[3]. If there's anything incorrect or
unclear in there feel free to fix it or let me know.

The FAQ structure seems a bit strange to me. Would it be worthwhile
moving to a structure like the Cluster FAQ uses[4]? Or even a flat
page like the old cluster FAQ[5] (which I prefer - its easier to
search)?

[1] http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore
[2] http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/FoundDuplicatePV
[3] http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/SANBasedSnapshots
[4] http://sources.redhat.com/cluster/wiki/FAQ/CLVM
[5] http://sources.redhat.com/cluster/faq.html

--Dave

On Sun, Dec 7, 2008 at 10:48 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> That reply was meant to be addressed to you, not Michael.
>
>
