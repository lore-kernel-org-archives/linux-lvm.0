Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8Drpr23207
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 08:53:51 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA8DrjBB027389
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 08:53:45 -0500
Date: Mon, 8 Nov 2004 13:53:39 +0000
From: linux-lvm@spam.dragonhold.org
Subject: Re: [linux-lvm] VGs not detected at startup
Message-ID: <20041108135339.GA5797@dragonhold.org>
References: <88707567.20041108091624@stud.fhbb.ch>
	<20041108094008.GA26201@goldfinger.local>
	<1489446547.20041108144631@stud.fhbb.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1489446547.20041108144631@stud.fhbb.ch>
Sender: <gwood@dragonhold.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 08, 2004 at 02:46:31PM +0100, Markus Wiedmer - FHBB wrote:
> I now found a work-around that seems to work so far. In the
> LVM-Start-Script I just put "mount /dev/sda5 || true" before the vgscan. it
> looks like after a mount-command the system suddenly finds the VG.
> strange...

Apologies if this is something that's already been discussed (if so I missed it), and also
for saying something that you've almost definitely covered but......

Check to see if there's any autoloading of modules, or anything, going on as a result of the
mount/fdisk?

Also (instead of the mount) does a 'dd' work?  E.g. dd if=/dev/sda of=/dev/null bs=512
count=1?

That's going to be faster & probably less intrusive.

Graham
