Received: from twilight.int.mornfall.net (ovpn-112-27.phx2.redhat.com
	[10.3.112.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o97CEtWR029609
	for <linux-lvm@redhat.com>; Thu, 7 Oct 2010 08:14:56 -0400
From: Petr Rockai <prockai@redhat.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<4CAB46FE.9050309@cfl.rr.com>
	<86106.13599.qm@web120714.mail.ne1.yahoo.com>
	<Pine.LNX.4.64.1010061255250.12083@bmsred.bmsi.com>
	<87ocb7jk3d.fsf@twilight.int.mornfall.net.>
	<4CACC6B0.2030603@cfl.rr.com>
Date: Thu, 07 Oct 2010 14:14:43 +0200
In-Reply-To: <4CACC6B0.2030603@cfl.rr.com> (Phillip Susi's message of "Wed, 6
	Oct 2010 14:57:52 -0400")
Message-ID: <87fwwijj2k.fsf@twilight.int.mornfall.net.>
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Phillip Susi <psusi@cfl.rr.com> writes:
>> LVM has a generation counter as well. It's only updated on metadata
>> writes though, so it doesn't cost anything. (Log is not part of metadata
>> in this sense.) When you lose a leg (and use dmeventd), the metadata on
>> the remaining PVs is updated to say that. The leg is also yanked from
>> the mirror. You can add it as a fresh image (with full resync) if it
>> ever comes back.
>
> Why a full resync?  With mdadm, it just keeps flagging the dirty chunks
> so it only has to copy those when the other disk returns.

Because it's really hard to guarantee anything when you experience a
failure. The safe route is to discard any data on the failed
drive. Certainly better than winding up with a subtly corrupt mirror.

As I said before, if you experience that a lot, you should be using
replication not mirroring.

Yours,
   Petr.
