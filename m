Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D34091D9D
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 20:46:29 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 626D6C0467C6
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 20:46:28 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 8DA7C60399
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 16:46:27 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <23015.48541.968752.756192@quad.stoffel.home>
Date: Wed, 18 Oct 2017 16:46:21 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <6067f2f4-587c-cd00-6567-98b8648d463a@yahoo.co.uk>
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
	<alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
	<6067f2f4-587c-cd00-6567-98b8648d463a@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "lejeczek" == lejeczek  <peljasz@yahoo.co.uk> writes:

lejeczek> On 17/10/17 21:57, Stuart D. Gathman wrote:
>> You still haven't said what you are trying to accomplish.� 
>> I wouldn't
>> have bothered responding to such a vague question until 
>> you provided
>> some tantalizing clues.� Until your lastest clues, I would 
>> have advised
>> using rsync or dd to copy your data to a new volume.� But 
>> now it sounds
>> like you ran out of budget for another disk, or need to 
>> minimize down
>> time, and want to reconfigure in place.
>> 

lejeczek> gee, with this much enthusiasm I can imagine you solve many
lejeczek> problems, however I can also imagine at the same time you
lejeczek> create also problems that do not exists.  but honestly &
lejeczek> truthfully appreciate this enthusiasm & help.

Since you provided zero data on your configuration... what else do you expect?

>> First off, raid10 is a linux specialty (I didn't know LVM 
>> supported it,
>> thanks!), and is not the same as raid1+0 (raid1 on top of 
>> raid0).
>> However, your previous clue tells us that probably you 
>> have at least 4
>> disks in your raid10.� So you should be able to remove 2 
>> legs from the
>> raid10, and still have the equivalent of a raid0.� But 
>> this is not
>> certain as raid10 works perfectly well with 2 or 3 disks, 
>> including the
>> redundancy.� In any case, you can remove at least 1 leg 
>> from your
>> raid10.� Be sure to backup first in any case.
>> 
>> Now that you've cut the disk used in half (and your data 
>> is precariously
>> dependent on the health of *both* underlying physical 
>> disks), what did
>> you want to do next?� Maybe you just want to create a 
>> different kind of
>> raid with the released space and do that rsync or dd?
>> 

lejeczek> I'm still looking for an answer - if it's possible then how
lejeczek> to split raid10 into two raid0 LVs(with perhaps having data
lejeczek> intact?)  I've been fiddling with --splitmirrors but either
lejeczek> I got it wrong or I didn't and command just fails.  More
lejeczek> than contemplating theories and general knowledge on raid
lejeczek> I'd prise a lot succinct, concrete info, actuall experience
lejeczek> of "howto".

Have you tried setting up some /dev/loop# devices and re-creating your
setup on smaller devices and trying out various options?

It sounds like you want to take an existing RAID10, remove half the
disks (removing all redundancy) and then rebuilding into a new setup
so you can move the data over?

Even some simple examples of what you have and what you're trying to
accomplish without showing your array names, etc would be a big help.

lejeczek> But I shall now try my fiddling virtualized way, problem at
lejeczek> hand I had, I had to solve different way completely.

I can't make heads or tails of this.  Sorry.
