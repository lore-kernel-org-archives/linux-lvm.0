Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2JIPDbi013340
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 14:25:13 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2JIOg2X026852
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 14:24:42 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m2JIObrS002174
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 14:24:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m2JIObDS013354
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 14:24:37 -0400
Date: Wed, 19 Mar 2008 14:24:23 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Characters allowed for vg name
In-Reply-To: <20080319142144.GG12007@agk.fab.redhat.com>
Message-ID: <Pine.LNX.4.44.0803191420160.12920-100000@bmsred.bmsi.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----

On Wed, 19 Mar 2008, Alasdair G Kergon wrote:

> Pre-existing LVs may be found with these names, and the tools will normally
> cope adequately.  (Internally-generated LVs do use these reserved names -
> that's why they are reserved.)

I think that renaming is an excellent approach.  If a reserved name
is discovered when activating a VG, rename it to something legal but
recognizable.

I remember when this used to cause problems on AIX - because all LVs
had to be unique, so importing a foreign VG would rename all the common
LV names - very annoying.  But this is not a big problem with lvm2 because
only the VG needs to be unique.

- -- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 5.0i for non-commercial use
Charset: noconv

iQEVAwUBR+FaY4JnzZxkHLLFAQH+wAf7BTMrroddkgGBd0VQdBm2AQzZW41h9sIs
6jjdl16qu/InIYtR+gLWmqC3lTHZVLedoHAUOfMRrGWPn8rPOLXOU6VXuCN52nhH
FBk6sxuDEu7a/olvaU3c62AOm/fSvrn4qp884zWk5dHpGDypQpGOczdl4botdafu
CwIt3Ev7wUd5LT1t17/c9yfGG4e4LNf/LE97zGG1pf/IZkidWJHY14WYh2xUqM9P
1/u8aAkp0mD8EwyPTade4Hog2C+QIFrkKeV8oeP3kc9RRiSCz/QdwOmWcExcOJ6h
6Vyox46O5rVs+GYaLdRCcYSb9YcBsoCTUPgOjLeTlBC4YA9rZPJ+QQ==
=BuS8
-----END PGP SIGNATURE-----
