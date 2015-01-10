Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0AICFEc013113
	for <linux-lvm@redhat.com>; Sat, 10 Jan 2015 13:12:16 -0500
Received: from SMTP.EU.CITRIX.COM (smtp.ctxuk.citrix.com [185.25.65.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0AICCTA028681
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 10 Jan 2015 13:12:14 -0500
From: Thanos Makatos <thanos.makatos@citrix.com>
Date: Sat, 10 Jan 2015 18:12:03 +0000
Message-ID: <2368A3FCF9F7214298E53C823B0A48EC042ECF3F@AMSPEX01CL02.citrite.net>
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] deleted LV recovery: understanding metadata format and
 determining LV extents
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi, I'm working on a case where a bunch of logical volumes were deleted but now we need them back. We have disabled archives and back ups in lvm.conf. They way I am trying to approach the problem is to examine LVM's metadata (the first MB of the block device) and determine whether the extents used by these logical volumes have been assigned to other logical volumes.

I am developing a script (which I hope to upstream) that does that however I need some clarification regarding the meaning of some of the metadata. I have focused on the list of segments in each logical volume definitation but I don't know how to interpret the "stripes" member. These are all linear LVs.

What is this "stripes" member and how is it related to "start_extent" and "extent_count"?
E.g. I have the following two LV definitions (the rest of the metadata is ommitted):

		foo {
			id = "..."
			status = ["READ", "WRITE", "VISIBLE"]
			flags = []
			segment_count = 1
			
			segment1 {
				start_extent = 0
				extent_count = 2
				
				type = "striped"
				stripe_count = 1 # linear
				
				stripes = [
				"pv0", 306705
				]
			}
		}

		bar {
			id = "..."
			status = ["READ", "WRITE", "VISIBLE"]
			flags = []
			segment_count = 9

                        # segments 1-8 ommitted

			segment9 {
				start_extent = 59162
				extent_count = 3662
				
				type = "striped"
				stripe_count = 1 # linear
				
				stripes = [
				"pv0", 246616
				]
			}
		}

I thought that the "stripes" is some extent from which the "start_extent" is calculated but I think I'm wrong because the segments of these two LVs overlap. How can I determine which extents are used by each LV?

Any help greatly appreciated.

--
Thanos Makatos
