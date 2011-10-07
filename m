Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p97GGaKQ018824
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 12:16:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p97GGRIx032515
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 12:16:28 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p97GG3eG003159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 12:16:03 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p97GG38E021597
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 12:16:03 -0400
Date: Fri, 7 Oct 2011 12:16:03 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <883D98939E388E429EE8D771168A6560027F611C52@USCMIMAIL1.corp.amdocs.com>
Message-ID: <alpine.LRH.2.00.1110071212530.20223@bmsred.bmsi.com>
References: <883D98939E388E429EE8D771168A6560027F61157F@USCMIMAIL1.corp.amdocs.com>
	<883D98939E388E429EE8D771168A6560027F611931@USCMIMAIL1.corp.amdocs.com>
	<alpine.LRH.2.00.1110051529280.5105@bmsred.bmsi.com>
	<883D98939E388E429EE8D771168A6560027F611C52@USCMIMAIL1.corp.amdocs.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VG is showing resizable/read/write but LV is
 showing NOT available after vgchange
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

On Wed, 5 Oct 2011, Jewsco Pius Jacquez wrote:

> Why would the all LVs under that will show "NOT available"?

You've shown why you believe (quite reasonably) that "vgchange -a y"
succeeded.  You still haven't included whatever you are looking
at that you are interpreting as "showing NOT available".  If you are
not looking at the output of lvs, what *are* you looking at?  And
yes, you must include the output of whatever you are looking at.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
