Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBS2JgC0026759
	for <linux-lvm@redhat.com>; Tue, 27 Dec 2011 21:19:43 -0500
Received: from mx02.ausregistry.net.au (mx02.ausregistry.net.au [202.65.15.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBS2Je2N013321
	for <linux-lvm@redhat.com>; Tue, 27 Dec 2011 21:19:42 -0500
From: Stuart Browne <stuart.browne@ausregistry.com.au>
Date: Wed, 28 Dec 2011 13:19:26 +1100
Message-ID: <8CEF048B9EC83748B1517DC64EA130FB6B2A2206C1@off-win2003-01.ausregistrygroup.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Migrating linear LVM to striped
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi,

I've been trying to find out if it's possible to migrate an approximately half-used linear LV (across two LUN's) into a striped LV (across the same two LUN's).

From what I've read, it's possible to create an LV that is striped, but not really to migrate/convert from one form to the other.

My reading was also a bit vague on limitations or restrictions were in place for a striped LV's use (both LUN's must be the same size (assuming they do)? etc.).

My current plan of action appears to be to create a new LV with the unused space that is striped, then manually ship data between them, but this seems horribly long winded and full of manual interaction (as against an lv* command to do the block splitting/shifting without interrupting use).

Anyway, some clarifying answers would be wonderful.

Stuart J. Browne
