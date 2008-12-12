Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mBCCnIfq026459
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 07:49:18 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LB7SH-0002ld-TJ
	for linux-lvm@redhat.com; Fri, 12 Dec 2008 12:49:17 +0000
Date: Fri, 12 Dec 2008 12:49:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] A question about the metadata circular buffer
Message-ID: <20081212124917.GA24785@agk.fab.redhat.com>
References: <b2a58a4c0812120435jca6a842m13a389a5aa6d27e3@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2a58a4c0812120435jca6a842m13a389a5aa6d27e3@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Dec 12, 2008 at 08:35:46PM +0800, yuan yuan wrote:
>     if ((new_wrap && old_wrap) ||
>             (rlocn && (new_wrap || old_wrap) && (new_end > rlocn->offset))
> ||
>             (mdac->rlocn.size >= mdah->size)) {
>                 log_error("VG %s metadata too large for circular buffer",
>                           vg->name);

> My question is , for a circular buffer, why should we check so many
> conditions instead of just checking (mdac->rlocn.size >= mdah->size)?

The buffer has to hold *two* versions of the metadata during a change,
the old and the new version, and those two could be different sizes.

Alasdair
-- 
agk@redhat.com
