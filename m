Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A545D6A9
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 23:22:39 +0000 (UTC)
Received: from sonic304-23.consmr.mail.gq1.yahoo.com
	(sonic304-23.consmr.mail.gq1.yahoo.com [98.137.68.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A9CBC04B31B
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 23:22:38 +0000 (UTC)
Date: Tue, 12 Sep 2017 23:22:34 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1575245610.821680.1505258554456@mail.yahoo.com>
MIME-Version: 1.0
References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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


 > Step-by-step example:
 > - create a 40 GB thin volume and subtract its size from the thin pool (U=
SED 40 GB, FREE 60 GB, REFER 0 GB);
 > - overwrite the entire volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
 > - snapshot the volume (USED 40 GB, FREE 60 GB, REFER 40 GB);

And 3 other threads also take snapshots against the same volume, or frankly=
 any other volume in the pool.
Since the next step (overwrite) hasn't happened yet or has written less tha=
n 20GB, all succeed.

 > - completely overwrite the original volume (USED 80 GB, FREE 20 GB, REFE=
R 40 GB);

4 threads all try to write their respective 40GB. Afterall, they got the gr=
een-light since their snapshot was allowed to be taken.
Your thinLV blows up spectacularly.

 > - a new snapshot creation will fails (REFER is higher then FREE).
nobody cares about new snapshot creation attempts at this point.


> When do you decide it ?=C2=A0 (you need to see this is total race-lend)

exactly!
