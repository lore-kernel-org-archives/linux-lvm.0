Date: Tue, 9 Dec 2008 11:56:51 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] shift PV from disk to raid device?
In-Reply-To: <Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.0812091156260.16428@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
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
Cc: maillists@conactive.com

On Tue, 9 Dec 2008, Stuart D. Gathman wrote:

> Here are the steps that I see:
> 
> 1) remove sda from md2 array
> 2) use dd or pvremove to clear PV info in md2.  This should not
>    affect sda since sda is removed from md2
> 3) pvcreate md2 as a new PV and add to volume group
> 4) pvmove sda -> md2.  The data should physically go on sdb, or whatever the
>    other mirror of md2 is.
> 5) check that all LVs are gone from sda, and remove from volume group
> 6) pvremove sda
> 7) add sda to md2 array, and synchronize.
> 
> Did I miss anything?

Oh yeah:

0.5) Backup everything just in case

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
