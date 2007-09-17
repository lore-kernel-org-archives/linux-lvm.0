Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l8HLJiYW010100
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2007 17:19:44 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IXO0O-0005YE-K1
	for linux-lvm@redhat.com; Mon, 17 Sep 2007 22:19:44 +0100
Date: Mon, 17 Sep 2007 22:19:44 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070917211944.GT18444@agk.fab.redhat.com>
References: <20070907121306.GA27457@heitec.net>
	<20070907175345.GA5931@racke.local>
	<20070910085921.GC22296@heitec.net>
	<20070910171709.GA5117@us.ibm.com>
	<20070911100036.GA26592@heitec.net>
	<20070911101250.GB26592@heitec.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070911101250.GB26592@heitec.net>
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

On Tue, Sep 11, 2007 at 12:12:50PM +0200, Holger Rauch wrote:
> Replying to myself this time :-) Just found out about uuidgen. Would that be
> OK? I'm thinking about invoking pvcreate like this:
> pvcreate --uuid $(uuidgen) /dev/sdb

There's something strange going on here.
The tools should be quite capable of generating a new uuid for you.
Perhaps it's a documentation problem.

Try pvchange -u.

Alasdair
-- 
agk@redhat.com
