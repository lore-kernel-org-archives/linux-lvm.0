Received: from fentible.pjc.net (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jAL8kTEj007383
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 08:46:29 GMT
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1Ee7Jl-0007qO-Sm
	for linux-lvm@redhat.com; Mon, 21 Nov 2005 08:46:29 +0000
Message-ID: <43818964.806@redhat.com>
Date: Mon, 21 Nov 2005 08:46:28 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd interface question
References: <437CC1DF.7060306@cup.hp.com> <437D8D72.4050909@redhat.com>
	<ff57449f1c9444ba3e70a4c6cde5cea8@redhat.com>
In-Reply-To: <ff57449f1c9444ba3e70a4c6cde5cea8@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Jonathan E Brassow wrote:
> Also, there is a package called 'magma' that lives in the cluster tree.
>  This is an abstraction layer to different cluster managers and lock
> managers.  It has the ability to accept plugins for different cluster
> managers.  I wonder if it would be useful for clvm to use magma, then
> writing plugins is easy and you never have to touch code that makes use
> of the cluster managers.
> 
> Patrick would know if this is a worthwhile goal.

clvmd uses several cluster manager features that magma doesn't provide - off the
top of my head I can't actually remember what these are as it's been ages since
I did it!

Of course, it's quite probable that magma could be extended to provide these
features.  The main reason it is the way it is is that quite a lot of rewriting
of clvmd would have been necessary for it to fit into magma's model due to the
short-sighted way it (clvmd) was written. In effect the abstraction layer (such
as it is) tries to make gulm look like cman/dlm.

I'm sure it could be done...but it's all time...

-- 

patrick
