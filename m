Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s78HwJ3g019684
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2014 13:58:19 -0400
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s78HwHFn026567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 8 Aug 2014 13:58:17 -0400
Received: from [192.168.4.12] (athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	s78HwE54096782
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2014 10:58:16 -0700
Message-ID: <53E50FB7.6020604@tlinx.org>
Date: Fri, 08 Aug 2014 10:58:15 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <53E3CE1C.4050506@tlinx.org>
	<CAE7pJ3BTkSuh9-DB=VR=kiW_ShMdhEO5T_vFWMuZMuEZjgo-RQ@mail.gmail.com>
In-Reply-To: <CAE7pJ3BTkSuh9-DB=VR=kiW_ShMdhEO5T_vFWMuZMuEZjgo-RQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgmerge: "your closed volumes are still
	active"...why?
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
> first merg the two vgs using vgmerge command
---
thanks...urk....ok.. long way around...(want to move a house from one 
city to another,
but first must merge cities, then logical-house-move from one side of 
the city
to the other; then un-annex the old-part of the city)...;-/

Um... trying the merge, I get:

>  sudo vgmerge  -v Data HnS 
    Checking for volume group "Data"
    Checking for volume group "HnS"
  Logical volumes in "HnS" must be inactive
---
Hmm...

>lvs|grep HnS
  Media_Back               HnS     -wi-a----   8.00t
  Sys                      HnS     -wc-a----  96.00g
  Sysboot                  HnS     -wc-a----   4.00g
  Sysvar                   HnS     -wc-a----  28.00g
  Win                      HnS     -wi-a----   1.00t
  oHome                    HnS     -wi-a----   1.00t

I guess they are active.  But if they aren't open, what are they
doing?  And how do I make them inactive (I have a feeling this is
at the root of why lvremove never works without "-f" as well).

'''
