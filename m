Received: from t500.mbooth (vpn1-4-168.ams2.redhat.com [10.36.4.168])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7O8kvq5026075
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2012 04:46:58 -0400
Message-ID: <50373F81.3080206@redhat.com>
Date: Fri, 24 Aug 2012 09:46:57 +0100
From: Matthew Booth <mbooth@redhat.com>
MIME-Version: 1.0
References: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
	<20120823202737.GA5772@agk-dp.fab.redhat.com>
In-Reply-To: <20120823202737.GA5772@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] dmsetup: fix sscanf return check
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
To: linux-lvm@redhat.com

On 23/08/12 21:27, Alasdair G Kergon wrote:
> On Thu, Aug 23, 2012 at 02:31:02PM +0100, Matthew Booth wrote:
>> -	if (sscanf(ptr, "%llu %llu %s %n",
>> -		   &start, &size, ttype, &n) < 3) {
>> +	if (sscanf(ptr, "%llu %llu %s %n", &start, &size, ttype, &n) != 4) {
>
> Did you test this?

No. My git-fu isn't good enough to point that out in the email without 
cluttering the commit message with it, but I pointed it out on IRC.

> According to the sscanf man page:
>
>         n      Nothing is expected; instead, the number of characters  consumed
>                thus  far  from  the  input  is stored through the next pointer,
>                which must be a pointer to  int.   This  is  not  a  conversion,
>                although  it can be suppressed with the * assignment-suppression
>                character.  The C standard says: "Execution of  a  %n  directive
>                does  not increment the assignment count returned at the comple-
>                tion of execution" but the Corrigendum seems to contradict this.
>                Probably it is wise not to make any assumptions on the effect of
>                %n conversions on the return value.

Thanks for being thorough. I've now made another entry in my mental list 
of surprising interfaces :)

Matt
-- 
Matthew Booth, RHCA, RHCSS
Red Hat Engineering, Virtualisation Team

GPG ID:  D33C3490
GPG FPR: 3733 612D 2D05 5458 8A8A 1600 3441 EA19 D33C 3490
