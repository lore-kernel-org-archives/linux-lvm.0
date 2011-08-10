Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7AL0U0X025013
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 17:00:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7AL0T7n015302
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 17:00:30 -0400
Date: Wed, 10 Aug 2011 17:00:11 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E42E454.7000902@redhat.com>
Message-ID: <alpine.LRH.2.00.1108101650150.10808@bmsred.bmsi.com>
References: <883D98939E388E429EE8D771168A6560027EE6AE1D@USCMIMAIL1.corp.amdocs.com>
	<4E42E454.7000902@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] metadata copies
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
Cc: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>

On Wed, 10 Aug 2011, Milan Broz wrote:

> On 08/10/2011 06:30 PM, Jewsco Pius Jacquez wrote:
>> If you have two metadata copies stored in one PV, how does the OS know which
>> one is the legitimate copy?
>
> Only one metadata copy is always active.
>
> There is sequence ID (see seqno = X in metadata backup).
> If there are several PVs and more versions of metadata present, the one with
> highest sequence ID is used and other PVs are automatically updated to this
> version.
>
> Every LVM operation which changes metadata also increases this sequence id.

What happens if there are 2 or more metadata copies with the same sequence 
ID, but different contents?  Not just buggy/malicious code can cause this.
Imagine that a careless admin removes a PV, puts it on another system,
independently updates both systems for a while, then later adds the PV back to
the original system (and the seqnos match).

(Guesses - not authoritative information)

1) I believe the metadata includes a hash/checksum, so that an incomplete
copy of the metadata is easily detected.  (Another reason to have at
least 2 copies - in case of power loss during metadata update.)

2) I suspect there is no clever algorithm, and it probably uses the first
valid copy seen with the highest sequence.  AIX had a "quorum" system 
where the majority of metadata copies had to agree - or operator intervention
was required to bring the VG online.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
