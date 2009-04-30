Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3UGHcjs011091
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 12:17:38 -0400
Received: from einhorn.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3UGHNEH001663
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 12:17:24 -0400
Received: from x-berg.in-berlin.de (x-berg.in-berlin.de [217.197.86.33])
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	n3UGHMm4018064
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 18:17:22 +0200
Received: from philipp by x-berg.in-berlin.de with local (Exim 4.69)
	(envelope-from <philipp@ppc.in-berlin.de>) id 1LzYwr-0008Qe-Pu
	for linux-lvm@redhat.com; Thu, 30 Apr 2009 18:17:21 +0200
Date: Thu, 30 Apr 2009 18:17:21 +0200
From: Philipp Schmidt <philipp@ppc.in-berlin.de>
Subject: Re: [linux-lvm] Random file system errors
Message-ID: <20090430161721.GN15637@ppc.in-berlin.de>
References: <003a01c9c7a3$fa10a000$ee31e000$@no>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003a01c9c7a3$fa10a000$ee31e000$@no>
Sender: Philipp Schmidt <philipp@x-berg.in-berlin.de>
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

On 2009-04-28 03:52:23 +0200, Gaute Lund <gaute@idrift.no>
wrote in <003a01c9c7a3$fa10a000$ee31e000$@no>:
> I have searched the web and the mailing list without finding anything
> similar to this.
> 
> The issue: If I md5sum largeish files, or test archives, I sometimes get
> errors or randomly different md5sums. Like now, I have 11 folders, all with
> rar files in parts: some 300 15MB pieces in 6 folders/sets, totaling 4,2GB,
> and 560 50MB pieces in 5 folders/sets, totaling 23G.

I got the same problem about a year ago - I turned out to be a small
incompability between the mainboard and ram...

AVE!
  phils...

-- 
Lbh unir whfg ivbyngrq gur Qvtvgny Zvyraavhz Pbclevtug Npg ol oernxvat gur
cebgrpgvba bs pbclevtugrq zngrevny.  Vs lbh ner abg n pvgvmra be erfvqrag bs
gur HFN, lbh evfx orvat vzcevfbarq naq uryq jvgubhg onvy sbe hc gb gjb jrrxf
hcba ragel gb gur HFN (c) Copyright 2001 by Hartmann Schaffer (signature only)

:wq
