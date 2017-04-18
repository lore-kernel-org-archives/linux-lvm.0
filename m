Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B72B71C58
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 15:20:17 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D42BD61D10
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 15:20:15 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v3IEWXqD005048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 10:32:38 -0400
Date: Tue, 18 Apr 2017 10:32:34 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <a371d42c-cba5-1124-53c3-133cdb940cbd@assyoma.it>
Message-ID: <alpine.LRH.2.20.1704181025180.22382@fairfax.gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
	<9b5cd79f258fbb79b7d7e213970b1ae2@xenhideout.nl>
	<e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
	<a371d42c-cba5-1124-53c3-133cdb940cbd@assyoma.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 18 Apr 2017, Gionatan Danti wrote:

> Any thoughts on the original question? For snapshot with relatively big CoW 
> table, from a stability standpoint, how do you feel about classical vs 
> thin-pool snapshot?

Classic snapshots are rock solid.  There is no risk to the origin
volume.  If the snapshot CoW fills up, all reads and all writes to the
*snapshot* return IOError.  The origin is unaffected.

If a classic snapshot exists across a reboot, then the entire CoW table
(but not the data chunks) must be loaded into memory when the snapshot 
(or origin) is activated.  This can greatly delay boot for a large CoW.

For the common purpose of temporary snapsnots for consistent backups,
this is not an issue.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
