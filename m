Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8O4O2r30947
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 00:24:02 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8O4O1eu024948
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 00:24:01 -0400
Received: from corpusic1.corp.emc.com (corpusic1.corp.emc.com
	[168.159.129.100])
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	i8O4NvfF019218
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 00:23:58 -0400 (EDT)
Message-ID: <54E90801719C734E9969C98D40DE1E860836A9F6@corpusmx2.corp.emc.com>
From: lemons_terry@emc.com
Subject: RE: [linux-lvm] Extending a LVM2 strip set
Date: Fri, 24 Sep 2004 00:23:58 -0400
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
To: linux-lvm@redhat.com

MUCH clearer.  Thanks very much for the reply!  If you have The Power,
please consider adding this to the HOWTO document.

Thanks again
tl

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of AJ Lewis
Sent: Thursday, September 23, 2004 2:46 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Extending a LVM2 strip set

lemons_terry@emc.com writes:

> http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html
> <http://www.tldp.org/HOWTO/LVM-HOWTO/mapmode.html>  states:
> 
> "In LVM 2, striped LVs can be extended by concatenating another set of
> devices onto the end of the first set. So you can get into a situation
where
> your LV is a 2 stripe set concatenated with a linear set concatenated with
a
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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
