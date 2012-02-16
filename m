Date: Thu, 16 Feb 2012 10:18:31 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4F3D15CC.1080901@mohawksoft.com>
Message-ID: <alpine.LRH.2.00.1202161014230.3425@bmsred.bmsi.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
	<4F3D15CC.1080901@mohawksoft.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots
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
Cc: Mike Snitzer <snitzer@redhat.com>

Long ago, Nostradamus foresaw that on Feb 16, Mark Woodward would write:

> I guess I missed that. I need to check out the changes, looks like you have 
> auto-grow with monitoring? I was looking more towards the "snapshots of 
> snapshots" ability. Is that on the radar?

The ZumaStor 3rd party userland tools support that.

An elegant part of the LVM system is that the device mapper kernel support is
very general, and new data structures can be experimented with entirely in user
code - with a script language even.  Metadata for experimental structures does
not have to stored with the main metadata.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
