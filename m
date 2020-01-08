References: <20200102191952.1a2c44a7@kaperfahrt.nebelschwaden.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f494aa7f-86bd-68b3-140e-805dccc0dad0@redhat.com>
Date: Wed, 8 Jan 2020 12:29:39 +0100
MIME-Version: 1.0
In-Reply-To: <20200102191952.1a2c44a7@kaperfahrt.nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thinpool metadata got way too large, how to handle?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ede Wolf <listac@nebelschwaden.de>

Dne 02. 01. 20 v 19:19 Ede Wolf napsal(a):
> Hello,
> 
> While having tried to extend my thinpool LV, after the underlying md
> raid had been enlarged, somehow the metadata LV has gotten all the
> free space and now is 2,2 TB in size. Space, that is obviously now
> missing for the thinpool data LV, where it should have gone in first
> place.
> 


Hi

I might guess you were affected by bug in 'percent' resize logic,
that has been possibly addressed by this upstream patch:

https://www.redhat.com/archives/lvm-devel/2019-November/msg00028.html

Although your observed result of having 2.2TB metadata size looks strange - it 
should not normally extend the size of LV to this extreme dimension - unless 
we miss some more context here.

> And since reducing the metadata LV of the thinpool is not possible, I
> am now wondering, what options I may have to reclaim the space for its
> intended purpose?

You can reduce the size of metadata this way:
(It might be in future automated somehow in LV - as there
are further enhancements on thin tools which can make 'reduction' of -tmeta 
size a 'wanted' feature)

For now you need to active thin-pool metadata in read-only mode (so called 
'component activation' (which means no thin-pool nor any thinLV is active - 
only _tmeta LV and it's supported with some recent versions of lvm)
(For older version of lvm2 - you would need to first 'swap-out' existing 
metadata to get access to them)

Then create some 15GiB sized LV  (used as your rightly sized new metadata)
Then run from 2.2T -> 15G LV:

  thin_repair  -i /dev/vg/pool_tmeta -o /dev/vg/newtmeta

This might take some time (depending on CPU speed and disk speed) - and also 
be sure you have  >= 0.8.5 of thin_repair tool (do not try this with older 
version...)


Once this thin_repair is finished - swap in your new tmeta LV:

lvconvert --thinpool vg/pool --poolmetadata vg/newtmeta

And now try to active your thinLVs and check all works.

If all is ok - then you can 'lvremove' now unused  2.2TiB LV  (with the name 
newtmeta -  as  LV content has been swapped - just check with 'lvs -a' output
the sizes are whan you are expecting.

If you are unsure with any step - consult further here your issue please
(better before you do some irreversible mistake).

> Currently I have no extends left - all eaten up by the metadata LV, but
> I would be able to add another drive to enlargen the md raid and
> therefore the PV/VG

You will certainly need at least temporarily some extra space of ~15GiB.

You can try with i.e. USB attached drive - you add such PV into VG (vgextend)

You then create your LV for new tmeta (as described above)

Once you are happy with 'repaired'  thin-pool and your 2.2TiB LV is removed,
then you just 'pvmove' your new tmeta into VG on 'old' storage,
And finally you will simply vgreduce your (now again) unused USB drive.

Hopefully this will work well.

Regards

Zdenek
