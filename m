Received: from [192.168.1.2] (vpn-68-4.surrey.redhat.com [10.32.68.4])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBBADLKB008390
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 10:13:21 GMT
Message-ID: <457D2F40.7060708@redhat.com>
Date: Mon, 11 Dec 2006 10:13:20 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 and OCFS2
References: <c5530b840612090619v2f807944h361a5dc163cb69c4@mail.gmail.com>
In-Reply-To: <c5530b840612090619v2f807944h361a5dc163cb69c4@mail.gmail.com>
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

Michael Lessard wrote:
> Hi Everyboy !
> 
>  I read that LVM2 is not cluster aware (specially with OCFS2) from
> different post on internet forum... If it's true, could someone could
> confirm this information and point me where i can find this affirmation
> in documentention ?
> 
>  I do some test with OCFS2 on LVM2 and it's seems to run correctly , so
> i have some interrogation about this fact !

It's true that lvm is not cluster-aware. What that means is that if you update the volume groups on one node then the other nodes in
the cluster will not see the changes and you could end up with the block devices on the machines dangerously out of sync.

What you tried (it seems to me) is just created LVM volumes and run OCFS2 on them. that /will/ work provided you never change the
volume groups!

To get clustered LVM you need to use clvm (RPM package lvm2-cluster) which synchronises LVM metadata updates across the cluster.
This only works with Red Hat cluster suite though - you would need you write your own cluster management plugin for OCFS2 if you
wanted to use that (hard, but not impossible). Of course, RHCS does offer GFS as the cluster filesystem, if that's what you really need!

-- 

patrick
