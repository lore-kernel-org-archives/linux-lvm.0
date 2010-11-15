Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFHqkZX005863
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 12:52:46 -0500
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFHqXFP008023
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 12:52:33 -0500
Received: by vws13 with SMTP id 13so1820875vws.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 09:52:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CDDE2CE.90907@bmsi.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
	<4CDDE2CE.90907@bmsi.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Mon, 15 Nov 2010 09:52:11 -0800
Message-ID: <AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 12, 2010 at 16:58, Stuart D Gathman <stuart@bmsi.com> wrote:
> On 11/12/2010 07:17 PM, chris (fool) mccraw wrote:
>> still curious about Zumastor--does anyone use this in production?
> Zumastor would not speed up a single snapshot. =EF=BF=BDIt solves the pro=
blem of
> supporting multiple (as in lots of) snapsnots with the same performance
> as a single snapshot (so that taking a snap every 5mins becomes
> practical).

I realize this.  like i said, we can probably eat the performance hit
for a single snapshot, but more than one is just not workable so far.

But I still haven't heard back from anyone who finds it production
ready, so it is strting to feel entirely academic.

> BTW, rewriting that 1G file would be normal speed, since
> the modified chunks have already been copied to the snapshot.

i'd think that, and you'd think that, but it is not the case.  most of
my tests were done by rewriting the file 4x, and while the snap %used
(monitored with the 'lvs' command) doesn't keep going up, performance
stays the same.
