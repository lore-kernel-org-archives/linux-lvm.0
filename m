Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3RD3Gr0002946
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 09:03:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3RD37FH029432
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 09:03:08 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3RD35QB013823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 09:03:05 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3RD34vl004927
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 09:03:05 -0400
Date: Wed, 27 Apr 2011 09:03:04 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1104270900180.4872@bmsred.bmsi.com>
References: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
	<alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
	<BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
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

On Tue, 26 Apr 2011, Chris Streeter wrote:

>> What you *should* have done is restore the metadata to the point before
>> your errant command.  You can still do that (if it is still in the archive),
>> but the several K of zeros written to the start of the LV you created will
>> require recovery.
>
> So I still have all the files in the archive of the form raid_vg_0000*.vg
>
> If have those files, how would I go about restoring the metadata to
> the device? If I were to loose several K of data, I'm totally fine
> with that.

man vgcfgrestore

I believe you want 
# vgcfgrestore -f /path/to/archived/metadata raid_vg

The '-l' option should list available archives if vg is still live.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
