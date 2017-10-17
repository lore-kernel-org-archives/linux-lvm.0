Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D503863F98
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 09:04:12 +0000 (UTC)
Received: from sonic309-24.consmr.mail.ir2.yahoo.com
	(sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C63BDC0587C6
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 09:04:05 +0000 (UTC)
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
Date: Tue, 17 Oct 2017 10:03:58 +0100
MIME-Version: 1.0
In-Reply-To: <23013.8606.182033.796766@quad.stoffel.home>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 16/10/17 22:16, John Stoffel wrote:
> lejeczek> I'm sroogling and reading but before spend whole day doing
> lejeczek> that, I was hoping you guys, gals, done conversion from
> lejeczek> raid10?
>
> Please post your configuration and explain what you're trying to do in
> more detail.
>
> lejeczek> I'm thinking best(natural?) would be to convert to two raid0
> lejeczek> LVs, right. Am I right? Would it be optimal, and how do you
> lejeczek> do it?
>
> You don't put LVs directly ontop of RAID0, you put them in VGs, which
> reside in PVs, which reside on disks or RAIDs, or iSCSI LUNs, etc.
>
> It sounds like you have two filesystems, each in their own LV.  You
> want to move them off a RAID10 (four disks, in two mirrored PAIRS,
> stripped across them is what I assume), because why?
>
> Give more details.  You do realize that while you will gain space, you
> will lose reliability with RAID0, if one disk fails, all your data is
> gone.
>
> John
no other raids but LVM's own.
not much in configuration, unless I misunderstand, question 
I'm posing is simple - is it possible to convert/split lvm 
raid10 LV into two raid0 LVs? (here one thing comes to mind: 
data stays intact?) Or raid10 LV to any other raid?

As I sroogled I saw there is "mirror spitting" but term 
raid10 does not appear in that context, or I failed to find it.

But man pages also mention, with regards to raid takeover:
"..
        ·  between striped/raid0 and raid10.
..."
So it sounds like possible(so no other raid levels but these 
two), only might be intricate process/procedure, which is 
not documented, or again, I failed to find it.


>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
