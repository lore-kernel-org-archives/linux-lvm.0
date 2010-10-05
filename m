Received: from twilight.int.mornfall.net (ovpn-112-24.phx2.redhat.com
	[10.3.112.24])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95835Z3005324
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 04:03:06 -0400
Received: from twilight.int.mornfall.net. (localhost [127.0.0.1])
	by twilight.int.mornfall.net (Postfix) with ESMTP id 88E0725CF4
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2010 10:02:55 +0200 (CEST)
From: Petr Rockai <prockai@redhat.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
Date: Tue, 05 Oct 2010 10:02:55 +0200
In-Reply-To: <87363.97197.qm@web120701.mail.ne1.yahoo.com> (Jay's message of
	"Mon, 4 Oct 2010 16:55:28 -0700 (PDT)")
Message-ID: <87y6adm5hs.fsf@twilight.int.mornfall.net.>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM mirror questions
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Jay <jrharris19@yahoo.com> writes:
> What happens to an lvm mirror if the disk log is lost?

The mirror should continue to work with a core (memory) log.

Yours,
   Petr.
