Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s79Gv8pJ017253
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 12:57:08 -0400
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s79Gv5Lq010098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 12:57:07 -0400
Received: from [192.168.4.12] (athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	s79GuxTJ020019
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 09:57:03 -0700
Message-ID: <53E652DB.9080201@tlinx.org>
Date: Sat, 09 Aug 2014 09:56:59 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <53E3CE1C.4050506@tlinx.org>	<CAE7pJ3BTkSuh9-DB=VR=kiW_ShMdhEO5T_vFWMuZMuEZjgo-RQ@mail.gmail.com>	<53E50FB7.6020604@tlinx.org>
	<CAE7pJ3BX5UK_DscKPMu=8JHFPLz0bJF-m4_nzJh7D5C=0Y6WEg@mail.gmail.com>
In-Reply-To: <CAE7pJ3BX5UK_DscKPMu=8JHFPLz0bJF-m4_nzJh7D5C=0Y6WEg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgmerge & move... done, not bad
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
To: LVM general discussion and development <linux-lvm@redhat.com>

emmanuel segura wrote:
> vgchange -an HnS
>   
When it is usable, it's pretty darn fast... average between 400-500MB/s --
will have to setup a test case to see how fast 'dd' would be.

For comparison using xfsdump/restore on a 7T partition
averaged 216MB/s

(Note, using binary prefixes w/binary units (B=2^3), no
misleading confusion of decimal prefixes on binary units as
comes of 'dd' in this case)

Would be "nicer" if I didn't have to do the vgmerge first
and could do a direct move from oldVG/oldLV => newVG/newLV
(Maintaining assumptions of same-sized allocation units).

Is that planned or is there some technical reason why that
wouldn't be desirable?

Thanks for assist and someone clarifying that
"active" might be better viewed as "available".

Linda
