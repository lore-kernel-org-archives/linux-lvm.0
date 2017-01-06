Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v06KBFjv005388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 6 Jan 2017 15:11:15 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DC1CC04B953
	for <linux-lvm@redhat.com>; Fri,  6 Jan 2017 20:11:14 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 21:11:11 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <20170106191902.GB22165@redhat.com>
References: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
	<20170106191902.GB22165@redhat.com>
Message-ID: <c57da1ffdd757e5968629a2a498fd23a@xenhideout.nl>
Subject: Re: [linux-lvm] how to change UUID of PV of duplicate partition
 (followup)
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
To: Linux lvm <linux-lvm@redhat.com>
Cc: List <list@xenhideout.nl>

David Teigland schreef op 06-01-2017 20:19:
> On Fri, Jan 06, 2017 at 08:10:20PM +0100, Xen wrote:
>> This is what I mean:
>> 
>>   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 
>> not
>> /dev/sdc4
> 
> The handling of duplicate PVs has been entirely redone in recent 
> versions.
> The problems you are having are well known and should now be fixed.

Thank you. I've installed the version from Ubuntu 16.10 and the 
vgimportclone command worked fine now :).

Still gives those same errors mostly (the duplication detection output) 
and provides no other success output that made me a little scared,

   WARNING: PV 3U9ac3-Ah5l-cZUf-03Iw-m0cg-MMaK-xdflg0 on /dev/sdc4 was 
already found on /dev/sdb4.
   WARNING: PV 3U9ac3-Ah5l-cZUf-03Iw-m0cg-MMaK-xdflg0 prefers device 
/dev/sdb4 because device is used by LV.
   WARNING: PV 3U9ac3-Ah5l-cZUf-03Iw-m0cg-MMaK-xdflg0 on /dev/sdc4 was 
already found on /dev/sdb4.
   WARNING: PV 3U9ac3-Ah5l-cZUf-03Iw-m0cg-MMaK-xdflg0 prefers device 
/dev/sdb4 because of previous preference.
   Couldn't find device with uuid ZvvuxB-8sgu-quBO-ZQDW-zKr8-pYzI-qF1ygK.

Particularly because one half of a mirrored LV is always missing :p so I 
get that last line too, but because I don't memorize my PV UUIDs I'm 
always a bit uncertain what it could mean :P.

But the output from lvs indicated that the result was achieved:

   msata-lv coll  -wi-------  28,91g
   raid-lv  coll  -wi------- 464,36g
   msata-lv coll2 -wi-ao----  28,91g
   raid-lv  coll2 -wi-ao---- 464,36g

(I renamed my vgs in reverse after the fact).

The above is a terrible design choice I made lol. Instead of creating an 
extra partition which would have meant an extended partition to hold 2 
distinct PVs, I embedded them in a single partition using a single PV.

The amount of trouble that gives.

Anyway, thank you for your dear answers, previously I was told it was 
all my fault because I was stupid and didn't know how to use the tools 
properly.

So thanks for that, cya.
