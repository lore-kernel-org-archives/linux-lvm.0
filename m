Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62KQ1Yt028383
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 16:26:01 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m62KQ0jl025919
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 16:26:00 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KE8ts-0007SB-OZ
	for linux-lvm@redhat.com; Wed, 02 Jul 2008 21:26:00 +0100
Date: Wed, 2 Jul 2008 21:26:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Is it possible to stripe part of a LV?
Message-ID: <20080702202600.GH22522@agk.fab.redhat.com>
References: <1c748a490807021318l6761d917r27489e2de71c87c0@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c748a490807021318l6761d917r27489e2de71c87c0@mail.gmail.com>
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

lvcreate first part
lvextend -i to add next part

Alasdair
-- 
agk@redhat.com
