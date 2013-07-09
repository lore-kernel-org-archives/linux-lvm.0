Message-ID: <51DC5995.8090000@redhat.com>
Date: Tue, 09 Jul 2013 20:42:29 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <51DC0E38.7060903@redhat.com>
	<1373392764.87229.YahooMailBasic@web181505.mail.ne1.yahoo.com>
In-Reply-To: <1373392764.87229.YahooMailBasic@web181505.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: matthew patton <pattonme@yahoo.com>

Dne 9.7.2013 19:59, matthew patton napsal(a):
> I don't know the internals of a VMware snapshot (aka journal disk) but what's the impact to writing to an LVM snapshot if the original is never written to again? Think of the original LV as a "golden master" and I create 10 snapshots of it and each DomU is presented with a snapshot device as it's /dev/hda. Does the indirection even work?
>
> I would have thought that the metadata in the snapshot device would have a bitmap (corresponding to specified "page" size) wherein the bitmap completely covered the original device and whenever a write got sent to the base block device (and the original copied to the snap) the flag would get updated such that reads to the snapshot device computes the "page" address of the desired block, checks the flag and if set, reads from the master device, otherwise find it in the snapshot (b-tree search? or hash+linked-list?)
>



As said above:

'Smart and cool' code is thin provisioning
'Old and very simple' is old snapshot code.

And you may try to guess which one of those two is  matching and even 
significantly surpassing your ideas ;)

Zdenel
