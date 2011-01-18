Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0IIZjNP024798
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2011 13:35:45 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0IIZYFu011834
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2011 13:35:35 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p0IIZXb0021366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2011 13:35:33 -0500
Message-ID: <4D35DD75.2090401@bmsi.com>
Date: Tue, 18 Jan 2011 13:35:33 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>	<20101116062508.GA17499@maude.comedia.it>	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>	<20101118201222.GD30435@agk-dp.fab.redhat.com>	<AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>	<20101118213258.GF30435@agk-dp.fab.redhat.com>
	<AANLkTi=2R_wHqquR1ZhAdRdH3sxke6vg0Auzqy0MDtm_@mail.gmail.com>
In-Reply-To: <AANLkTi=2R_wHqquR1ZhAdRdH3sxke6vg0Auzqy0MDtm_@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Move pvmove questions
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I see the man page has been expanded into steps already.  I added what I
think are helpful amplifications.  What do
you think?  See the original man page reader complaint below.

diff -u -r1.3 pvmove.8.in
--- pvmove.8.in    4 Aug 2009 08:09:52 -0000    1.3
+++ pvmove.8.in    18 Jan 2011 18:30:16 -0000
@@ -40,14 +40,18 @@
 details of all the data movements required.
 
 2. Every logical volume in the volume group is searched
-for contiguous data that need moving
-according to the command line arguments.
-For each piece of data found, a new segment is added to the end of the
-pvmove LV.
+for PEs that need moving according to the command line arguments.  These PEs
+are divided into "segments", runs of physically contiguous data where the PEs
+are adjacent on a PV. For each such run of data found, a new segment is added
+to the end of the pvmove LV.
 This segment takes the form of a temporary mirror to copy the data 
-from the original location to a newly-allocated location. 
+from the original location to a newly-allocated location.  A temporary
+mirror is marked as such in the on disk metadata so that system knows now to 
+finish or undo the pvmove in the event it is interrupted by a system crash.
 The original LV is updated to use the new temporary mirror segment
-in the pvmove LV instead of accessing the data directly.
+in the pvmove LV instead of accessing the data directly, so that any writes
+to the original LV are written to both segments until the temporary mirror
+is syncronized.
 
 3. The volume group metadata is updated on disk.
 
@@ -58,7 +62,8 @@
 5. A daemon repeatedly checks progress at the specified time interval.
 When it detects that the first temporary mirror is in-sync,
 it breaks that mirror so that only the new location for that data gets used 
-and writes a checkpoint into the volume group metadata on disk.
+and writes a checkpoint into the volume group metadata on disk, so that
+the step isn't repeated in the event of a system crash.
 Then it activates the mirror for the next segment of the pvmove LV.
 
 6. When there are no more segments left to be mirrored, 


On 11/18/2010 05:06 PM, Stirling Westrup wrote:
> On Thu, Nov 18, 2010 at 4:32 PM, Alasdair G Kergon <agk@redhat.com> wrote:
>> On Thu, Nov 18, 2010 at 03:40:25PM -0500, Stirling Westrup wrote:
>>> It mentions checkpointing, but gives no further information. It
>>> certainly doesn't say anything about how often they are done, or under
>>> what circumstances.
>> It's in there, but the man page would indeed benefit from more repetition
>> and examples.  Patches welcome!
>>
>>       Every logical volume in the volume group is searched for *contiguous
>>       data* that need moving according to the  command  line  arguments.   For
>>       each  piece  of  data  found,  a new *segment* is added to the end of the
>>       pvmove LV.  This segment takes the form of a *temporary mirror*  to  copy
>>       the data from the original location to a newly-allocated location.
>>
>>       A daemon repeatedly checks progress at the specified time interval.
>>       When it detects that the first *temporary mirror* is in-sync,  it  breaks
>>       that  mirror  so that only the new location for that data gets used and
>>       writes a *checkpoint* into the volume group metadata on  disk.
>>
>> So checkpoint at first daemon check interval after temp mirror in-sync, and
>> one temp mirror per item of contiguous data to be moved.
> The interpretation you give is only possible if one knows what the
> man-page writer means by 'contiguous data', 'segment' and 'temporary
> mirror'. As it was, I didn't and spent some time perusing the man
> pages to find anywhere where these terms are defined, with no luck.
>
> So, yes, the man page definitely needs fixing. And that, perhaps,
> should be done by someone who has a heck of a lot more familiarity
> with the system than I have, or else the resulting man page is likely
> to end up BOTH inadequate and erroneous.
>
> Still, I submit that if the man page needs to talk about checkpoints
> AT ALL, then there needs to be a user method for determining, the
> status of checkpoints during a pvmove.
