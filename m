Message-ID: <5476EE7E.3070501@redhat.com>
Date: Thu, 27 Nov 2014 10:27:26 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1416329721.17053.YahooMailBasic@web181504.mail.ne1.yahoo.com>
	<5471C959.7020301@mglug.de>
In-Reply-To: <5471C959.7020301@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] mixed ssd/disk szenario question: moving lv from
	ssd ->disk?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Oliver Rath <rath@mglug.de>

Dne 23.11.2014 v 12:47 Oliver Rath napsal(a):
> Hi Matthew,
>
> i have to correct my last email: This works also with thinpool-lvs!
> Better said: There was no error message executing  this command. Will
> walk on this way for more reults. Maybe the lvconvert-manpage is outdated?
>
> Tfh!
> Oliver

Hi


I'm somehow missing the point here.

Could you please show us  'lvs -a -o+seg_pe_ranges'

Normally when you make a thin volume snapshot, the snapshot is sharing your 
blocks within thin-pool.  So no space is allocated on any SSD for this.
(And you cannot specify which block will be used in a thin-pool)

If you would be using 'old-snapshot' which does allocate 'extra' space for COW 
block -then you would probably see horrible performance with 200 snapshots...

And finally - standard command for moving extents around in a VG is - 'pvmove'.


Regards

Zdenek
