Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0G2JRfV027916
	for <linux-lvm@redhat.com>; Tue, 15 Jan 2008 21:19:27 -0500
Received: from pd3mo1so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0G2IvrU010537
	for <linux-lvm@redhat.com>; Tue, 15 Jan 2008 21:18:57 -0500
Received: from pd3mr2so.prod.shaw.ca
	(pd3mr2so-qfe3.prod.shaw.ca [10.0.141.178]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JUP00L7AT3KB480@l-daemon> for linux-lvm@redhat.com; Tue,
	15 Jan 2008 19:18:56 -0700 (MST)
Received: from pn2ml3so.prod.shaw.ca ([10.0.121.147])
	by pd3mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JUP003AXT3JQ000@pd3mr2so.prod.shaw.ca> for
	linux-lvm@redhat.com; Tue, 15 Jan 2008 19:18:56 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JUP002L3T3JP110@l-daemon> for linux-lvm@redhat.com; Tue,
	15 Jan 2008 19:18:55 -0700 (MST)
Date: Tue, 15 Jan 2008 19:18:54 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C938373C2BE1B6@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] --removemissing explanation
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Referring back to a frantic post I made earlier, if a pv providing extents used in a vg with *some* of those extents used in an lv disappears, why doesn't the removemissing option restore the lv so at least I can salvage what may be left? How can the lv always be no longer available?

Thanks for any clarification!

jlc
