Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i8NIjrck019297
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 14:45:53 -0400
Sender: alewis@redhat.com
Subject: Re: [linux-lvm] Extending a LVM2 strip set
References: <mailman.2865.1095960324.3231.linux-lvm@redhat.com>
From: AJ Lewis <alewis@redhat.com>
Date: 23 Sep 2004 13:45:52 -0500
In-Reply-To: <mailman.2865.1095960324.3231.linux-lvm@redhat.com>
Message-ID: <x05k6ukomcf.fsf@null.msp.redhat.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

lemons_terry@emc.com writes:

> http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html
> <http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html>  states:
> 
> "In LVM 2, striped LVs can be extended by concatenating another set of
> devices onto the end of the first set. So you can get into a situation where
> your LV is a 2 stripe set concatenated with a linear set concatenated with a
> 4 stripe set. Are you confused yet?"
> 
> As a matter of fact, I am!
> 
> I need to start with a 2 disk (therefore, 2 stripe) logical volume, that I
> later extend with 2 more disks.  How is this done?

In lvm2 you simply create the lv with a stripe size of 2, then later
when you want to extend it, you lvextend it with a stripe size of 2.
The reason this is explained in so much detail is that in LVM1, you
could not extend a striped set past its original PVs.  In LVM2, the
original striped set can be extended to the end of the original PVs,
and any additional PVs become a striped set that is tacked on to the
end (concatenated).

Maybe an ACSII picture can help ;)

Original striped volumes:
 ___   ___
| 1 | | 2 | 
| 3 | | 4 |
|_5_| |_6_|

After adding two more disks and lvextending:
 ___   ___   ___   ___
| 1 | | 2 | | 7 | | 8 | 
| 3 | | 4 | | 9 | | 10|
|_5_| |_6_| |_11| |_12|


So you have 2 sets of striped segments (with 2 stripes each),
concatenated together.  It does *not* remap all the striping so you
have 1 set of striped segments (with 4 stripes each).

Is that any clearer?
-- 
AJ Lewis Voice: 612-638-0500 Red Hat Inc.  E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200 Minneapolis, MN 55414
   
Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
