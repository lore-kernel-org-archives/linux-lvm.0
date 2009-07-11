Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6BANwJQ010111
	for <linux-lvm@redhat.com>; Sat, 11 Jul 2009 06:23:58 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6BANdSB012941
	for <linux-lvm@redhat.com>; Sat, 11 Jul 2009 06:23:39 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 3E1472804A68
	for <linux-lvm@redhat.com>; Sat, 11 Jul 2009 12:23:38 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 09AF92804A67
	for <linux-lvm@redhat.com>; Sat, 11 Jul 2009 12:23:38 +0200 (CEST)
Message-Id: <2868094B-843D-47D9-BDBB-78C2408F5AC4@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Sat, 11 Jul 2009 12:23:37 +0200
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Aligning PVs on SSDs?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

I came across an article on http://thunk.org/tytso/blog/2009/02/20/aligning-filesystems-to-an-ssds-erase-block-size/ 
  about filesystem alignment. This mentions some issues about aligning  
PVs in 128k bounderies. See snipped-out text from the article below.

Are there flags like these or similar in helping admins using SSDs  
more efficiently?

roy

> ...
> So I created a 1 gigabyte /boot partition as /dev/sdb1, and  
> allocated the rest of the SSD for use by LVM as /dev/sdb2. And  
> that’s where I ran into my next problem. LVM likes to allocate 192k  
> for its header information, and 192k is not a multiple of 128k. So  
> if you are creating file systems as logical volumes, and you want  
> those volume to be properly aligned you have to tell LVM that it  
> should reserve slightly more space for its meta-data, so that the  
> physical extents that it allocates for its logical volumes are  
> properly aligned. Unfortunately, the way this is done is slightly  
> baroque:
>
> # pvcreate –metadatasize 250k /dev/sdb2
> Physical volume “/dev/sdb2″ successfully created
>
> Why 250k and not 256k? I can’t tell you — sometimes the LVM tools  
> aren’t terribly intuitive. However, you can test to make sure that  
> physical extents start at the proper offset by using:
>
> # pvs /dev/sdb2 -o+pe_start
> PV         VG   Fmt  Attr PSize  PFree  1st PE
> /dev/sdb2       lvm2 –   73.52G 73.52G 256.00K
>
> If you use a metadata size of 256k, the first PE will be at 320k  
> instead of 256k. There really ought to be an –pe-align option to  
> pvcreate, which would be far more user-friendly, but, we have to  
> work with the tools that we have. Maybe in the next version of the  
> LVM support tools….
> ...
--
Roy Sigurd Karlsbakk
(+47) 97542685
roy@karlsbakk.net
http://blogg.karlsbakk.net/
--
I all pedagogikk er det essensielt at pensum presenteres  
intelligibelt. Det er et elementært imperativ for alle pedagoger å  
unngå eksessiv anvendelse av idiomer med fremmed opprinnelse. I de  
fleste tilfeller eksisterer adekvate og relevante synonymer på norsk.
