Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n5UBkHtk027297
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 07:46:18 -0400
From: Jim Meyering <jim@meyering.net>
Subject: Re: [linux-lvm] S.I. and consistent units
In-Reply-To: <4A48880E.3060703@impulze.org> (Daniel Mierswa's message of "Mon, 
	29 Jun 2009 11:23:26 +0200")
References: <4A46366C.2000607@impulze.org> <4A47F129.7040701@impulze.org>
	<20090629055011.GA14031@maude.comedia.it>
	<4A48880E.3060703@impulze.org>
Date: Tue, 30 Jun 2009 13:46:17 +0200
Message-ID: <87tz1ylzau.fsf@meyering.net>
MIME-Version: 1.0
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

Daniel Mierswa wrote:
> Luca Berra wrote:
>> did not really check all of it, but
>> +               {" Exabyte",  "EiB", "e"},
>> +               {" Petabyte", " PiB", "p"},
>> +               {" Terabyte", " TiB", "t"},
>> +               {" Gigabyte", " GiB", "g"},
>> +               {" Megabyte", " MiB", "m"},
>> +               {" Kilobyte", " KiB", "k"},

You might want to include "YiB" and "ZiB", too, for completeness.
Yobibyte, Zebibyte
