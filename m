Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6DFe7sc028931
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 11:40:09 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6DFdxNi018994
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 11:39:59 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p6DFdm3E027318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 11:39:48 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p6DFdmsC028792
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 11:39:48 -0400
Date: Wed, 13 Jul 2011 11:39:48 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E1D77A7.4030801@tlinx.org>
Message-ID: <alpine.LRH.2.00.1107131137130.28748@bmsred.bmsi.com>
References: <4E1A526F.9090700@tlinx.org>
	<20110711025811.GF7857@agk-dp.fab.redhat.com>
	<4E1D77A7.4030801@tlinx.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Inconsistent naming...?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 13 Jul 2011, Linda A. Walsh wrote:

>   Roughly, if I give a script the mount point of a logical device, how can I 
> find
> out the name of the LV it is on?
>
>   Before I stumbled upon this quote-hack, I could look the mount point in
> /proc/mounts and get the dev name.

I apologize for not being more helpful and actually posting such a script
(would be happy to do so when I find the link to the quoting spec),
but I would write a python script (or even a C program in the unlikely event
it becomes a bottleneck) to quote/unquote lv names.  Use that
in your shell scripts to get the dev name.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
