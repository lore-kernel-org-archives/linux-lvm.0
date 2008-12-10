Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBANf2MV026360
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2008 18:41:02 -0500
Received: from web38305.mail.mud.yahoo.com (web38305.mail.mud.yahoo.com
	[209.191.125.21])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mBANek9v023164
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2008 18:40:46 -0500
Date: Wed, 10 Dec 2008 15:40:45 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
Subject: Re: FW: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
In-Reply-To: <b072968d0812091511o268e89bamd1cf615a40ea60d3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1844795578-1228952445=:10513"
Message-ID: <383338.10513.qm@web38305.mail.mud.yahoo.com>
Reply-To: beachhangar@yahoo.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-1844795578-1228952445=:10513
Content-Type: text/plain; charset=us-ascii

David - that is a comprehensive treatment of what I have been trying to accomplish - will test it in the next day or two - many thanks!!

--- On Tue, 12/9/08, David Robinson <zxvdr.au@gmail.com> wrote:

From: David Robinson <zxvdr.au@gmail.com>
Subject: Re: FW: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
To: "Alasdair G Kergon" <agk@redhat.com>
Cc: "LVM general discussion and development" <linux-lvm@redhat.com>
Date: Tuesday, December 9, 2008, 3:11 PM

Looks like I'm able to edit the wiki page now - thanks :-)

I went to add Bryn's instructions then discovered that they're already
in the wiki, so I've added an entry to the FAQ briefly explaining the
issue and pointing to the existing page[1]. I added a few new pages
too, one explaining the duplicate PV messages[2], and one for using
LVM with SAN based snapshots[3]. If there's anything incorrect or
unclear in there feel free to fix it or let me know.

The FAQ structure seems a bit strange to me. Would it be worthwhile
moving to a structure like the Cluster FAQ uses[4]? Or even a flat
page like the old cluster FAQ[5] (which I prefer - its easier to
search)?

[1] http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore
[2]
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/FoundDuplicatePV
[3]
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/SANBasedSnapshots
[4] http://sources.redhat.com/cluster/wiki/FAQ/CLVM
[5] http://sources.redhat.com/cluster/faq.html

--Dave

On Sun, Dec 7, 2008 at 10:48 PM, Alasdair G Kergon <agk@redhat.com>
wrote:
> That reply was meant to be addressed to you, not Michael.
>
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



      
--0-1844795578-1228952445=:10513
Content-Type: text/html; charset=us-ascii

<table cellspacing="0" cellpadding="0" border="0" ><tr><td valign="top" style="font: inherit;">David - that is a comprehensive treatment of what I have been trying to accomplish - will test it in the next day or two - many thanks!!<BR><BR>--- On <B>Tue, 12/9/08, David Robinson <I>&lt;zxvdr.au@gmail.com&gt;</I></B> wrote:<BR>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: rgb(16,16,255) 2px solid">From: David Robinson &lt;zxvdr.au@gmail.com&gt;<BR>Subject: Re: FW: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)<BR>To: "Alasdair G Kergon" &lt;agk@redhat.com&gt;<BR>Cc: "LVM general discussion and development" &lt;linux-lvm@redhat.com&gt;<BR>Date: Tuesday, December 9, 2008, 3:11 PM<BR><BR><PRE>Looks like I'm able to edit the wiki page now - thanks :-)

I went to add Bryn's instructions then discovered that they're already
in the wiki, so I've added an entry to the FAQ briefly explaining the
issue and pointing to the existing page[1]. I added a few new pages
too, one explaining the duplicate PV messages[2], and one for using
LVM with SAN based snapshots[3]. If there's anything incorrect or
unclear in there feel free to fix it or let me know.

The FAQ structure seems a bit strange to me. Would it be worthwhile
moving to a structure like the Cluster FAQ uses[4]? Or even a flat
page like the old cluster FAQ[5] (which I prefer - its easier to
search)?

[1] http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore
[2]
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/FoundDuplicatePV
[3]
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions/SANBasedSnapshots
[4] http://sources.redhat.com/cluster/wiki/FAQ/CLVM
[5] http://sources.redhat.com/cluster/faq.html

--Dave

On Sun, Dec 7, 2008 at 10:48 PM, Alasdair G Kergon &lt;agk@redhat.com&gt;
wrote:
&gt; That reply was meant to be addressed to you, not Michael.
&gt;
&gt;

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
</PRE></BLOCKQUOTE></td></tr></table><br>

      
--0-1844795578-1228952445=:10513--
