Date: Tue, 15 Mar 2011 13:36:52 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103151021400.25966@bmsred.bmsi.com>
Message-ID: <alpine.LRH.2.00.1103151332400.28041@bmsred.bmsi.com>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D7E68F6.5040700@cox.net> <20110314200057.GB18904@redhat.com>
	<20110315080243.GA14681@nb.net.home>
	<alpine.LRH.2.00.1103151021400.25966@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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

On Tue, 15 Mar 2011, Stuart D. Gathman wrote:

> On Tue, 15 Mar 2011, Karel Zak wrote:
>
>> Some hints:
>> http://karelzak.blogspot.com/2010/05/4096-byte-sector-hard-drives.html
>
> I remember working with 256 byte sector hard drives the size of a mini 
> refrigerator.  512 byte sectors were "advanced format".

More future oriented: I read about high density storage just around the
corner that uses much larger sectors, typically 128K or 256K.  These
are things like holographic memory.  The researchers complain that 
existing filesystems can't handle the large sector size efficiently.  (Don't
know what filesystems they tried.)  I note the similarity between
those sector sizes and flash erase blocks.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
