Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IE7lAn011366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 10:07:47 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAB627EBC0
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 14:07:44 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b328V-0001DF-Sw
	for linux-lvm@redhat.com; Wed, 18 May 2016 14:07:43 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 4792B182F91
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 10:56:51 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 04060-02 for <linux-lvm@redhat.com>;
	Wed, 18 May 2016 10:56:50 -0400 (EDT)
Date: Wed, 18 May 2016 10:56:50 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20160518145650.GA3394@bdmcc-us.com>
References: <20160518002234.GA13276@bdmcc-us.com> <573C6BDF.4090209@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <573C6BDF.4090209@redhat.com>
Subject: Re: [linux-lvm] Unable to find device with UUID XXX.
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 18, 2016 at 03:19:27PM +0200, Marian Csontos wrote:
> On 05/18/2016 02:22 AM, Brian McCullough wrote:
> >I have an issue that I hope that the group can save me from.
> >
> >I ran pvmove for about half of the PVs on the drive that was failing,
> >sending them to the new drive.  All seemed to be well.
> >
> >THEN, the data cable on the old drive ( USB 3 ) was disturbed, and
> >pvmove stopped, complaining that it couldn't see the drive.  OK, I can
> >fix this.  I plugged the cable back in, but things didn't seem to be any
> >better.
> 
> BTW, pvmove is not a data rescue tool. It does not keep persistent log and
> it is necessary to resume synchronization between drives from scratch on
> reboot.
> 
> Use ddrescue to get data from disks with errors.

Thank you.  I have seen recommendations for ddrescue to other people for
"dead drive" situations.  Didn't think that I was there yet.



> >I stopped the system, and rebooted.
> >
> >I have rebooted several times, with not completely consistent results.
> >
> >A couple of times it stopped when it said that it was loading the MD
> >drivers.
> 
> We need to know more to help.

Yes, I know.  That's why I asked, so that you could tell me what I need
to give you.


> Are you using  md raid? If so is not using mdadm to replce and synchronize
> the drive better?

No.  Not on this machine.  I have used LVM on several machines over the
years, with success.  This is the first time that I have tried some of
the "deeper" commands.


> What distribution, version of LVM and kernel?

On the main machine, or the Rescue CD?


> `lsblk` output would help us to see what's there.
> `blkid` output would help us to see other bits and pieces.
> Also `vgs`, `lvs -avo+devices`, `pvs` output, too, please.

OK, I will work on those.



> >When I seem to have got the system booted properly, I do a pvs and it
> >complains about missing UUIDs.
> 
> My guess is some of the PVs (those on the old drive) were marked missing and
> would have to be readded to the VG using `vgextend --restoremissing` before
> you can continue.

OK. I will get the output from the commands above, before I try this.



> Another possibility is, is lvmetad enabled and running?

No, or at least not as far as I know.  I have never intentionally done
so.


> -- Martian


Brian
