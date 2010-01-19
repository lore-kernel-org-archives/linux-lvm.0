Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0JJZ1QM024568
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 14:35:01 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0JJYja6020252
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 14:34:45 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o0JJYiFT028802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 14:34:44 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o0JJYhCA004018
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 14:34:43 -0500
Date: Tue, 19 Jan 2010 14:34:43 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <42784f261001191051o377ba602hf063e01716b1f481@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001191432260.3607@bmsred.bmsi.com>
References: <42784f261001181815y340170dbs4775230080358bc3@mail.gmail.com>
	<20100119033212.GA18351@us.ibm.com>
	<42784f261001191051o377ba602hf063e01716b1f481@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mounting an LVM disk image.
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 19 Jan 2010, Jason Dusek wrote:

>   Although it seems to be a best practice, naming volume groups
>   in a unique way isn't done by default on CentOS -- and I
>   inherited a bunch of CentOS Xen instances on a CentOS Dom0...

Fedora 12 started naming the default VG after the host name.  If the
hostname is given as "fred.example.com" during install, the VG is named
vg_fred by default.  This is a big improvement IMO.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
